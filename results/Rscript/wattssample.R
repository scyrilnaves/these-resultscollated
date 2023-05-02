#install.packages("igraph")
library(igraph)

#https://kateto.net/netscix2016.html



#g <- sample_smallworld(1, 10, 2, 0.05)

g <- make_lattice(length = 10, dim = 1)


plot(
  main = "Watts Strogatz Network: Mean Degree =4",
  edge.arrow.size = .2,
  edge.curved = 0,
  
  vertex.color = "lightblue",
  g
)


#dev.copy(svg, filename = '/home/renault/Documents/code/results/Rscript/plots/wattsstrogatznetwork.svg')

#dev.off ()