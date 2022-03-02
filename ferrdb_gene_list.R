library(tidyverse)
library(dplyr)
library(tcltk2)

# read csv files downloaded from ferrdb
driver_data <- read.delim2(file = "1_info_driver.csv", header = TRUE, sep = ",", dec = ",")
marker_data <- read.delim2(file = "1_info_marker.csv", header = TRUE, sep = ",", dec = ",")
suppressor_data <- read.delim2(file = "1_info_suppressor.csv", header = TRUE, sep = ",", dec = ",")

# join the three dataframes
join_data<-full_join(driver_data,marker_data) %>% full_join(suppressor_data)

# filter column of interest (here only gene name)
colnames(join_data)
names_ferrdb<-join_data %>% select(ï..Symbol)
list_genes_ferrdb<-join_data %>% select(ï..Symbol,Name,Evidence,Pathway)

#write df to txt
write.csv(x=names_ferrdb, file="ferrdb_gene_names")
write.csv(x=list_genes_ferrdb, file="ferrdb_gene_names_description")







