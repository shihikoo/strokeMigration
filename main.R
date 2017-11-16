
source('methods.R')
source('functions.R')

mydb<-LoadDatabase()

# example of read table
projectsTable <- dbReadTable(conn = mydb,name = 'Projects')
projectTagsTable <- dbReadTable(conn = mydb,name = 'ProjectTags')

fullProjects <- merge(projectsTable, projectTagsTable, by=intersect(names(projectsTable), names(projectTagsTable)))



# example of write into table
newData <- data.frame(idProject = 3, Name = 'test')
dbWriteTable(conn = mydb, name = 'Projects', value = as.data.frame(newData), overwrite = FALSE, append = T,row.names = FALSE)



# Exmaples for using tables
# # DELETE LAST SET OF TEMP DATA
# dbSendQuery(mydb, "DELETE FROM tempTable")
# 
# # APPEND R DATA FRAME TO TEMP DATA
# dbWriteTable(mydb, value=csvData, name=tempTable, row.names=FALSE,
#              field.types=list(PrimaryKey="VARCHAR(10)", Column2="VARCHAR(255)", 
#                               Column3="VARCHAR(255)", Timestamp="TIMESTAMP"), 
#              append=TRUE, overwrite=FALSE)
# 
# # LEFT JOIN ... NULL QUERY TO APPEND NEW RECORDS NOT IN TABLE
# dbSendQuery(mydb, "INSERT INTO finalTable (Column1, Column2, Column3, Timestamp)
#              SELECT Column1, Column2, Column3, Timestamp 
#              FROM tempTable f
#              LEFT JOIN finalTable t  
#              ON f.PrimaryKey = t.PrimaryKey
#              WHERE f.PrimaryKey IS NULL;")
# 
# # UPDATE INNER JOIN QUERY TO UPDATE MATCHING RECORDS
# dbSendQuery(mydb, "UPDATE finalTable f
#              INNER JOIN tempTable t  
#              ON f.PrimaryKey = t.PrimaryKey
#              SET f.Column1 = t.Column1,
#                  f.Column2 = t.Column2,
#                  f.Column3 = t.Column3,
#                  f.Timestamp = t.Timestamp;")
