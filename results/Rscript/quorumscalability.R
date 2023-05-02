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
  read.csv(file = '/home/renault/Documents/code/results/Rscript/csvdata/quorumscalability.csv')

input_data$TransactionRate <-
  as.numeric(input_data$TransactionRate) / 240

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x = Node, y = TransactionRate)) + geom_line(aes(colour =
                                                                                Type)) + ylim(200, 4000) + geom_point() + geom_text_repel(aes(label = round(TransactionRate, 1))) +
  annotate(
    "text",
    size = 3,
    x = 14,
    y = 3500,
    fontface = 2,
    color = "black",
    label = "Network-Type= Mesh \nBlackList-Depth = 5 Epoch \nBlock-Size = 2000 transactions \nFullBlock-Fulfillment = 5 seconds \nPartialBlock-Fulfillment = 5 seconds",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(200, 4000), clip = "off") + theme(
    axis.text = element_text(colour = "black",face="bold", size = rel(1.0)),
    axis.line = element_line(arrow = arrow()),
    panel.background = element_rect(fill = "white"),
    #t = 0, r = 0, b = 0, l = 0
    plot.margin = margin(0.25, 0.05, 0, 0.25, "cm"),
    plot.title = element_text(
      color = "black",
      size = 14,
      face = "bold",
      hjust = 0.5
    ),
    plot.background = element_rect(
      fill = "lightsteelblue",
      colour = "black",
      size = 1
    )
  ) + ggtitle("Quorum Member Limit Influence")


#Save Figure
dev.copy(png, filename = '/home/renault/Documents/code/results/Rscript/plots/quorumscalability.png')

dev.off ()
