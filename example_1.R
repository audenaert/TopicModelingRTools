library(XML)
library(mallet)
library(wordcloud)

source("functions/lda.R")
source("functions/import.R")
#source("functions/export.R")

data.dir <- "data/ap"

docs <- loadDocuments(data.dir, recursive=F);
stoplist <- "stop-words/stop-words_english_3_en.txt"
model <- trainSimpleLDAModel(docs, 100, stoplist=stoplist)
print("printing topic word clouds")
plotTopicWordcloud(model)