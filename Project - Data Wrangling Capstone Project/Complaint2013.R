library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2013 <- read.csv("Complaint2013_Original.csv")

Complaint2013 <- Complaint2013[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2013 <- Complaint2013[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2013)[colnames(Complaint2013) == "BORO_NM"] <- "Borough"
Complaint2013$Borough <- sub("^$", "UNKNOWN", Complaint2013$Borough)

colnames(Complaint2013)[colnames(Complaint2013) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2013)[colnames(Complaint2013) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2013$Complaint_Date <- as.Date(Complaint2013$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2013)[colnames(Complaint2013) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2013)[colnames(Complaint2013) == "OFNS_DESC"] <- "Offense_Description"
Complaint2013$Offense_Description <- sub("^$", "UNKNOWN", Complaint2013$Offense_Description)


colnames(Complaint2013)[colnames(Complaint2013) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2013$Premises_Description <- sub("^$", "UNKNOWN", Complaint2013$Premises_Description)


colnames(Complaint2013)[colnames(Complaint2013) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2013$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2013$Suspect_Age_Group)



colnames(Complaint2013)[colnames(Complaint2013) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2013$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2013$Suspect_Race)


colnames(Complaint2013)[colnames(Complaint2013) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2013$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2013$Suspect_Sex)
Complaint2013$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2013$Suspect_Sex)


colnames(Complaint2013)[colnames(Complaint2013) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2013$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2013$Victim_Age_Group)


colnames(Complaint2013)[colnames(Complaint2013) == "VIC_RACE"] <- "Victim_Race"
Complaint2013$Victim_Race<- sub("^$", "UNKNOWN", Complaint2013$Victim_Race)

colnames(Complaint2013)[colnames(Complaint2013) == "VIC_SEX"] <- "Victim_Sex"
Complaint2013$Victim_Sex <- sub("U", "UNKNOWN", Complaint2013$Victim_Sex)
Complaint2013$Victim_Sex <- sub("D", "UNKNOWN", Complaint2013$Victim_Sex)
Complaint2013$Victim_Sex <- sub("E", "UNKNOWN", Complaint2013$Victim_Sex)


colnames(Complaint2013)[colnames(Complaint2013) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2013)

View(Complaint2013)

write.csv(Complaint2013, "Complaint2013_Clean.csv")
