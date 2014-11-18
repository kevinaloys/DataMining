housedata <- read.table("housetype_data.txt", header = TRUE, sep =',',na.strings=c("NA", "-", "?"))
housedata <- data.frame(housedata)
housedata.factor <- lapply(housedata[,1:14], as.factor())
