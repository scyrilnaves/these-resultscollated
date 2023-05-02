#install.packages("ggplot2")
library(ggrepel)
library(ggplot2)
library(data.table)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L
###########

input_data <-
  read.csv(file = '/home/renault/Documents/code/results/datamarket/Rscript/csvdata/combineforks.csv')

input_data$Forks <-
  as.numeric(input_data$Forks)

input_data$Forks

#head(input_data)
ggplot(data = input_data, aes(x = Nodes, y = Forks)) + geom_line(aes(colour =
                                                                                Type)) + ylim(1, 12) + geom_point() + geom_text_repel(aes(label = round(Forks, 1))) +
  annotate(
    "text",
    size = 3,
    x = 10,
    y = 10,
    color = "blue",
    label = "Total Transactions= 50000 \nMax BlockSize = 5MegaBytes \nAuRaBlockPeriod = 6 seconds \nBABEBlockPeriod = 90 seconds \nTPS-Transaction Per Second ",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(1, 12), clip = "off") + theme(
    axis.text = element_text(colour = "blue", size = rel(1.0)),
    axis.line = element_line(arrow = arrow()),
    panel.background = element_rect(fill = "white"),
    #t = 0, r = 0, b = 0, l = 0
    plot.margin = margin(0.25, 0.05, 0, 0.25, "cm"),
    plot.title = element_text(
      color = "blue",
      size = 14,
      face = "bold",
      hjust = 0.5
    ),
    plot.background = element_rect(
      fill = "grey",
      colour = "black",
      size = 1
    )
  ) + ggtitle("Hybrid Consensus Forks Influence")


#Save Figure
dev.copy(svg, filename = '/home/renault/Documents/code/results/datamarket/Rscript/plots/combineforks.svg')

dev.off ()
