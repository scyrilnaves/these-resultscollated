#install.packages("ggplot2")
library(ggrepel)
library(ggplot2)
library(data.table)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L 
###########

input_data <- read.csv(file ='/home/renault/Documents/code/results/Rscript/csvdata/classification/maliciousfullblockclassification.csv')

#input_data$TransactionRate <- as.numeric(input_data$TransactionRate) / 240

#input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x=NodeId, y=Epoch)) + geom_point(aes(col=Type,size=Value))+ylim(0, 12)+scale_size(guide=FALSE)+
  annotate(
    "text",
    size = 3,
    x = 'N8',
    y = 11,
    color = "black",
    fontface = 2,
    label = "Nodes = 10 \nQuorum = 2 \nBlackList-Depth = 5 Epoch \nBlockSize = 2000 Transactions \nFullBlockFulfillment = 5 seconds \nPartialBlockFulfillment = 5 seconds",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(0, 12), clip = "off") + theme(
    axis.text = element_text(colour = "black", size = rel(1.0)),
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
      fill = "lemonchiffon",
      colour = "black",
      size = 1
    )
  ) + ggtitle("Malicious Fullblock Node Classification")+ scale_y_continuous(limits = c(0, 10), breaks = seq(0, 10, by = 1))



#Save Figure
dev.copy(png,filename='/home/renault/Documents/code/results/Rscript/plots/maliciousfullblockclassification.png');
dev.off ();
