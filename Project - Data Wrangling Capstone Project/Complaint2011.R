library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2011 <- read.csv("Complaint2011_Original.csv")

Complaint2011 <- Complaint2011[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2011 <- Complaint2011[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2011)[colnames(Complaint2011) == "BORO_NM"] <- "Borough"
Complaint2011$Borough <- sub("^$", "UNKNOWN", Complaint2011$Borough)

colnames(Complaint2011)[colnames(Complaint2011) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2011)[colnames(Complaint2011) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2011$Complaint_Date <- as.Date(Complaint2011$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2011)[colnames(Complaint2011) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2011)[colnames(Complaint2011) == "OFNS_DESC"] <- "Offense_Description"
Complaint2011$Offense_Description <- sub("^$", "UNKNOWN", Complaint2011$Offense_Description)


colnames(Complaint2011)[colnames(Complaint2011) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2011$Premises_Description <- sub("^$", "UNKNOWN", Complaint2011$Premises_Description)


colnames(Complaint2011)[colnames(Complaint2011) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2011$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2011$Suspect_Age_Group)



colnames(Complaint2011)[colnames(Complaint2011) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2011$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2011$Suspect_Race)


colnames(Complaint2011)[colnames(Complaint2011) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2011$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2011$Suspect_Sex)
Complaint2011$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2011$Suspect_Sex)


colnames(Complaint2011)[colnames(Complaint2011) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2011$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2011$Victim_Age_Group)


colnames(Complaint2011)[colnames(Complaint2011) == "VIC_RACE"] <- "Victim_Race"
Complaint2011$Victim_Race<- sub("^$", "UNKNOWN", Complaint2011$Victim_Race)

colnames(Complaint2011)[colnames(Complaint2011) == "VIC_SEX"] <- "Victim_Sex"
Complaint2011$Victim_Sex <- sub("U", "UNKNOWN", Complaint2011$Victim_Sex)
Complaint2011$Victim_Sex <- sub("D", "UNKNOWN", Complaint2011$Victim_Sex)
Complaint2011$Victim_Sex <- sub("E", "UNKNOWN", Complaint2011$Victim_Sex)


colnames(Complaint2011)[colnames(Complaint2011) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2011)

View(Complaint2011)

write.csv(Complaint2011, "Complaint2011_Clean.csv")
