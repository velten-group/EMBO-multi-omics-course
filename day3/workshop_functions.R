getNeighbourMean = function(spe,
                            assayName = "counts",
                            spatialReducedDim = "spatial",
                            kval = 5,
                            includeSelf = FALSE,
                            concatenate_rownames = "_neighbours") {
  
  require(BiocNeighbors)
  
  p = nrow(spe)
  
  knn = queryKNN(reducedDim(spe, spatialReducedDim),
                 reducedDim(spe, spatialReducedDim),
                 k = kval + 1)
  
  # average over the neighbours expression
  if (includeSelf) {
    knn_indices = c(t(knn$index))
    kval <- kval + 1
  } else {
    knn_indices = c(t(knn$index[,-1]))
  }
  
  knn_counts = t(assay(spe, assayName))[knn_indices,]
  knn_counts_long = as.vector(t(knn_counts))
  knn_split = rep(seq_len(ncol(spe)), each = kval*p)
  knn_mats_long = split(knn_counts_long, knn_split)
  gene_split = rep(seq_len(p), times = kval)
  knn_exprs = lapply(knn_mats_long, function(mat){
    gene_values = split(mat,gene_split)
    gene_means = unlist(lapply(gene_values, sum))
  })
  knn_mean_counts = t(do.call(rbind, knn_exprs))
  rownames(knn_mean_counts) <- rownames(spe)
  colnames(knn_mean_counts) <- colnames(spe)
  
  rownames(knn_mean_counts) <- paste0(rownames(knn_mean_counts), concatenate_rownames)
  
  return(knn_mean_counts)
}

plotReducedDimGirafe = function(sce, reducedDimNames = c("spatial", "UMAP"), point_size = 0.01) {
  
  require(ggiraph)
  require(patchwork)
  require(ggplot2)
  
  df = as.data.frame(colData(sce))
  if (!"uniqueID" %in% colnames(df)) {
    df$uniqueID <- seq_len(nrow(df))
  }
  
  df$rd1_1 = reducedDim(sce, reducedDimNames[1])[,1]
  df$rd1_2 = reducedDim(sce, reducedDimNames[1])[,2]
  
  df$rd2_1 = reducedDim(sce, reducedDimNames[2])[,1]
  df$rd2_2 = reducedDim(sce, reducedDimNames[2])[,2]
  
  g1 = ggplot(df, aes(x = rd1_1, y = rd1_2)) + 
    geom_point_interactive(aes(tooltip = uniqueID, data_id = uniqueID), size = point_size,
                           colour = "grey") +
    theme_classic() +
    theme(legend.position = "none") + 
    coord_fixed() +
    xlab(paste0(reducedDimNames[1], " 1")) + 
    ylab(paste0(reducedDimNames[1], " 2")) + 
    NULL
  
  g2 = ggplot(df, aes(x = rd2_1, y = rd2_2)) + 
    geom_point_interactive(aes(tooltip = uniqueID, data_id = uniqueID), size = point_size,
                           colour = "grey") +
    coord_fixed() +
    theme_classic() +
    theme(legend.position = "none") + 
    xlab(paste0(reducedDimNames[2], " 1")) + 
    ylab(paste0(reducedDimNames[2], " 2")) + 
    NULL
  
  out = girafe(code = print(g1 + g2), width_svg = 8, height_svg = 4, options = list(
    opts_hover(css = "fill:#FF3333;stroke:black;cursor:pointer;size:0.0001", reactive = TRUE),
    opts_selection(type = "multiple", css = "fill:#FF3333;stroke:black;", only_shiny = FALSE)
  ))
  
  return(out)
}
