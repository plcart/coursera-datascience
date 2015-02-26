library(dplyr)
library(ggplot2)

# Load
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Filter
TotalEmissionsByYearType <- NEI %>% filter(fips=="24510") %>%  group_by(year,type) %>% summarize(Total=sum(Emissions))

# Rename columns
names(TotalEmissionsByYearType )<-c("Year","Type","Emission")

# Plot and Save
resultplot=qplot(Year,Emission,data=TotalEmissionsByYearType ,color=Type,facets = Type ~., main="Baltimore City Source Type")
ggsave(file="plot3.png",plot=resultplot,width=6.4, height=6.4)
