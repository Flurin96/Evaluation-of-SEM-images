# ------------------------------------------------------------------------------
## Function to determine the wide and length of bacteria cells
# Function which can measure point to point (p2p) in a picture
# Version V2
# Flurin Mathis
# ZHAW-LSFM, Empa Duebendorf
# +41 79 838 27 72
# flurinmahtis@gmail.com


p2p <- function() # end with ctrl-click or Esc
{ 
  
  n = 512
  ans1 <- numeric()
  ans2 <- numeric()
  
  
  #Set know distance from scale bar via text box
  message1 = "Set Length of the scale bar:"
  Dialog1.input = dlgInput(message1)
  set_knownDistance = as.numeric(Dialog1.input$res)

  # Measure the length of the known scale bar
  message2 = "Click on the Star and End Point of the known scale bar"
  Dialog2 = winDialog(type = c("okcancel"), message2)

  # Define the set_knownDistance in with clicking on the plot
    a <- locator(2, type = "o", pch = 3, col = "blue1")
  meassured_knownDistance <- sqrt(sum(sapply(a, diff)^2))
  TransformFactor = set_knownDistance / meassured_knownDistance # correction factor
  
  
  # Measure the length bacteria cells
  message3 = "Click on the Star and End Point of the bacteria cells."
  Dialog3 = winDialog(type = c("okcancel"), message3)
  
  #### Hier Weitermachen. Loop unten muss selektiv beendet werden können sobald alle Zell-Längen vermessen wurden.
  
  while (n > 0) {
    # this call to locator places 2 points as crosses
    # and connects them with a line for the length of cells
    p <- locator(2, type = "o", pch = 3, col = "magenta")
    if (is.null(p)) break
    
    ans1 <- c(ans1, sqrt(sum(sapply(p, diff)^2)))
    n <- n - 1
    
  }
    ans1 = ans1 * TransformFactor
  
  return(ans1) # return the vector of length
 
  
  while (n > 0) {
    # this call to locator places 2 points as crosses
    # and connects them with a line for the wide of cells
    g <- locator(2, type = "o", pch = 3, col = "green")
    if (is.null(p)) break

    ans2 <- c(ans2, sqrt(sum(sapply(g, diff)^2)))
    n <- n - 1
  }
  ans2 = ans2 * TransformFactor
  return(ans2) # return the vector of wide
  
}

