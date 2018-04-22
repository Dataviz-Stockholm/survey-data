library(dplyr)
library(tidyr)
library(readr)
library(readxl)
library(stringr)

data <- read_csv("data.csv") 
map <- read_xlsx("mapping_table.xlsx")

pivoted <- data %>%
        gather(key = "questionID", value = "answer", -respID, -age, -year_week, -date, -weight)%>%
        filter(!is.na(answer)) %>%
        left_join(map)

write.csv(pivoted, "data_pivoted.csv", row.names = F)





