## First Topic Models
##
## This file contains all that you need to setup and run your first topic model. 
## It will build a 50 topic model from the set of AP articles distributed with
## the original lda-c implementation by David Blei. 
## See https://www.cs.princeton.edu/~blei/lda-c/index.html

source("functions/lda.R")
source("functions/import.R")

# The directory from which to import data. The example includes the AP dataset, but
# you can easily run this with your own data by creating a new directory and adding
# the documents that you would like to model as .txt files, with one file per/document
data.dir <- "data/ap"

# This loads the documents from the directory above in a format that can be used 
# with Mallet.
docs <- loadDocuments(data.dir);

# Specify a set of stop-words, or commonly used words to be removed from the documents
# in order to improve model performance.
stoplist <- "stop-words/stop-words_english_3_en.txt"

# Train a document model with 50 topics. This will run Mallet over the documents
# from data.dir and store the results along with some supporting information 
# in a convenient data structure
model <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)
print("printing topic word clouds")

# Print the resulting topics as wordclouds for easy visualization.
plotTopicWordcloud(model)