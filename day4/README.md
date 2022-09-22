# Day 4: Pathway informed factor models

*Duration*: 1h + 1h

## Summary

Today we will learn how to integrate domain knowledge into multi-omics factor models. In particular, we will get familiar with [MuVI](https://github.com/MLO-lab/MuVI), a multi-view statistical model that utilizes the prior information from gene set annotations, e.g. pathways, to describe the observed data in terms of pre-tagged axes of variation. We will explore how different gene set collections present different explanations of the data and provide tools for tailoring the prior information to the task at hand. In a downstream analysis, we will then focus on the relevant pathways that drive the heterogeneity in the data, compare the validity of the method with enrichment analysis, correlate pathways of interest with known meta information, and inspect individual factors for potential refinement of the prior annotations. Finally, participants are encouraged to apply MuVI to other datasets and extend the current analysis of their data.

## Outline

1. Install the [MuVI](https://github.com/MLO-lab/MuVI) Python package by running `python3 -m pip install git+https://github.com/MLO-lab/MuVI.git`.
2. Download the `MuData` file from the S3 bucket `day4/data/pbmc10k_subset_embo.h5mu`, and store it inside the `data` folder.
3. Download the `MuVI` models (directories) from the S3 bucket `day4/muvi_model` and `day4/muvi_model_cell_type` (optional).
4. Check out [the main tutorial](pathway-informed_single-cell_multi-omics_integration.ipynb) on how to apply `MuVI` to the 10k PBMCs dataset (see day2) by incorporating well-established sources of gene set annotations such as [MSigDB](https://www.gsea-msigdb.org/gsea/msigdb) into the training process.
5. Have a look at [this tutorial](pathway-informed_single-cell_multi-omics_integration_cell-type.ipynb) on how to customize the prior information to obtain a different explanation of the data, e.g. cell type information.
6. Apply `MuVI` to other datasets and extend the current analysis of your data!
