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
  read.csv(file = '/home/renault/Documents/code/results/datamarket/Rscript/csvdata/aurascalability.csv')

input_data$TransactionRate <-
  as.numeric(input_data$TransactionRate)

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x = Nodes, y = TransactionRate)) + geom_line(aes(colour =
                                                                                Type)) + ylim(100, 400) + geom_point() + geom_text_repel(aes(label = round(TransactionRate, 1))) +
  annotate(
    "text",
    size = 3,
    x = 18,
    y = 350,
    color = "blue",
    label = "Total Transactions= 50000 \nMax BlockSize = 5MegaBytes \nBlockPeriod = 6seconds \nTPS-Transaction Per Second ",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(100, 400), clip = "off") + theme(
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
  ) + ggtitle("Authority Round Consensus Scalability Influence")


#Save Figure
dev.copy(png, filename = '/home/renault/Documents/code/results/datamarket/Rscript/plots/aurascalability.png')

dev.off ()
