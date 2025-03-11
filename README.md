# Yet Another JSON Schema Corpus

Claire Yannou-Medrala and Fabien Coelho

This repository contains, directly and indirectly, all schemas analyzed in
"An Analysis of Defects in Public JSON Schemas", Tech. Report A/794/CRI,
Mines Paris - PSL [link](https://minesparis-psl.hal.science/hal-04415517/file/A-794-DepotHAL.pdf).

## Installation

```sh
git clone https://github.com/clairey-zx81/yac yac
cd yac
git submodule update --init
```

## Contents

- [analysis_extract.sh](analysis_extract.sh)
  `jq` script which extracts all samples shown in the paper.

## TODO

- return stats after updates
