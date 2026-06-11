plot_pontos_3d <- function(x, y, z) {
  
  # Garante que os três vetores tenham o mesmo tamanho
  if (length(x) != length(y) || length(y) != length(z)) {
    stop("Os vetores x, y e z precisam ter exatamente o mesmo tamanho!")
  }
  
  # Cria o gráfico de dispersão 3D
  p <- plot_ly(x = ~x, y = ~y, z = ~z) %>%
    add_trace(
      type = "scatter3d", 
      mode = "markers",
      marker = list(
        size = 5, 
        color = ~z,            # A cor do ponto muda de acordo com a altura Z
        colorscale = "Viridis", # Degradê de cores elegante
        line = list(color = "rgb(255,255,255)", width = 0.5)
      )
    ) %>%
    layout(
      scene = list(
        xaxis = list(title = "Eixo X"),
        yaxis = list(title = "Eixo Y"),
        zaxis = list(title = "Eixo Z")
      ),
      margin = list(l = 0, r = 0, b = 0, t = 0) # Remove bordas brancas sobressalentes
    )
  
  return(p)
}


plot_residuos_preditores <- function(modelo, dataset) {
  
  residuos <- resid(modelo)
  dataset_sincronizado <- dataset[names(residuos), , drop = FALSE]
  
  vars_na_formula <- all.vars(formula(modelo))
  nome_resposta <- vars_na_formula[1]
  
  preditores <- intersect(names(dataset_sincronizado), vars_na_formula[-1])
  
  n_pred <- length(preditores)
  if(n_pred == 0) stop("Nenhum preditor encontrado no dataset fornecido.")
  
  par(mfrow = c(ceiling(n_pred/3), 3), mar = c(4, 4, 3, 1))
  
  for (variavel in preditores) {
    x_val <- dataset_sincronizado[[variavel]]
    
    plot(x_val, residuos,
         main = paste("Resíduos vs", variavel),
         xlab = variavel,
         ylab = "Resíduos",
         pch = 19, 
         col = rgb(0.1, 0.2, 0.5, 0.5)) 
    
    abline(h = 0, col = "red", lwd = 2, lty = 2)
    
    if(is.numeric(x_val) && length(unique(x_val)) > 2) {
      lines(lowess(x_val, residuos), col = "darkgreen", lwd = 2)
    }
  }
  
  par(mfrow = c(1, 1))
}