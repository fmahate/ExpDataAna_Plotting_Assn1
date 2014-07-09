################################################################################
################################################################################
## Filename:    assn_plots.R
## Author:      Hidden for grading purpose
## Desc:        Assignment 1 for "Exploratory Data Analysis" course
## Date:        June 8, 2014
################################################################################
################################################################################

## Imports


################################################################################
## Desc:    Download and extract (unzip) raw data
## Returns: The extracted file/folder path
################################################################################
downloadAndExtractRawData <- function(dataDir="./data", 
                                      filenameWOExt,
                                      compressedFileExt,
                                      fileExt) {
  
  # Create data dir:
  if(!file.exists(dataDir)) {dir.create(dataDir)}
  
  # Download raw data package:
  localFilePkgPath <- paste0(dataDir, "/", filenameWOExt, ".", compressedFileExt)
  if(!file.exists(localFilePkgPath)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, localFilePkgPath, mode="wb")
    dateDownloaded <- date()
    message(paste("Date Downloaded:",dateDownloaded))
  }
  
  # Extract raw data package:
  # suppress warning which are generated when files (if exist) are not overwritten!
  suppressWarnings(unzip(localFilePkgPath, overwrite=FALSE, exdir=dataDir, setTimes=TRUE))
  
  # Verify and return the extracted package folder/file name
  extractedPkgFolderPath <- list.files(dataDir, full.names=TRUE, 
                                       pattern=paste0("(^", filenameWOExt, ")(.", fileExt, "$)"))
  if(length(extractedPkgFolderPath) != 1) {
    message("Error trying to unzip and locating the uncompressed file/folder from the following:")
    print(list.files(dataDir, full.names=TRUE))
    stop("Error trying to unzip and locating the uncompressed file/folder!")
  }
  extractedPkgFolderPath
}

################################################################################
## Desc:    Load and scrub UCI Machine Learning dataset
## Returns: List of functions to access cached data
################################################################################
makeUCIMachineLearningDS <- function(data = data.frame()) {
  ## instance vars:
  dataDir <- "./data"
  filenameWOExt <- "household_power_consumption"
  compressedFileExt <- "zip"
  fileExt <- "txt"
  
  ## Download and extract raw data
  extractedFilePath <- downloadAndExtractRawData(dataDir, filenameWOExt, compressedFileExt, fileExt)
  
  ## Setter - data
  set <- function(dir = "./", filename = extractedFilePath) {
    filepath <- paste0(dir, "/", filename)
    
    # Load the column names
    columnNames <-
      read.table(filepath, sep=";", na.strings=c("NA", "?"), nrows=1)
    columnNames <- sapply(unlist(columnNames), FUN=function(X){tolower(gsub("_", "", X))})
    
    # Load the dataset
    localData <- 
      read.table(filepath, sep=";", na.strings=c("NA", "?"), skip=66637, nrows=2880)
    colnames(localData) <- columnNames
    
    # Scrub data:
    #localData$date <- as.Date(localData$date, format="%d/%m/%Y")
    #localData$time <- as.ts(localData$time)
    localData$datetime <- strptime(paste(localData$date, localData$time), 
                                   format="%d/%m/%Y %H:%M:%S")
    
    ## Set in the calling scope
    data <<- localData
  }
  
  ## Getter - data
  get <- function() { data }
  
  # Return list of func(s)
  list(set = set,
       get = get)
}

################################################################################
## Desc:    Get the scrubbed UCI Machine Learning dataset
## Returns: the UCI Machine Learning dataset
################################################################################
getUCIMLDS <- function() {
  UCIMachineLearningDS <- makeUCIMachineLearningDS()
  UCIMachineLearningDS$set()
  UCIMachineLearningDS$get()
}


#### Global vars

## Load UCI Machine Learning dataset (ucimlds)
ucimlds <- getUCIMLDS()

