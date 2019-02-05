library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project")

ComplaintAll <- read.csv("ComplaintAll_Original.csv")

ComplaintAll <- ComplaintAll[, -c(1, 4:8, 10:12, 15, 17:23, 27:29, 31:32)]

ComplaintAll <- ComplaintAll[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

colnames(ComplaintAll)[colnames(ComplaintAll) == "BORO_NM"] <- "Borough"
ComplaintAll$Borough <- sub("^$", "UNKNOWN", ComplaintAll$Borough)

colnames(ComplaintAll)[colnames(ComplaintAll) == "CMPLNT_FR_DT"] <- "Complaint_Date"



colnames(ComplaintAll)[colnames(ComplaintAll) == "CMPLNT_FR_TM"] <- "Complaint_Time"
ComplaintAll$Complaint_Date <- as.Date(ComplaintAll$Complaint_Date, "%m/%d/%Y")



colnames(ComplaintAll)[colnames(ComplaintAll) == "LAW_CAT_CD"] <- "Level_of_Offense"


colnames(ComplaintAll)[colnames(ComplaintAll) == "OFNS_DESC"] <- "Offense_Description"
ComplaintAll$Offense_Description <- sub("^$", "UNKNOWN", ComplaintAll$Offense_Description)


colnames(ComplaintAll)[colnames(ComplaintAll) == "PREM_TYP_DESC"] <- "Premises_Description"
ComplaintAll$Premises_Description <- sub("^$", "UNKNOWN", ComplaintAll$Premises_Description)


colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
ComplaintAll$Suspect_Age_Group <- sub("^$", "UNKNOWN", ComplaintAll$Suspect_Age_Group)



colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_RACE"] <- "Suspect_Race"
ComplaintAll$Suspect_Race <- sub("^$", "UNKNOWN", ComplaintAll$Suspect_Race)


colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_SEX"] <- "Suspect_Sex"
ComplaintAll$Suspect_Sex <- sub("U", "UNKNOWN", ComplaintAll$Suspect_Sex)
ComplaintAll$Suspect_Sex <- sub("^$", "UNKNOWN", ComplaintAll$Suspect_Sex)


colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
ComplaintAll$Victim_Age_Group <- sub("^$", "UNKNOWN", ComplaintAll$Victim_Age_Group)


colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_RACE"] <- "Victim_Race"
ComplaintAll$Victim_Race<- sub("^$", "UNKNOWN", ComplaintAll$Victim_Race)

colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_SEX"] <- "Victim_Sex"
ComplaintAll$Victim_Sex <- sub("U", "UNKNOWN", ComplaintAll$Victim_Sex)
ComplaintAll$Victim_Sex <- sub("D", "UNKNOWN", ComplaintAll$Victim_Sex)
ComplaintAll$Victim_Sex <- sub("E", "UNKNOWN", ComplaintAll$Victim_Sex)


colnames(ComplaintAll)[colnames(ComplaintAll) == "Lat_Lon"] <- "Latitude_Longitude"

colnames(ComplaintAll)

View(ComplaintAll)

write.csv(ComplaintAll, "ComplaintAll_Clean.csv")


