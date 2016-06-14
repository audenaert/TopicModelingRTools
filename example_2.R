## Basic Explorations
##
## 

source("functions/lda.R")
source("functions/import.R")

# As in example 1, train a topic model from the AP dataset
data.dir <- "data/ap"
docs <- loadDocuments(data.dir);
stoplist <- "stop-words/stop-words_english_3_en.txt"
model <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)

# get a specific topic
topic.2 <- model$getTopic(2)

# list the top 10 words
topic.2$getWords(10)

# list the top 10 documents
topic.2$getDocs(10)

# display the text of the 3rd document
# Note the vector returned by getDocs is the likelihood of the given topic within a document. 
# the vector's names are the id of the associated document
top.docs <- topic.2$getDocs(10)
model$getDocument(names(top.docs[3]))
