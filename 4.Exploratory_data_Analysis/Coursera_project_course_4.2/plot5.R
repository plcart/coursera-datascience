library(dplyr)

# Load
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

index<-SCC[grep("Motor|Vehicle",SCC$Short.Name),1]
TotalEmissionsByMotorVehicles <- NEI %>% filter(fips=="24510")

TotalEmissionsByMotorVehicles <- TotalEmissionsByMotorVehicles[sapply(TotalEmissionsByMotorVehicles$SCC,function(x) x %in% index),] %>%
group_by(year) %>% summarize(Total=sum(Emissions))

png(file="plot5.png", width=480, height=480)
plot(TotalEmissionsByMotorVehicles$year,TotalEmissionsByMotorVehicles$Total,type="l",xlab="Year",ylab="Emission",main="Motor Vehicles Emission - Baltimore City", col=2)
dev.off()