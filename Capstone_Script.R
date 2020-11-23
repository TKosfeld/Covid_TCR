library(ggplot2)
library(dplyr)


covid <- read.csv("Covid_Data.csv")
covid
hosp_cov <- covid %>% filter(covid$ï..Status == "hosp")
nothosp_cov <- covid %>% filter(covid$ï..Status == "not-hosp")
icu_cov <- covid %>% filter(covid$ï..Status == "ICU")

scatter.smooth(x=hosp_cov$days_from_diagnosis_to_sample, y=hosp_cov$Count, main="Hospital")
scatter.smooth(x=nothosp_cov$days_from_diagnosis_to_sample, y=nothosp_cov$Count, main="Non-Hospital")
scatter.smooth(x=icu_cov$days_from_diagnosis_to_sample, y=icu_cov$Count, main="ICU-Hospital")



ggplot(covid, aes(x = covid$days_from_diagnosis_to_sample, y = covid$Count, colour = covid$ï..Status
                  )) + geom_point() + geom_smooth(method = lm) + xlim(7, 20)

ggplot(covid, aes(x = covid$days_from_diagnosis_to_sample, y = covid$Count, colour = covid$ï..Status
)) + stat_density2d ()

covid_rec <- read.csv("Capstone_Recovery.csv")
c_rec <- covid_rec %>% filter(covid_rec$covid_recovered == FALSE) 
c_rec <- c_rec %>% filter(c_rec$Count < 500000)

c_rec2 <- covid_rec %>% filter(covid_rec$covid_recovered == TRUE) 
c_rec2 <- c_rec2 %>% filter(c_rec2$Count > 250000)
covidr <- rbind(c_rec, c_rec2)
covidr
ggplot(covidr, aes(x = covidr$ï..days, y = covidr$Count, colour = covidr$covid_recovered
)) + geom_point() + geom_smooth(method = lm) + xlim(7, 50)