# load packages
library(readr)
library(dplyr)
library(ggplot2)
library(reshape2)
library(scales)
library(gridExtra)

#Cleaning Regional Danish Population Vs Immigrants#
Danish_population <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/Danish_populationQ17.csv", 
                              col_names = FALSE)
Danish_population.clean <- Danish_population %>% 
  select(-X1, -X2)
names(Danish_population.clean) <- c("region", "total", "Danes")
#calculations of % of immigrant population by region#
Danish_population.clean<- Danish_population.clean %>%
  mutate(immigrants = total-Danes, ImmigrantPercentage= immigrants/total*100)

#Cleaning of economic activity rate data#
economic_activity <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/economic_activity.csv", 
    col_names = FALSE)
economic_activity.clean <- economic_activity %>% 
  select(-X1)
names(economic_activity.clean) <- c("region", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")

#Economic Activity rate mean for Highcharts#
economic_activity.clean.melt <- melt(economic_activity.clean, id="region")
names(economic_activity.clean.melt) <- c("region", "year", "immigrants")
economic_activity.clean.melt$year <- as.numeric(as.character(economic_activity.clean.melt$year))
economic_activity.clean1 <- economic_activity.clean.melt
names(economic_activity.mean) <- aggregate(economic_activity.clean1[, 3], list(economic_activity.clean1$region), mean)

#             Group.1     x
1 Region Hovedstaden 81.13
2 Region Midtjylland 78.20
3 Region Nordjylland 76.96
4 Region Sj<e6>lland 78.21
5 Region Syddanmark 77.33#

#Cleaning unemployment benefits#
Unemployment_benefits <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/Unemployment_benefits.csv", 
                                  col_names = FALSE)
Unemployment_benefits.clean <- Unemployment_benefits %>% 
  select(-X1)
names(Unemployment_benefits.clean) <- c("region", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")

#Unemployment benefits mean for last 10 years, Highcharts#
Unemployment_benefits.clean.melt <- melt(Unemployment_benefits.clean, id="region")
names(Unemployment_benefits.clean.melt) <- c("region", "year", "benefits")
Unemployment_benefits.clean.melt$year <- as.numeric(as.character(Unemployment_benefits.clean.melt$year))
Unemployment_benefits.clean1 <- Unemployment_benefits.clean.melt
names(Unemployment_benefits.mean) <- aggregate(Unemployment_benefits.clean1[, 3], list(Unemployment_benefits.clean1$region), mean)

#Group.2       x
1 Region Hovedstaden 24409.4
2 Region Midtjylland 15767.8
3 Region Nordjylland  8133.6
4 Region Sj<e6>lland  8997.1
5 Region Syddanmark  14645.2 #

# merge the two datasets
Danish_population.merge <- merge(Danish_population.clean, Unemployment_benefits.mean, by="region")

#Cleaning of employment rate data#
employment_rate <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/employment_rate.csv", 
                                                         col_names = FALSE)
employment_rate.clean <- employment_rate %>% 
  select(-X1)
names(employment_rate.clean) <- c("region", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")


#Cleaning of unemployment data#
unemployement <- read_csv("interactive-journalism-module-master/interactive-journalism-module-master/interactive-journalism-module-master/Data Files/unemployement.csv", 
                          col_names = FALSE)
unemployement.clean <- unemployement %>% 
  select(-X1)
names(unemployement.clean) <- c("region", "2008", "2009","2010","2011","2012", "2013", "2014", "2015", "2016", "2017")

