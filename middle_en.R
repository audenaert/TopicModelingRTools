readFile <- function(txt.path, to.lower=T)
{
  print(paste("Reading text from '", txt.path, "'"))
  rawtext <- scan(txt.path, what="character", sep="\n")
  
  result <- rawtext
  if (to.lower)
  {
    result <- paste(rawtext, collapse=" ")
  }
  
  return (result)
}

data.dir <- "data/middle_en_poems"
fname <- "Cleanness.txt"
cleanness.path <- paste(data.dir, "/", fname, sep="")
rawtext <- scan(cleanness.path, what="character", sep="\n")
temp <- split(rawtext, ceiling(seq_along(rawtext)/12))
temp <- do.call(rbind, temp)
temp.2 <- sapply(temp, function(txt) { return (paste(txt, collapse = " ")) })
temp.2 <- cbind(fname, temp.2)
