# Go through the builtin R data sets, figure out which is a list!
# Note: the command data() pulls up a complete list of datasets available locally on your computer.

# Coded by: Danielle Ripsman
#********************************************************************

Find_Lists <- function(){
  # The names of each data set are stored in the following, under the heading "Item"
  dataStore = data()[3]$results
  data.inLists = c() # Initialize list of datasets
  
  for (i in 1:nrow(dataStore)) {
    # Sometimes they have brackets after the name, so we parse those:
    datasetName = str_split(dataStore[[i, "Item"]], " ")[[1]][1]
    
    # Since data.frames are techinically lists and I only want lists:
    if (is.list(get(datasetName)) & !is.data.frame(get(datasetName))) {
      data.inLists = c(data.inLists, datasetName)
    }
  }
  
  print(data.inLists)
}
