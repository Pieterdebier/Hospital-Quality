best <- function(state="IL", outcome="heart attack") {
        ## Read outcome data
        ## Check that state and outcome are valid
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        DataSet<-read.csv("~/Hospital-Quality/data/outcome-of-care-measures.csv")
        
        if (outcome=="heart attack") {
                DataSet<-DataSet[,c("Hospital.Name", "State",
                                    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]}

        if (outcome=="heart failure") {
                DataSet<-DataSet[,c("Hospital.Name", "State",
                                    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]}
        
        if (outcome=="pneumonia") {
                DataSet<-DataSet[,c("Hospital.Name", "State",
                                    "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]}
        
        
        # set the character values to nummeric
        DataSet[,3]<-as.numeric(DataSet[,3])
        
        DataSet<-DataSet[complete.cases(DataSet),]
        
        DataSet<-subset(x = DataSet,subset = State==state)
        
        DataSet<-DataSet[order(DataSet[,1]),]
        DataSet<-DataSet[order(DataSet[,3]),]
        
        as.character(DataSet[1,1])
        
}