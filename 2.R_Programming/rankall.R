setwd("D:/files/projects/coursera/datascience/2.R_Programming")
rankall <- function(outcome, num = "best")
{
	data<-read.csv("data/outcome-of-care-measures.csv",colClasses="character")

	if(outcome=="heart attack")
		colOutcome<-11
	else if(outcome=="heart failure")
		colOutcome<-17
	else if(outcome=="pneumonia")
		colOutcome<-23
	else
		stop("invalid outcome")

	result<-NULL
	resultState<-NULL
	for(state in levels(as.factor(data$State))){
		temp<-data[data$State==state,]
		temp[,colOutcome]<-as.numeric(temp[,colOutcome])
		resultState<-c(resultState,state)
		numtemp<-num
		if(numtemp=="best")
			numtemp<-1
		else if(numtemp=="worst")
			numtemp<-nrow(temp)
		else if(numtemp>nrow(temp))
			numtemp<- NA
		
		

		temp<-temp[with(temp,order(temp[colOutcome]
		,temp$Hospital.Name)),][2]
		
		if(is.na(numtemp))
			result<-c(result,"<NA>")
		else
			result<-c(result,temp[,][[numtemp]])		

	}
	res<-as.data.frame(matrix(c(result,resultState),ncol=2))
	names(res)<-c("hospital","state")
	return(res)

}