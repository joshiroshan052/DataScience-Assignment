library(data.table)
library(tidyverse)
library(dplyr)


 
setwd("D:/Roshan-Data-Science-Assignemnt")
Cleaned_HP = read.csv("Cleaning/Cleaned Datasets/Cleaned_Town_population.csv" )

LSOA = fread("Datasets/Postcode to LSOA.csv")
pattern = ' .*$'
LSOA_Cleaned = LSOA %>%
  select(lsoa11cd,pcds) %>% 
  mutate(shortPostcode=gsub(pattern,"",pcds)) %>% 
  right_join(Cleaned_HP,by="shortPostcode")  %>% 
  group_by(lsoa11cd) %>% 
  select(lsoa11cd,shortPostcode,Town,District,County) 



LSOA_Cleaned


colnames(LSOA_Cleaned)[1] <- "LSOA code"
view(LSOA_Cleaned)
write.csv(LSOA_Cleaned,"Cleaning/Cleaned Datasets/Cleaned_LSOA.csv",row.names = FALSE,col.names = FALSE)
