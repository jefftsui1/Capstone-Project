library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2016 <- read.csv("Complaint2016_Original.csv")

Complaint2016 <- Complaint2016[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2016 <- Complaint2016[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2016)[colnames(Complaint2016) == "BORO_NM"] <- "Borough"
Complaint2016$Borough <- sub("^$", "UNKNOWN", Complaint2016$Borough)

colnames(Complaint2016)[colnames(Complaint2016) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2016)[colnames(Complaint2016) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2016$Complaint_Date <- as.Date(Complaint2016$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2016)[colnames(Complaint2016) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2016)[colnames(Complaint2016) == "OFNS_DESC"] <- "Offense_Description"
Complaint2016$Offense_Description <- sub("^$", "UNKNOWN", Complaint2016$Offense_Description)


colnames(Complaint2016)[colnames(Complaint2016) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2016$Premises_Description <- sub("^$", "UNKNOWN", Complaint2016$Premises_Description)


colnames(Complaint2016)[colnames(Complaint2016) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2016$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2016$Suspect_Age_Group)



colnames(Complaint2016)[colnames(Complaint2016) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2016$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2016$Suspect_Race)


colnames(Complaint2016)[colnames(Complaint2016) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2016$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2016$Suspect_Sex)
Complaint2016$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2016$Suspect_Sex)


colnames(Complaint2016)[colnames(Complaint2016) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2016$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2016$Victim_Age_Group)


colnames(Complaint2016)[colnames(Complaint2016) == "VIC_RACE"] <- "Victim_Race"
Complaint2016$Victim_Race<- sub("^$", "UNKNOWN", Complaint2016$Victim_Race)

colnames(Complaint2016)[colnames(Complaint2016) == "VIC_SEX"] <- "Victim_Sex"
Complaint2016$Victim_Sex <- sub("U", "UNKNOWN", Complaint2016$Victim_Sex)
Complaint2016$Victim_Sex <- sub("D", "UNKNOWN", Complaint2016$Victim_Sex)
Complaint2016$Victim_Sex <- sub("E", "UNKNOWN", Complaint2016$Victim_Sex)


colnames(Complaint2016)[colnames(Complaint2016) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2016)

View(Complaint2016)

write.csv(Complaint2016, "Complaint2016_Clean.csv")
