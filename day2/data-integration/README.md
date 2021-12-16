# Intro

We will see how methods like MOFA and WNN can be useful when analysing multimodal datasets. We will use [muon](https://github.com/PMBio/muon) as a convenient interface for multimodal integration.

# Methods

## Brief methods overview

- Matrix factorisation, MOFA
- Graph-based, WNN, SNF
- NN/DL-based (TotalVI, GLUE, mira)

## MOFA training

We will see how a MOFA model can be trained on a single-cell multimodal dataset. We will discuss what steps will help to train the model faster.

For the downstream analysis, we will use a model pre-trained on the data discussed [in the previous practical](../data-handling).

TODO:

- demo notebook
- pre-trained model for multiome and/or
- pre-trained model for CITE-seq data

## MOFA model interpretation

We will see how variance explained, factor, loading and other plots can be useful to interpret the trained model.

We will mention how `MOFA2` (in R) or `mofax` (in Python) can be of help when interrogating the model.

TODO:

- demo notebook (same)

