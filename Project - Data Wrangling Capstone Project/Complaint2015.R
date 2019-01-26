library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2015 <- read.csv("Complaint2015_Original.csv")

Complaint2015 <- Complaint2015[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2015 <- Complaint2015[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2015)[colnames(Complaint2015) == "BORO_NM"] <- "Borough"
Complaint2015$Borough <- sub("^$", "UNKNOWN", Complaint2015$Borough)

colnames(Complaint2015)[colnames(Complaint2015) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2015)[colnames(Complaint2015) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2015$Complaint_Date <- as.Date(Complaint2015$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2015)[colnames(Complaint2015) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2015)[colnames(Complaint2015) == "OFNS_DESC"] <- "Offense_Description"
Complaint2015$Offense_Description <- sub("^$", "UNKNOWN", Complaint2015$Offense_Description)


colnames(Complaint2015)[colnames(Complaint2015) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2015$Premises_Description <- sub("^$", "UNKNOWN", Complaint2015$Premises_Description)


colnames(Complaint2015)[colnames(Complaint2015) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2015$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2015$Suspect_Age_Group)



colnames(Complaint2015)[colnames(Complaint2015) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2015$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2015$Suspect_Race)


colnames(Complaint2015)[colnames(Complaint2015) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2015$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2015$Suspect_Sex)
Complaint2015$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2015$Suspect_Sex)


colnames(Complaint2015)[colnames(Complaint2015) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2015$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2015$Victim_Age_Group)


colnames(Complaint2015)[colnames(Complaint2015) == "VIC_RACE"] <- "Victim_Race"
Complaint2015$Victim_Race<- sub("^$", "UNKNOWN", Complaint2015$Victim_Race)

colnames(Complaint2015)[colnames(Complaint2015) == "VIC_SEX"] <- "Victim_Sex"
Complaint2015$Victim_Sex <- sub("U", "UNKNOWN", Complaint2015$Victim_Sex)
Complaint2015$Victim_Sex <- sub("D", "UNKNOWN", Complaint2015$Victim_Sex)
Complaint2015$Victim_Sex <- sub("E", "UNKNOWN", Complaint2015$Victim_Sex)


colnames(Complaint2015)[colnames(Complaint2015) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2015)

View(Complaint2015)

write.csv(Complaint2015, "Complaint2015_Clean.csv")
