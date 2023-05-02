#install.packages("ggplot2")
library(ggrepel)
library(ggplot2)
library(data.table)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L 
###########

input_data <- read.csv(file ='/home/renault/Documents/code/results/Rscript/csvdata/nodetypeinfluence.csv')

input_data$TransactionRate <- as.numeric(input_data$TransactionRate) / 240

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x=FaultNodes, y=TransactionRate)) + geom_line(aes(colour=Type))+ylim(0, 3200)+geom_point()+geom_text_repel(aes(label = round(TransactionRate, 1))) +
  annotate(
    "text",
    size = 3,
    x = 1.0,
    y = 500,
    color = "blue",
    label = "TotalNodes = 10 \nQuorum = 2 \nBlackListDepth = 5 SubEpoch \nBlockSize = 2000 transactions \nFullBlockFulfillment = 5secs \nPartialBlockFulfillment = 5secs \nMPB= Malicious Partial Block+Latency:200ms \nMFB*=Malicious Full Block+Latency:200ms (Throughout) \nMFB**=Malicious Full Block+Latency:200ms (For First 100 blocks) \nMFB***=Malicious Full Block+Latency:200ms (For First 200 blocks) \nMFB Sine=Malicious Full Block+Latency:200ms (For First 50-100, 150-200, 250-300, 350-400 blocks)
",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(0, 3200), clip = "off") + theme(
    axis.text = element_text(colour = "blue", size = rel(1.0)),
    axis.line = element_line(arrow = arrow()),
    panel.background = element_rect(fill = "white"),
    #t = 0, r = 0, b = 0, l = 0
    plot.margin = margin(0.0005, 0.0005, 0.0005, 0.0005, "cm"),
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
  ) + ggtitle("Node Type Influence Comparison")


#Save Figure
dev.copy(svg,filename='/home/renault/Documents/code/results/Rscript/plots/nodetypeinfluence.svg');
dev.off ();
