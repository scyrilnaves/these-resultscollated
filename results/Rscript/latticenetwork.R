#install.packages("igraph")
library(igraph)

#https://kateto.net/netscix2016.html

g <-
  graph(
    edges = c(1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,1),
    n = 10,
    directed = F
  )

g1 <- make_lattice(length = 10, dim = 1,nei=2)
plot(
  main = "Lattice Network",
  edge.arrow.size = .2,
  edge.curved = 0,
  
  vertex.color = "lightblue",
  g1
)

dev.copy(svg, filename = '/home/renault/Documents/code/results/Rscript/plots/latticenetwork.svg')

dev.off ()