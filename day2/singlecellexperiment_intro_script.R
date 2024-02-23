
sce <- TENxPBMCData::TENxPBMCData("pbmc4k")
sce
print(sce)

# sce is like a matrix
nrow(sce)
ncol(sce)
dim(sce)
head(rownames(sce))
head(colnames(sce))

sce["ENSG00000243485",1:5]

# Access data inside the object
assayNames(sce)
assay(sce, "counts")
counts(sce)
colData(sce)
rowData(sce)

colData(sce) |> tibble::as_tibble()
metadata(sce)


# Work with counts
counts_per_cell <- MatrixGenerics::colSums2(counts(sce))
hist(counts_per_cell, breaks = 100)

# Replace delayed counts
counts(sce) <- as.matrix(counts(sce))
counts(sce) <- as(counts(sce), "dgCMatrix")


# Preprocessing
sce <- scater::logNormCounts(sce)
sce <- scater::runPCA(sce, ncomponents = 50)
sce <- scater::runUMAP(sce, dimred = "PCA")
scater::plotReducedDim(sce, "UMAP")


# Quality control (doesn't work yet!)
is.mito <- any(seqnames(location)=="MT")
df <- perCellQCMetrics(sce.416b, subsets=list(Mito=is.mito))
summary(df$sum)

