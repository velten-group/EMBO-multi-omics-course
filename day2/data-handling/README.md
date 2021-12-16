# Intro

We will see how [muon](https://github.com/PMBio/muon) can be useful for handling multimodal datasets.

# Data

Firstly, we will go through a short overview of common single-cell multi-omics datasets, which allow to profile different aspects of cell biology.

Secondly, we will see how we can obtain and load public datasets, and how we can benefit from the [`mudatasets`](https://github.com/PMBio/mudatasets) library.

Then we'll experience how `muon` workflow allows to conveniently analyse individual modalities as well as prepare for and perform multimodal integration.

TODO:

- multiome demo notebook
- cite-seq demo notebook (same)

## Multimodal omics datasets overview

- Multiome (RNA+ATAC)
- CITE-seq (RNA+PROT)
- scNMT-seq (RNA+METH+accessibility)

## Multiome data

- [muon multiome tutorials](https://muon-tutorials.readthedocs.io/en/latest/single-cell-rna-atac/index.html)
- [3k healthy brain cells](https://www.10xgenomics.com/resources/datasets/frozen-human-healthy-brain-tissue-3-k-1-standard-2-0-0) from 10X Genomics
- Other brain datasets, e.g. [Trevino2021](https://www.sciencedirect.com/science/article/abs/pii/S0092867421009429)

## CITE-seq data

- [muon CITE-seq tutorials](https://muon-tutorials.readthedocs.io/en/latest/cite-seq/index.html)
- Other CITE-seq datasets, e.g. [Triana2021](https://www.nature.com/articles/s41590-021-01059-0)

