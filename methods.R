


LoadDatabase <- function(){ 
  library(RMySQL)
  dataName <- 'data/secret.RData'
  load(file=dataName)
  
  mydb <- dbConnect(MySQL()
                    , user=loginfo$username
                    , password= loginfo$password
                    , dbname=loginfo$dbname
                    ,port=loginfo$port
                    , host=loginfo$host)
}
