#install.packages("ggplot2")
library(ggrepel)
library(ggplot2)
library(data.table)
theme_set(theme_minimal())
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L 
###########

input_data <- read.csv(file ='/home/renault/Documents/code/results/Rscript/csvdata/conclusionpaper.csv')

input_data$TransactionRate <- as.numeric(input_data$TransactionRate) / 240

input_data$TransactionRate

#head(input_data)
ggplot(data = input_data, aes(x=Node, y=TransactionRate)) + geom_line(aes(colour=Type))+ylim(200, 4000)+geom_point()+geom_text_repel(aes(label = round(TransactionRate, 1))) +
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
      fill = "gray",
      colour = "black",
      size = 1
    )
  ) + ggtitle("Overall Consensus Comparison") 

#Save Figure
dev.copy(svg,filename='/home/renault/Documents/code/results/Rscript/plots/overallcomparisonpaper.svg');
dev.off ();


