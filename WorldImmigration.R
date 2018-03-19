#Number of people who have immigrated to Denmark in last 30 years#
world_immigration <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/world_immigration.csv", 
                              col_names = FALSE)
world_immigration.clean <- world_immigration %>% 
  select(-X1, -X3, -X4, -X5, -X6, -X7, -X8, -X9)
names(world_immigration.clean) <- c("region","1987", "1988","1989","1990","1991", "1992", "1993", "1994", "1995", "1996","1997", "1998","1999","2000","2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")

#melting the data#
world_immigration.clean.melt <- melt(world_immigration.clean, id="region")
names(world_immigration.clean.melt) <- c("region", "year", "immigrants")
world_immigration.clean.melt$year <- as.numeric(as.character(world_immigration.clean.melt$year))
world_immigration.clean1 <- world_immigration.clean.melt

#sum all 30 years for each country#
world_immigration_TOTAL <- world_immigration.clean1 %>%
  mutate(immigrants = as.numeric(as.character(immigrants))) %>%  
  group_by(region) %>%
  summarise(total.count = n(), count = sum(immigrants, na.rm = FALSE ))

