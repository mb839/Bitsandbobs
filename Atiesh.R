
nKills <- 185  #185
nSdrops <- 76 #76
sDroprate <- nSdrops/nKills


nRuns <- 100001

bossProbs <- c(sDroprate,sDroprate,sDroprate,sDroprate, #Abomination
               sDroprate,sDroprate,sDroprate,           #Plague
               sDroprate,sDroprate,sDroprate,           #Spider
               sDroprate,sDroprate,sDroprate)           #Military

oneRun <- function() {
  
  runSplinters <- 0
  
  for (prob in bossProbs) {as
    
    runSplinters[runif(1,0,1)<prob]<- runSplinters + 1
    
  }
  
  return(runSplinters)
  
}


toSplinters <- function(x) {
  
  runs <- 0
  splinters <- 0
  
  while (splinters<x) {
    
    runs <- runs +1
    splinters <- splinters + oneRun()

  }
  
  return(runs)
  
}


runsToSplinters <- c()

i<-0

while (i < nRuns) {
  i <- i+1
  
  runsToSplinters <- c(runsToSplinters, toSplinters(12))
  
}

df <- tabulate(runsToSplinters)

#write.csv2(df, "E:/Documents/OneDrive/Documents/Atiesh_MB_1i_.csv")

for (z in (1:7)) {
  
  print(eval(df[z]/nRuns))
  
}
