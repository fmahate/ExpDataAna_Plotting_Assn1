################################################################################
################################################################################
## Filename:    plot1.R
## Author:      Hidden for grading purpose
## Desc:        Assignment 1 for "Exploratory Data Analysis" course
## Date:        June 8, 2014
################################################################################
################################################################################


################################################################################
## Desc:    First Plot: Histogram of "Global Active Power"
## Outputs: the plot to the given filename
################################################################################
makePlot1 <- function(dir = "./data", filename = "plot1.png") {
  # Backup the PNG graphics file (if it exists):
  grFilename <- paste0(dir, "/", filename)
  if (file.exists(grFilename)) {
    file.copy(grFilename, paste0(dir, "/", "Copy of ", filename), overwrite=TRUE)
    file.remove(grFilename)
  }
  
  # Create the PNG graphics file as output device and plot to it:
  png(grFilename)
  drawPlot1()
  dev.off()
}

################################################################################
## Desc:    First Plot: Histogram of "Global Active Power"
## Draws:   the plot to the current device
################################################################################
drawPlot1 <- function(x = ucimlds$globalactivepower) {
  hist(x=x, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
}
