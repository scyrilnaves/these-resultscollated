#install.packages("ggplot2")
library(ggrepel)
library(ggplot2)
library(data.table)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L 
###########

input_data <- read.csv(file ='/home/renault/Documents/code/results/Rscript/csvdata/normalgradient.csv')

input_data$TransactionRate <- as.numeric(input_data$TransactionRate) 

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x=Time, y=TransactionRate))+ geom_line(aes(colour=Type)) + ylim(0, 4000)+xlim(0, 150)+geom_point()+geom_text_repel(aes(label = round(TransactionRate, 1)))+
  annotate(
    "text",
    size = 3,
    x = 80,
    y = 1000,
    fontface = 2,
    color = "black",
    label = "TotalNodes = 10 \nNetwork-Type= Mesh \nQuorum = 2 \nBlackList-Depth = 5 Epoch \nBlockSize = 2000 Transactions \nFullBlock-Fulfillment = 5 seconds \nPartialBlock-Fulfillment = 5 seconds \nEpoch = 25 Blocks",
    hjust = 0
  ) +
  coord_cartesian(ylim = c(0, 4000), clip = "off") + theme(
    axis.text = element_text(colour = "black", face="bold",size = rel(1.0)),
    axis.line = element_line(arrow = arrow()),
    panel.background = element_rect(fill = "white"),
    #t = 0, r = 0, b = 0, l = 0
    # plot.margin = margin(0.25, 0.05, 0, 0.25, "cm"),
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
  ) + ggtitle("Normal Node Behaviour")

#+scale_x_discrete(breaks = c(0,3,4,5,6,10))

#Save Figure
dev.copy(png,filename='/home/renault/Documents/code/results/Rscript/plots/normalgradient.png');
dev.off ();
