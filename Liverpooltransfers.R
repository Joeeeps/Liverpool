#Liverpool transfers under FSG (05/02/2021 current date)
library("dplyr")
library("ggplot2")

Liverpooltransfers <- read.csv("Liverpooltransfers.csv")
Liverpooltransfers <- Liverpooltransfers %>% filter(Type != "Overall")
 

Transfergraph <- ggplot(as.data.frame(Liverpooltransfers)) + geom_bar(aes(y = Amount, x = Season), data = Liverpooltransfers,
stat="identity", fill = "darkRed") + xlab("Season") + ylab ("Millions (£)")  + theme_classic() +
geom_label(aes(x = Season, y = Amount, label = Amount, colour = Type)) + scale_colour_manual(values=c("Green", "Red"))
           
Transfergraph
           
ggsave("Liverpooltransfers.png") 

Liverpooltransfersoverall <- read.csv("Liverpooltransfers.csv") 
ggplot(as.data.frame(Liverpooltransfersoverall)) + theme_classic()+
geom_label(aes(x = Season, y = Amount, label = Amount, colour = Type)) + scale_colour_manual(values=c("White", "Blue", "White"))

