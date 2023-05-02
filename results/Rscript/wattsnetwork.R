#install.packages("igraph")
library(igraph)

#https://kateto.net/netscix2016.html

g <-
  graph(
    edges = c(10,3,1,5,2,8,3,9,4,7,5,10,6,1,7,10,8,1,9,2),
    n = 10,
    directed = F
  )
#sample_smallworld(dim, size, nei, p, loops = FALSE, multiple = FALSE)

g1 <- sample_smallworld(1, 10, 2, 0.05)

plot(
  main = "Watts Strogatz Network",
  edge.arrow.size = .2,
  edge.curved = 0,
  
  directed = T,
  
  vertex.color = "lightblue",
  g1
)


dev.copy(svg, filename = '/home/renault/Documents/code/results/Rscript/plots/wattsstrogatznetwork.svg')

dev.off ()
