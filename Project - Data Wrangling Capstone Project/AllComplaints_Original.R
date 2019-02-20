library(dplyr)
library(tidyr)
library(scales)
library(plyr)
library(lubridate)
library(ggplot2)
library(GGally)
library(zoo)


ComplaintAll <- read.csv("C:/Users/Jayden/Desktop/Springboard/Data-Wrangling-Capstone-Project/ComplaintAll_Original.csv", header = T, na.strings=c("", " ",  "NA"))
View(ComplaintAll)

ComplaintAll <- ComplaintAll[, -c(1:3, 6:10, 12:14, 17, 19:25, 29:31, 33:34)]

ComplaintAll <- ComplaintAll[, c(5, 1, 2, 4, 3, 6, 7, 8, 9, 11, 12, 13, 10)]

ComplaintAll <- ComplaintAll[-c(3349, 4331, 65298, 88350, 97921, 112263, 114067, 131326, 239966, 456342, 456476, 461909, 460622),]

colnames(ComplaintAll)[colnames(ComplaintAll) == "BORO_NM"] <- "Borough"
colnames(ComplaintAll)[colnames(ComplaintAll) == "CMPLNT_FR_TM"] <- "Complaint_Time"
colnames(ComplaintAll)[colnames(ComplaintAll) == "CMPLNT_FR_DT"] <- "Complaint_Date"
ComplaintAll$Complaint_Date <- as.Date(ComplaintAll$Complaint_Date, "%m/%d/%Y")
colnames(ComplaintAll)[colnames(ComplaintAll) == "LAW_CAT_CD"] <- "Level_of_Offense"
colnames(ComplaintAll)[colnames(ComplaintAll) == "OFNS_DESC"] <- "Offense_Description"
ComplaintAll$Offense_Description <- sub("KIDNAPPING & RELATED OFFENSES", "KIDNAPPING", ComplaintAll$Offense_Description)
colnames(ComplaintAll)[colnames(ComplaintAll) == "PREM_TYP_DESC"] <- "Premises_Description"
colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_AGE_GROUP"] <- "Suspect_Age_Group"
colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_RACE"] <- "Suspect_Race"
colnames(ComplaintAll)[colnames(ComplaintAll) == "SUSP_SEX"] <- "Suspect_Sex"
colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_AGE_GROUP"] <- "Victim_Age_Group"
colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_RACE"] <- "Victim_Race"
colnames(ComplaintAll)[colnames(ComplaintAll) == "VIC_SEX"] <- "Victim_Sex"
colnames(ComplaintAll)[colnames(ComplaintAll) == "Lat_Lon"] <- "Latitude_Longitude"

ComplaintAll <- ComplaintAll %>% 
  select(Borough, Complaint_Date, Complaint_Time, Level_of_Offense, Offense_Description, Premises_Description, Suspect_Age_Group, Suspect_Race, Suspect_Sex, Victim_Age_Group, Victim_Race, Victim_Sex, Latitude_Longitude) %>% 
  filter(Premises_Description %in% c("PARK/PLAYGROUND", "PARKING LOT/GARAGE(PUBLIC)", "BUS (NYC TRANSIT)", "OPEN AREAS (OPEN LOTS)", "BUS STOP", "STREET", "TRANSIT - NYC SUBWAY", "PUBLIC BUILDING"))

ComplaintAll <- ComplaintAll %>% 
  select(Borough, Complaint_Date, Complaint_Time, Level_of_Offense, Offense_Description, Premises_Description, Suspect_Age_Group, Suspect_Race, Suspect_Sex, Victim_Age_Group, Victim_Race, Victim_Sex, Latitude_Longitude) %>% 
  filter(Offense_Description %in% c("ARSON", "ASSAULT 3 & RELATED OFFENSES", "DANGEROUS WEAPONS", "FELONY ASSAULT", "HARRASSMENT 2", "JOSTLING", "KIDNAPPING", "MURDER & NON-NEGL. MANSLAUGHTER", "RAPE", "ROBBERY", "SEX CRIMES"))

ComplaintAll <- ComplaintAll %>% 
  select(Borough, Complaint_Date, Complaint_Time, Level_of_Offense, Offense_Description, Premises_Description, Suspect_Age_Group, Suspect_Race, Suspect_Sex, Victim_Age_Group, Victim_Race, Victim_Sex, Latitude_Longitude) %>% 
  filter(Borough %in% c("BRONX", "BROOKLYN", "MANHATTAN", "QUEENS", "STATEN ISLAND"))

ComplaintAll <- ComplaintAll %>% 
  select(Borough, Complaint_Date, Complaint_Time, Level_of_Offense, Offense_Description, Premises_Description, Suspect_Age_Group, Suspect_Race, Suspect_Sex, Victim_Age_Group, Victim_Race, Victim_Sex, Latitude_Longitude) %>% 
  filter(Borough %in% c("BRONX", "BROOKLYN", "MANHATTAN", "QUEENS", "STATEN ISLAND"))

ComplaintAll$Year <- year(as.Date(ComplaintAll$Complaint_Date, "%Y-%m-%d"))
ComplaintAll <- transform(ComplaintAll, yearmon = as.yearmon(ComplaintAll$Complaint_Date))
ComplaintAll<- ComplaintAll[, c(1, 2, 14, 15, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)]
colnames(ComplaintAll)[colnames(ComplaintAll) == "yearmon"] <- "Year_Month"
ComplaintAll$Year_Month




View(ComplaintAll)

write.csv(ComplaintAll, "AllComplaints.csv")



