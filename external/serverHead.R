library(shiny)
pkgs <- c("ggplot2", "memisc", "plyr", "dplyr","reshape2", "scales",
          "memisc")
pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
# if(length(pkgs)) install.packages(pkgs)

library(ggplot2)
library(plyr)
library(dplyr)
library(scales)

source("./external/dataManipulation.R", local = T, encoding="UTF-8")
# source("./external/Gtableflat.R", local = T, encoding="UTF-8")
# devtools::source_gist("78d31a20f6a6b0fd6896", local = F, encoding="UTF-8") # Gtableflat.R


# logo <- readPNG("www/img/EOLembrain_logo_s.png")
#logo.alpha <- 1
#logo.mat <- matrix(rgb(logo[,,1],logo[,,2],logo[,,3],logo[,,4]*logo.alpha), nrow=dim(logo)[1])
