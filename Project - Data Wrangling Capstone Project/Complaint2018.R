library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")

Complaint2018 <- read.csv("Complaint2018_Original.csv")


colnames(Complaint2018)[colnames(Complaint2018) == "BORO_NM"] <- "Borough"
Complaint2018$Borough <- sub("^$", "UNKNOWN", Complaint2018$Borough)

colnames(Complaint2018)[colnames(Complaint2018) == "CMPLNT_FR_TM"] <- "Complaint_Time"

Complaint2018 <- Complaint2018[, -c(1:2, 6:13, 15, 17:20, 22, 23, 27, 31:34)]


colnames(Complaint2018)[colnames(Complaint2018) == "CMPLNT_FR_DT"] <- "Complaint_Date"
Complaint2018$Complaint_Date <- as.Date(Complaint2018$Complaint_Date, "%m/%d/%Y")
Complaint2018 <- filter(Complaint2018, Complaint_Date >= "2018-01-01")


colnames(Complaint2018)[colnames(Complaint2018) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(Complaint2018)[colnames(Complaint2018) == "OFNS_DESC"] <- "Offense_Description"
Complaint2018$Offense_Description <- sub("^$", "UNKNOWN", Complaint2018$Offense_Description)


colnames(Complaint2018)[colnames(Complaint2018) == "PREM_TYP_DESC"] <- "Premises_Description"
Complaint2018$Premises_Description <- sub("^$", "UNKNOWN", Complaint2018$Premises_Description)


colnames(Complaint2018)[colnames(Complaint2018) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
Complaint2018$Suspect_Age_Group <- sub("^$", "UNKNOWN", Complaint2018$Suspect_Age_Group)
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == -2] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == -63] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == -978] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 954] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 952] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 938] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 928] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 922] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 920] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 1012] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 1017] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 1018] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 1967] <- "UNKNOWN"
Complaint2018$Suspect_Age_Group[Complaint2018$Suspect_Age_Group == 2018] <- "UNKNOWN"


colnames(Complaint2018)[colnames(Complaint2018) == "SUSP_RACE"] <- "Suspect_Race"
Complaint2018$Suspect_Race <- sub("^$", "UNKNOWN", Complaint2018$Suspect_Race)


colnames(Complaint2018)[colnames(Complaint2018) == "SUSP_SEX"] <- "Suspect_Sex"
Complaint2018$Suspect_Sex <- sub("U", "UNKNOWN", Complaint2018$Suspect_Sex)
Complaint2018$Suspect_Sex <- sub("^$", "UNKNOWN", Complaint2018$Suspect_Sex)


colnames(Complaint2018)[colnames(Complaint2018) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
Complaint2018$Victim_Age_Group <- sub("^$", "UNKNOWN", Complaint2018$Victim_Age_Group)
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -940] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -955] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -956] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -958] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -968] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -972] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -974] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -76] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -61] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -55] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -51] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -43] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == -5] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == 922] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == 951] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == 954] <- "UNKNOWN"
Complaint2018$Victim_Age_Group [Complaint2018$Victim_Age_Group == 970] <- "UNKNOWN"


colnames(Complaint2018)[colnames(Complaint2018) == "VIC_RACE"] <- "Victim_Race"
Complaint2018$Victim_Race <- sub("^$", "UNKNOWN", Complaint2018$Victim_Race)

colnames(Complaint2018)[colnames(Complaint2018) == "VIC_SEX"] <- "Victim_Sex"
Complaint2018$Victim_Sex <- sub("U", "UNKNOWN", Complaint2018$Victim_Sex)
Complaint2018$Victim_Sex <- sub("D", "UNKNOWN", Complaint2018$Victim_Sex)
Complaint2018$Victim_Sex <- sub("E", "UNKNOWN", Complaint2018$Victim_Sex)


colnames(Complaint2018)[colnames(Complaint2018) == "Lat_Lon"] <- "Latitude_Longitude"

View(Complaint2018)

colnames(Complaint2018)

write.csv(Complaint2018, "Complaint2018_Clean2.csv")
