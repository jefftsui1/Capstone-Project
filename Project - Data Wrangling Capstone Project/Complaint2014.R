library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2014 <- read.csv("Complaint2014_Original.csv")

Complaint2014 <- Complaint2014[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2014 <- Complaint2014[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2014)[colnames(Complaint2014) == "BORO_NM"] <- "Borough"
Complaint2014$Borough <- sub("^$", "UNKNOWN", Complaint2014$Borough)

colnames(Complaint2014)[colnames(Complaint2014) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2014)[colnames(Complaint2014) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2014$Complaint_Date <- as.Date(Complaint2014$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2014)[colnames(Complaint2014) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2014)[colnames(Complaint2014) == "OFNS_DESC"] <- "Offense_Description"
Complaint2014$Offense_Description <- sub("^$", "UNKNOWN", Complaint2014$Offense_Description)


colnames(Complaint2014)[colnames(Complaint2014) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2014$Premises_Description <- sub("^$", "UNKNOWN", Complaint2014$Premises_Description)


colnames(Complaint2014)[colnames(Complaint2014) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2014$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2014$Suspect_Age_Group)



colnames(Complaint2014)[colnames(Complaint2014) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2014$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2014$Suspect_Race)


colnames(Complaint2014)[colnames(Complaint2014) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2014$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2014$Suspect_Sex)
Complaint2014$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2014$Suspect_Sex)


colnames(Complaint2014)[colnames(Complaint2014) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2014$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2014$Victim_Age_Group)


colnames(Complaint2014)[colnames(Complaint2014) == "VIC_RACE"] <- "Victim_Race"
Complaint2014$Victim_Race<- sub("^$", "UNKNOWN", Complaint2014$Victim_Race)

colnames(Complaint2014)[colnames(Complaint2014) == "VIC_SEX"] <- "Victim_Sex"
Complaint2014$Victim_Sex <- sub("U", "UNKNOWN", Complaint2014$Victim_Sex)
Complaint2014$Victim_Sex <- sub("D", "UNKNOWN", Complaint2014$Victim_Sex)
Complaint2014$Victim_Sex <- sub("E", "UNKNOWN", Complaint2014$Victim_Sex)


colnames(Complaint2014)[colnames(Complaint2014) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2014)

View(Complaint2014)

write.csv(Complaint2014, "Complaint2014_Clean.csv")
