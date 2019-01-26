library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")


Complaint2012 <- read.csv("Complaint2012_Original.csv")

Complaint2012 <- Complaint2012[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

Complaint2012 <- Complaint2012[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(Complaint2012)[colnames(Complaint2012) == "BORO_NM"] <- "Borough"
Complaint2012$Borough <- sub("^$", "UNKNOWN", Complaint2012$Borough)

colnames(Complaint2012)[colnames(Complaint2012) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(Complaint2012)[colnames(Complaint2012) == "CMPLNT_FR_TM"] <- "Complaint_Time"
Complaint2012$Complaint_Date <- as.Date(Complaint2012$Complaint_Date, "%m/%d/%Y")



colnames(Complaint2012)[colnames(Complaint2012) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2012)[colnames(Complaint2012) == "OFNS_DESC"] <- "Offense_Description"
Complaint2012$Offense_Description <- sub("^$", "UNKNOWN", Complaint2012$Offense_Description)


colnames(Complaint2012)[colnames(Complaint2012) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2012$Premises_Description <- sub("^$", "UNKNOWN", Complaint2012$Premises_Description)


colnames(Complaint2012)[colnames(Complaint2012) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2012$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2012$Suspect_Age_Group)



colnames(Complaint2012)[colnames(Complaint2012) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2012$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2012$Suspect_Race)


colnames(Complaint2012)[colnames(Complaint2012) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2012$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2012$Suspect_Sex)
Complaint2012$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2012$Suspect_Sex)


colnames(Complaint2012)[colnames(Complaint2012) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2012$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2012$Victim_Age_Group)


colnames(Complaint2012)[colnames(Complaint2012) == "VIC_RACE"] <- "Victim_Race"
Complaint2012$Victim_Race<- sub("^$", "UNKNOWN", Complaint2012$Victim_Race)

colnames(Complaint2012)[colnames(Complaint2012) == "VIC_SEX"] <- "Victim_Sex"
Complaint2012$Victim_Sex <- sub("U", "UNKNOWN", Complaint2012$Victim_Sex)
Complaint2012$Victim_Sex <- sub("D", "UNKNOWN", Complaint2012$Victim_Sex)
Complaint2012$Victim_Sex <- sub("E", "UNKNOWN", Complaint2012$Victim_Sex)


colnames(Complaint2012)[colnames(Complaint2012) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(Complaint2012)

View(Complaint2012)

write.csv(Complaint2012, "Complaint2012_Clean.csv")
