# This example looks at reading data from muliple directories and using those directories as 'classes'
# to group the data. It also examines reading and writing .csv files. This would allow you, for example
# to work with the data in Excel or OpenRefine, re-import custom class labels and go from there.

source("functions/lda.R")
source("functions/import.R")

if (retrain.model)
{
  data.dir <- "data/encyclicals"
  print(paste("Training LDA model from documents in", data.dir))
  docs <- loadDocuments(data.dir);
  stoplist <- "stop-words/stop-words_english_3_en.txt"
  # model <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)
}

## Write the topic assigments to a CSV file
#  NOTE you will need to create a folder for output data called 'analysis'

# bind the filenames and other document classes read from the system to the topic assignments.
# I strip the last column (the document text) from the list, because that doesn't belong in a 
# CSV file (and because it doesn't get formatted correctly)

write.csv(docs[, 1:(ncol(docs)-1)], "analysis/docs-meta.csv")

# Now you can use Excel, OpenRefine or another tool to open, explore and edit this file. 
# For example, you could add a date column and fill it in based on the file name. Note that 
# you could also do this on the 'docs' matrix before you trained the data. Once you've 
# edited the file, you can read it back into R. 
#
# I renamed the first three columns to 'Path', 'RelativePath', and 'Pope' and added a 
#'Date' column after Pope
doc.assignements.updated <- read.csv("analysis/docs-meta.csv")

# Next, combine the updated document class/metadat information with the text from the 
# original docs data.
docs.updated <- cbind()

#### Work with the topics in Excell
# first, we'll add column headers
dAssignments <- model$docAssignments
colnames(dAssignments) <- paste("Topic", 1:50, sep=" ")

dAssignments <- cbind(docs[, 1:(ncol(docs)-1)], dAssignments)

#### Perform subsetting ####

model.leo13 <- computeSubSet(model, 2, "Leo XIII")


