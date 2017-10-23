library(vegan)
#library(rgl)


###################################################
# Define colors for later plotting
###################################################
mycolors = c('black', 'blue3', 'darkcyan', 'darkgoldenrod', 'brown','purple', 
	'deeppink1', 'darkorange', 'darkolivegreen', 'maroon', 'darksalmon', 
	'darkred','forestgreen','darkblue', 'darkturquoise','red', 'green3', 
	'gray50','gray33', 'darkmagenta')

## Alabama 7, PCO
## Mississippi 7, PCO
## Georgia Fishes 6
## North Carolina 5
## South Carolina 5
## Virginia 5
#3 Missouri 7

readCutoff <- function()
{
	cutoff <- readline(prompt='Enter cutoff number provided for you: ')
	if(!grepl("^[0-9]$",cutoff))
	{
		return(readCutoff())
	}	
	return(as.integer(cutoff))
}

getFishFile <- function()
{
	theName <- readline(prompt='Enter file name provided for you: ')
#	if(!grepl("^[a-zA-Z_]+$",theName))
#	{
#		return(getFishFile())
#	}	
	return(theName)
}

fishFile <- getFishFile()
clustCut <- readCutoff()
