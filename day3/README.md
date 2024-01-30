# Day 3: Integrative analysis of droplet-based single-cell and spatial data

_Topics_: spatial data, pre-processing, scRNA-seq, horizontal/batch integration, data visualisation, mosaic integration
_Duration_: 3x 1h

## Install instruction

Create a new virtutal environment using your favorite package manager (e.g. Conda or Mamba).

```
mamba create --prefix $HOME/conda-py310 python==3.10 jupyter jupyterlab spatialdata scanpy scikit-misc scib-metrics scvi-tools scanorama harmonypy bbknn
```

Activate the environment.

```
source activate $HOME/conda-py310
```

Start `jupyter lab` in the folder where you have downloaded the course materials.

```
jupyter lab
```

## Outline

### Part 1: Introduction to `spatialdata` (Elyas Heidari)

### Part 2: Horizontal data integration (Harald Vöhringer)

This notebook demonstrates the integration of Xenium and scFFPE-seq data from a serial formalin-fixed, paraffin-embedded (FFPE) human breast cancer section. We first analyse both datasets independently and perform mild preprocessing of the data. Then, we apply a range of different integration tools to jointly embed the data on the set of genes which are present in both datasets.

### Part 3: Mosaic integration (Shila Ghazanfar)
