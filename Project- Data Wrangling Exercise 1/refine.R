library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard")
refine <- read.csv("refine_original.csv")


refine$company <- tolower(refine$company)  

refine$company <-  sub(pattern = ".*\\ips$", replacement = "philips", x = newrefine) 
refine$company <-  sub(pattern = "ak.*$", replacement = "akzo", x = newrefine) 
refine$company <-  sub(pattern = "van.*\\ten$", replacement = "van_houten", x = newrefine)  
refine$company <-  sub(pattern = "uni.*$", replacement = "unilever", x = newrefine) 


refine <- separate(refine, "Product.code...number", c("product_code", "product_number"), sep = "-")


refine <- mutate(refine, product_categories = 0) 

refine <- refine %>% 
  mutate(product_categories = ifelse(grepl("p", product_code), "Smartphone", product_categories)) %>% 
  mutate(product_categories = ifelse(grepl("v", product_code), "TV", product_categories)) %>% 
  mutate(product_categories = ifelse(grepl("x", product_code), "Laptop", product_categories)) %>% 
  mutate(product_categories = ifelse(grepl("q", product_code), "Tablet", product_categories))


refine <- mutate(refine, full_address = paste(address, city, country, sep = ", "))


refine <- refine %>% 
  mutate(company_philips = ifelse(grepl("philips", company), 1, 0)) %>% 
  mutate(company_akzo = ifelse(grepl("akzo", company), 1, 0)) %>% 
  mutate(company_van_houten = ifelse(grepl("van houten", company), 1, 0)) %>% 
  mutate(company_unilever = ifelse(grepl("unilever", company), 1, 0)) %>% 
  mutate(product_smartphone = ifelse(grepl("Smartphone", product_categories), 1, 0)) %>% 
  mutate(product_tv = ifelse(grepl("TV", product_categories), 1, 0)) %>% 
  mutate(product_laptop = ifelse(grepl("Laptop", product_categories), 1, 0)) %>% 
  mutate(product_tablet = ifelse(grepl("Tablet", product_categories), 1, 0))


refine
write.csv(refine, file = "refine_clean.csv")

