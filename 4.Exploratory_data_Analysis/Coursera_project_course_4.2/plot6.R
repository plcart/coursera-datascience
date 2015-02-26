library(dplyr)

# Load
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

index<-SCC[grep("Motor|Vehicle",SCC$Short.Name),1]
TotalEmissionsByMotorVehicles <- NEI %>% filter(fips== "24510" | fips == "06037")

TotalEmissionsByMotorVehicles <- TotalEmissionsByMotorVehicles[sapply(TotalEmissionsByMotorVehicles$SCC,function(x) x %in% index),] %>%
group_by(year,fips) %>% summarize(Total=sum(Emissions)) %>% mutate(City=c("Los Angeles", "Baltimore City"))

names(TotalEmissionsByMotorVehicles )<-c("Year","Fips","Emission","City")

resultplot=qplot(Year,Emission,data=TotalEmissionsByMotorVehicles ,color=City,facets = City ~., main="Baltimore City vs Los Angeles")

ggsave(file="plot6.png",plot=resultplot,width=6.4, height=6.4)
