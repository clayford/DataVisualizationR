# minor edits for workshop

# drop empty census tract levels
homes$censustract <- droplevels(homes$censustract)

# drop the 5 unassigned homes
homes <- homes %>% 
  filter(hsdistrict != "Unassigned")
homes$hsdistrict <- droplevels(homes$hsdistrict)

# remove original condition variable
homes$condition <- NULL
names(homes)[23] <- "condition"
table(homes$condition)

# drop the none conditions
homes <- homes %>% filter(condition != "None")
homes$condition <- droplevels(homes$condition)

saveRDS(homes, "albemarle_homes_2020.rds")
