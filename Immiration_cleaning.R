#EU-28 immigrants data#
EU_immigration <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/EU_immigration.csv", 
                           col_names = FALSE)
EU_immigration.clean <- EU_immigration %>% 
  select(-X1)
names(EU_immigration.clean) <- c("region", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")