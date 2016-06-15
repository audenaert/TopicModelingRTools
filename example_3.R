# Comparing topics

source("functions/lda.R")
source("functions/import.R")

# For this example, we'll train two models from the AP dataset and compare 
# the topics to discover similarities within the models and between the models.
if (retrain.model)
{
  data.dir <- "data/ap"
  print(paste("Training LDA model from documents in", data.dir))
  docs <- loadDocuments(data.dir);
  stoplist <- "stop-words/stop-words_english_3_en.txt"
  model.run.1 <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)
  
  model.run.2 <- trainSimpleLDAModel(docs, 50, stoplist=stoplist)
}

topic.3 <- model.run.1$getTopic(3)
topic.7 <- model.run.1$getTopic(7)
topic.diff.kl(topic.3, topic.7)

print("Computing similarity matrix")
similarity <- topic.similarity.kl(model.run.1)
print(similarity[1:5,1:5])

# Rank topics based on their similarity to topic one
topic.ix = 1
topic.k.similarity <- similarity[order(similarity[,topic.ix]),topic.ix]
topic.k.mostsimilar.ix <- as.numeric(names(topic.k.similarity[1]))
model.run.1$getTopic(topic.ix)$getWords(10)
model.run.1$getTopic(topic.k.mostsimilar.ix)$getWords(10)

# print the topics that are most similar to topic 2 in descending order
#order(similarity[2,])
# print the district mesure for these topics
#similarity[2, order(similarity[2,])]


#model$getTopic(2)$getWords(10)
#model$getTopic(19)$getWords(10)

