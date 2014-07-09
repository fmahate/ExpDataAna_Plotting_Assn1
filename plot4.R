################################################################################
################################################################################
## Filename:    plot4.R
## Author:      Hidden for grading purpose
## Desc:        Assignment 1 for "Exploratory Data Analysis" course
## Date:        June 8, 2014
################################################################################
################################################################################


################################################################################
## Desc:    Plots the first assignment: Four Plots
## Outputs: the plot to the given filename
################################################################################
makePlot4 <- function(dir = "./data", filename = "plot4.png") {
  # Backup the PNG graphics file (if it exists):
  grFilename <- paste0(dir, "/", filename)
  if (file.exists(grFilename)) {
    file.copy(grFilename, paste0(dir, "/", "Copy of ", filename), overwrite=TRUE)
    file.remove(grFilename)
  }
  
  # Create the PNG graphics file as output device and plot to it:
  png(grFilename)
  par(mfrow=c(2,2))
  drawPlot2(title="Global Active Power")
  drawPlot42()
  drawPlot3(bty="n")
  drawPlot44()
  dev.off()
}

################################################################################
## Desc:    Fourth Plot, second subplot: Plot of "Voltage" against "Date-time"
## Draws:   the plot to the current device
################################################################################
drawPlot42 <- function(x=ucimlds$datetime, y=ucimlds$voltage) {
  plot(x=x, y=y, type="l", main="", xlab="datetime", ylab="Voltage")
}

################################################################################
## Desc:    Fourth Plot, fourth subplot: Plot of "Global Reactive Power" against "Date-time"
## Draws:   the plot to the current device
################################################################################
drawPlot44 <- function(x=ucimlds$datetime, y=ucimlds$globalreactivepower) {
  plot(x=x, y=y, type="l", main="", xlab="datetime", ylab="Global_reactive_power")
}
