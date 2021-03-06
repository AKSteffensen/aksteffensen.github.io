rm(list = ls())
# setwd("C:/Users/kshll/Dropbox/AK DTU/Advanced data analysis")
cat('Install and load packages...')
to_only_install <- c()

to_install_and_load <- c(
  'data.table',  # data.table objects
  'stringr',     # str_c
  'tidyr',       # gather
  'lubridate',   # months(), %+m% | should be loaded after data.table
  'RPostgreSQL', #
  'plyr',        # laply
  'dplyr',        # %>%, rename, transmute # should be loaded after plyr
  'ggplot2',
  'sp',
  'tidyverse',
  'xtable',
  'Rsolnp',
  'nlme',
  'nlme', # Mixed effects linear models
  'lme4', # package for generalized mixed effects linear models
  'car',
  'latex2exp',
  'psych',
  'corrplot',
  'jsonlite'
)
to_install <- c(to_only_install, to_install_and_load)
installed  <- rownames(installed.packages())
for(p in to_install) if(! p %in% installed) install.packages(p, depend=TRUE)
for(p in to_install_and_load) require(p, character.only=TRUE)
cat(' Packages loaded.',fill = T)

setwd('C:/Users/kshll/Google Drev/Shitfaces/social')

data <- read.csv('311_Service_Requests_2015.csv', stringsAsFactors = F)

data %>% data.table() %>% select(-Cross.Street.1, -Cross.Street.2, -Intersection.Street.1, -Intersection.Street.2, -Address.Type,
                                 -Landmark, -Facility.Type, -X.Coordinate..State.Plane. -Y.Coordinate..State.Plane. -Park.Facility.Name,
                                 -Park.Borough, -Vehicle.Type, -Taxi.Company.Borough, -Taxi.Pick.Up.Location, -Bridge.Highway.Name,
                                 -Bridge.Highway.Direction, -Bridge.Highway.Segment, -Road.Ramp, -Location, -Location.Type) -> data2

data_sample <- sample_n(data2, 10000)
?sample_n
exportJson <- toJSON(data_sample, dataframe = 'rows')

write.table(data_sample, "Data/complaint_sample.csv", quote = F, sep = ';')

write(exportJson, "Data/complaint_sample.json")





