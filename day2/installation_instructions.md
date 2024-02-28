
# Installation instructions

In this workshop we will use two ecosystems for single-cell data analysis. The first one is [Seurat](https://satijalab.org/seurat/), and the second one is a combination of packages from the [Bioconductor ecosystem](https://bioconductor.org/books/release/OSCA/). Note that these installation instructions have been tested with R>=4.3

First, install some basic R packages that are available via CRAN:
```
# install.packages("devtools", "ggplot2", "cowplot", "tidyverse", "harmony", "uwot")
install.packages(c("devtools", "ggplot2", "tidyverse"))
```

Second, install Seurat and Signac, two of the most commonly used R packages for scRNA-seq and scATAC-seq analysis, respectively. Note that these packages have lots of dependencies.
```
install.packages("Seurat")
install.packages("Signac")
```

Third, install R packages for single-cell data analysis that are available via Bioconductor.
```
install.packages("BiocManager")
BiocManager::install(c("EnsDb.Hsapiens.v86","SingleCellExperiment", "scater", "scran", "batchelor", "lemur"))
```

Finally, let's install some more R packages that provide the data sets. Ideally you should be able to download the data sets from R itself, but if you have problems installing or downloading let us know and we can find another way to provide the data sets to you.
```
devtools::install_github('satijalab/seurat-data')
install.packages("pbmcMultiome.SeuratData", repos="http://seurat.nygenome.org/", type = "source")
BiocManager::install("muscData")
```

After the installation is finished, try to load all libraries from R as follows:
```
# basic R packages
library(ggplot2)
library(tidyverse)

# Seurat and Signac
library(Seurat)
library(SeuratData)
library(Signac)

# Bioconductor packages
library(EnsDb.Hsapiens.v86)
library(SingleCellExperiment)
library(scater)
library(scran)
library(batchelor)
library(lemur)

# Data sets
LoadData("pbmcMultiome.SeuratData", "pbmc.rna")
LoadData("pbmcMultiome.SeuratData", "pbmc.atac")
muscData::Kang18_8vs8()
```

