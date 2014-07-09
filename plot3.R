################################################################################
################################################################################
## Filename:    plot3.R
## Author:      Hidden for grading purpose
## Desc:        Assignment 1 for "Exploratory Data Analysis" course
## Date:        June 8, 2014
################################################################################
################################################################################


################################################################################
## Desc:    Third Plot: Plot of "Sub Metering 1, 2, 3" against "Date-time"
## Outputs: the plot to the given filename
################################################################################
makePlot3 <- function(dir = "./data", filename = "plot3.png") {
  # Backup the PNG graphics file (if it exists):
  grFilename <- paste0(dir, "/", filename)
  if (file.exists(grFilename)) {
    file.copy(grFilename, paste0(dir, "/", "Copy of ", filename), overwrite=TRUE)
    file.remove(grFilename)
  }
  
  # Create the PNG graphics file as output device and plot to it:
  png(grFilename)
  drawPlot3()
  dev.off()
}

################################################################################
## Desc:    Third Plot: Plot of "Sub Metering 1, 2, 3" against "Date-time"
## Draws:   the plot to the current device
################################################################################
drawPlot3 <- function(x=ucimlds$datetime, 
                      y=ucimlds[,c("submetering1","submetering2","submetering3")],
                      ...) {
  plot(x=x, y=y[,1], type="l", main="", xlab="", ylab="Energy sub metering")
  lines(x=x, y=y[,2], col="red")
  lines(x=x, y=y[,3], col="blue")
  legend("topright", 
         col=c("black", "red", "blue"), 
         lty=c(1,1,1), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         ...)
}
