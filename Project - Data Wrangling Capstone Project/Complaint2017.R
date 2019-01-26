library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2017 <- read.csv("Complaint2017_Original.csv")

Complaint2017 <- Complaint2017[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2017 <- Complaint2017[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2017)[colnames(Complaint2017) == "BORO_NM"] <- "Borough"
Complaint2017$Borough <- sub("^$", "UNKNOWN", Complaint2017$Borough)

colnames(Complaint2017)[colnames(Complaint2017) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2017)[colnames(Complaint2017) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2017$Complaint_Date <- as.Date(Complaint2017$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2017)[colnames(Complaint2017) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2017)[colnames(Complaint2017) == "OFNS_DESC"] <- "Offense_Description"
Complaint2017$Offense_Description <- sub("^$", "UNKNOWN", Complaint2017$Offense_Description)


colnames(Complaint2017)[colnames(Complaint2017) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2017$Premises_Description <- sub("^$", "UNKNOWN", Complaint2017$Premises_Description)


colnames(Complaint2017)[colnames(Complaint2017) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2017$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2017$Suspect_Age_Group)



colnames(Complaint2017)[colnames(Complaint2017) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2017$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2017$Suspect_Race)


colnames(Complaint2017)[colnames(Complaint2017) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2017$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2017$Suspect_Sex)
Complaint2017$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2017$Suspect_Sex)


colnames(Complaint2017)[colnames(Complaint2017) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2017$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2017$Victim_Age_Group)


colnames(Complaint2017)[colnames(Complaint2017) == "VIC_RACE"] <- "Victim_Race"
Complaint2017$Victim_Race<- sub("^$", "UNKNOWN", Complaint2017$Victim_Race)

colnames(Complaint2017)[colnames(Complaint2017) == "VIC_SEX"] <- "Victim_Sex"
Complaint2017$Victim_Sex <- sub("U", "UNKNOWN", Complaint2017$Victim_Sex)
Complaint2017$Victim_Sex <- sub("D", "UNKNOWN", Complaint2017$Victim_Sex)
Complaint2017$Victim_Sex <- sub("E", "UNKNOWN", Complaint2017$Victim_Sex)


colnames(Complaint2017)[colnames(Complaint2017) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2017)

View(Complaint2017)

write.csv(Complaint2017, "Complaint2017_Clean.csv")
