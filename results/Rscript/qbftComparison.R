#install.packages("ggplot2")
library(ggplot2)
library(data.table)
library(ggrepel)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L
###########

input_data <-
  read.csv(file = '/home/renault/Documents/code/results/Rscript/csvdata/qbftcomparison.csv')

input_data$TransactionRate <-
as.numeric(input_data$TransactionRate) / 240

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x = Node, y = TransactionRate)) + geom_line(aes(colour =
                                                                                Type)) + ylim(0, 3000) + xlim(5, 25) + geom_point() + geom_text_repel(aes(label = round(TransactionRate, 1))) + annotate(
                                                                                  "text",
                                                                                  size = 3,
                                                                                  x = 16,
                                                                                  y = 2500,
                                                                                  color = "blue",
                                                                                  label = "NetworkType = Fully Connected Mesh \nBlockSize = 2000 Transactions \nRoundChange = 90 Seconds",
                                                                                  hjust = 0
                                                                                ) +
  coord_cartesian(ylim = c(0, 3000), clip = "off") + theme(
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
  ) + ggtitle("QBFT Simulation Validation") + xlab("Node Count") + ylab("Transaction Rate Per Second")
#+geom_point()

#Save Figure
dev.copy(svg, filename = '/home/renault/Documents/code/results/Rscript/plots/qbftcomparison.svg')

dev.off ()
