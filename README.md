# Magma: A Ground-Truth Fuzzing Benchmark

The documentation has been moved to [the Magma homepage](https://hexhive.epfl.ch/magma).

This repository is a revised version of the Magma framework, which now includes GPU support and an updated AFL++ version. The framework is containerized using Docker to simplify the setup and execution process.

## Overview

Magma is a comprehensive framework designed for fuzz testing, providing tools and utilities to enhance the fuzzing process. In this revision, we have:

- Added GPU support to the Magma framework.
- Updated the AFL++ version.

"""Note""": Magma reley on docker as container for experiment, which need git repo specification for set up. We removed the specification of git repository for LLAMAFUZZ to ensure anonymity in reviews. To run the LLAMAFUZZ, you need to add them back.
## LLAMAFUZZ Implementation

LLAMAFUZZ is implemented in three different contexts to handle various types of seeds:

- /fuzzers/aflpp_llm_b/: Implementation of LLAMAFUZZ for binary-based seeds.
- /fuzzers/aflpp_llm_poppler/: Implementation of LLAMAFUZZ for the Poppler program.
- /fuzzers/aflpp_llm_t/: Implementation of LLAMAFUZZ for text-based seeds.