setwd("D:/files/projects/coursera/datascience/2.R_Programming")
best<-function(state,outcome)
{
	data<-read.csv("data/outcome-of-care-measures.csv",colClasses="character")
	
	data<-data[data$State==state,]
	colOutcome<-NULL
	if(nrow(data)==0)
		stop("invalid state")
	if(outcome=="heart attack")
		colOutcome<-11
	else if(outcome=="heart failure")
		colOutcome<-17
	else if(outcome=="pneumonia")
		colOutcome<-23
	else
		stop("invalid outcome")
	
	data[,colOutcome]<-as.numeric(data[,colOutcome])
	
	data<-data[!is.na(data[colOutcome]),]
	return(head(data[with(data,order(data[colOutcome]
		,data$Hospital.Name)),][2],n=1)[[5000]])
}