cur_dir = getwd()

tripdata_2019 <- read.csv("C:/Users/andre/OneDrive/Desktop/Uni/Statistical Learning/project/bluebikes_tripdata_2019.csv")

tripdata_2019_r <- subset(tripdata_2019, select = -c(usertype, gender, start.station.name, end.station.name))

colnames(tripdata_2019_r)

head(tripdata_2019_r[tripdata_2019_r$tripduration>3600,], 5)

nrow(tripdata_2019_r[tripdata_2019_r$tripduration>3600,])

nrow(tripdata_2019_r[tripdata_2019_r$tripduration<60,])

tripdata_2019_r <- tidyr::separate(tripdata_2019_r, starttime, c("startdate", "starttime"), sep = " ")
tripdata_2019_r <- tidyr::separate(tripdata_2019_r, startdate, c("syear", "startmonth", "startday"), sep = "-")

tripdata_2019_r <- tidyr::separate(tripdata_2019_r, stoptime, c("stopdate", "stoptime"), sep = " ")
tripdata_2019_r <- tidyr::separate(tripdata_2019_r, stopdate, c("stopyear", "stopmonth", "stopday"), sep = "-")
head(tripdata_2019_r, 5)

tripdata_2019_r <- subset(tripdata_2019_r, select = -c(syear, stopyear))
tripdata_2019_r <- subset(tripdata_2019_r, select = -c(stopmonth, startmonth))
head(tripdata_2019_r, 5)

library(lubridate)
tripdata_2019_r$starttime<- hms(tripdata_2019_r$starttime)
tripdata_2019_r$starttime<- as.numeric(tripdata_2019_r$starttime)
tripdata_2019_r$starttime<- round(tripdata_2019_r$starttime,0)

tripdata_2019_r$stoptime<- hms(tripdata_2019_r$stoptime)
tripdata_2019_r$stoptime<- as.numeric(tripdata_2019_r$stoptime)
tripdata_2019_r$stoptime<- round(tripdata_2019_r$stoptime,0)
head(tripdata_2019_r, 5)

nrow(tripdata_2019_r[tripdata_2019_r$startmonth != tripdata_2019_r$stopmonth,])
nrow(tripdata_2019_r)

########################################################################################################################################

tripdata_2020 <- read.csv("C:/Users/andre/OneDrive/Desktop/Uni/Statistical Learning/project/bluebikes_tripdata_2020.csv")

tripdata_2020_r <- subset(tripdata_2020, select = -c(usertype, gender, start.station.name, end.station.name))

tripdata_2020_r <- tidyr::separate(tripdata_2020_r, starttime, c("startdate", "starttime"), sep = " ")
tripdata_2020_r <- tidyr::separate(tripdata_2020_r, startdate, c("syear", "startmonth", "startday"), sep = "-")

tripdata_2020_r <- tidyr::separate(tripdata_2020_r, stoptime, c("stopdate", "stoptime"), sep = " ")
tripdata_2020_r <- tidyr::separate(tripdata_2020_r, stopdate, c("stopyear", "stopmonth", "stopday"), sep = "-")
head(tripdata_2020_r, 5)

tripdata_2020_r <- subset(tripdata_2020_r, select = -c(syear, stopyear))
tripdata_2020_r <- subset(tripdata_2020_r, select = -c(stopmonth, startmonth))
head(tripdata_2020_r, 5)

tripdata_2020_r$starttime<- hms(tripdata_2020_r$starttime)
tripdata_2020_r$starttime<- as.numeric(tripdata_2020_r$starttime)
tripdata_2020_r$starttime<- round(tripdata_2020_r$starttime,0)

tripdata_2020_r$stoptime<- hms(tripdata_2020_r$stoptime)
tripdata_2020_r$stoptime<- as.numeric(tripdata_2020_r$stoptime)
tripdata_2020_r$stoptime<- round(tripdata_2020_r$stoptime,0)
head(tripdata_2020_r, 5)

nrow(tripdata_2020_r[tripdata_2020_r$startmonth != tripdata_2020_r$stopmonth,])
nrow(tripdata_2020_r)

colnames(tripdata_2019_r)
colnames(tripdata_2020_r)
colnames(tripdata_2019)

sum(is.na(tripdata_2019_r$birth.year))
tripdata_2020_r$birth.year[is.na(tripdata_2020_r$birth.year)] <- ("not_dec")
