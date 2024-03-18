#!/bin/bash

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env SHARED: path to directory shared with host (to store results)
# - env PROGRAM: name of program to run (should be found in $OUT)
# - env ARGS: extra arguments to pass to the program
# - env FUZZARGS: extra arguments to pass to the fuzzer
##

if nm "$OUT/afl/$PROGRAM" | grep -E '^[0-9a-f]+\s+[Ww]\s+main$'; then
    ARGS="-"
fi

mkdir -p "$SHARED/findings"

flag_cmplog=(-m none -c "$OUT/cmplog/$PROGRAM")

export AFL_SKIP_CPUFREQ=1
export AFL_NO_AFFINITY=1
export AFL_NO_UI=1
export AFL_MAP_SIZE=16777216
# export AFL_DRIVER_DONT_DEFER=1
# export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_CUSTOM_MUTATOR_LIBRARY="$FUZZER/repo/custom_mutators/aflpp/aflpp-mutator.so"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-11.8/lib64"
export AFL_KILL_SIGNAL=9
# --fuzzing_object 'bignum'
accelerate launch --mixed_precision fp16 "$FUZZER/repo/structureLLM/llama2_mutator.py" --fuzzing_target 'libxml' --if_text True &

sleep 240 && "$FUZZER/repo/afl-fuzz" -i "$TARGET/corpus/$PROGRAM" -o "$SHARED/findings" \
    "${flag_cmplog[@]}" -d \
    $FUZZARGS -- "$OUT/afl/$PROGRAM" $ARGS 2>&1 &