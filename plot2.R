################################################################################
################################################################################
## Filename:    plot2.R
## Author:      Hidden for grading purpose
## Desc:        Assignment 1 for "Exploratory Data Analysis" course
## Date:        July 9, 2014
## 
## ***********  INSTRUCTIONS:  ***********
## Source assn_plots.R and then source this file and then execute makePlot2()
################################################################################
################################################################################


################################################################################
## Desc:    Second Plot: Plot of "Global Active Power" against "Date-time"
## Outputs: the plot to the given filename
################################################################################
makePlot2 <- function(dir = "./data", filename = "plot2.png") {
  # Backup the PNG graphics file (if it exists):
  grFilename <- paste0(dir, "/", filename)
  if (file.exists(grFilename)) {
    file.copy(grFilename, paste0(dir, "/", "Copy of ", filename), overwrite=TRUE)
    file.remove(grFilename)
  }
  
  # Create the PNG graphics file as output device and plot to it:
  png(grFilename)
  drawPlot2()
  dev.off()
}

################################################################################
## Desc:    Second Plot: Plot of "Global Active Power" against "Date-time"
## Draws:   the plot to the current device
################################################################################
drawPlot2 <- function(x=ucimlds$datetime, 
                      y=ucimlds$globalactivepower, 
                      title="Global Active Power (kilowatts)") {
  plot(x=x, y=y, type="l", main="", xlab="", ylab=title)
}
