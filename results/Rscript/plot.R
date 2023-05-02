#install.packages("ggplot2")
library(ggplot2)
library(data.table)
#library(dplyr)
#library(readr)
###########
#Run All: ctrl+Alt+R
#Clear: ctrl+L 
###########
input_data <- read.csv(file ='/home/renault/Documents/code/Rscript/export.csv')

# Transpose data
out <- as.data.frame(t(input_data))
#out[] <- lapply(out, type.convert, as.is = TRUE, header=TRUE)
#row.names(out) <- NULL


head(out)
#out
#transpose_data <- t(input_data)




#sapply(out)

#data_frame_col1 <- transform(transpose_data,
                             #node0= as.numeric(X1))

#head(data_frame_col1)

ggplot(data=out, aes(x=V1, y=V2, group=1)) + geom_line() + geom_point()






