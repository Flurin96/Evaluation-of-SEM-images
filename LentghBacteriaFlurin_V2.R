####
# Script to measure length of structures in REM-Images
# Flurin Mathis, +41 79 838 27 72, flurinmathis@gmail.com
# Version 1.0
###



## Import Section---------------------------------------------------------------

library(imager)
library(car)
library(mixtools)
library(svDialogs)
source('p2p.R')

im = load.image("S. Chinhatense.png")   # Load picture
plot(im)  # plot picture


outputP2P = p2p() # measure lenght in the picture with clicking from point to point
                # p2p(INPUT) -> INPUT = Scale Size of the SEM-Scale

sortValues = sort(outputP2P)  # sort values from low to high

print(sortValues)



## Statistic--------------------------------------------------------------------


summary(sortValues) #  Min. 1st Qu. Median Mean 3rd Qu. Max. 
boxplot(sortValues)

newVector = rbind(c(1:length(sortValues)),sortValues)

plot(cut(sortValues,44))

