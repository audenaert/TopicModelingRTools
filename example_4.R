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
  model <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)
}

model.leo13 <- computeSubSet(model, 2, "Leo XIII")
