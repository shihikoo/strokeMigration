
source('methods.R')
source('functions.R')

mydb<-LoadDatabase()

projectTb <- dbReadTable(conn = mydb,name = 'Projects')

newData <- data.frame(idProject = 3, Name = 'test')

dbWriteTable(conn = mydb, name = 'Projects', value = as.data.frame(newData), overwrite = FALSE, append = T,row.names = FALSE)


library(psych)

loginfo <- data.frame(username = 'shihiko', password = 'littleFrance204', dbname = 'HistoricalSR', port=3306, host = 'camarades.csz4yw16uj0b.eu-west-1.rds.amazonaws.com'
                      , stringsAsFactors = F)

save(loginfo, file = 'data/secret.RData')
                 
                 