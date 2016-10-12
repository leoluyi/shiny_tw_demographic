source("external/uiHead.R",local=T)

library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("flatly"),
  
  div(a(href = "http://www.eolembrain.com.tw/",
        img(src = "http://survey.panelpower.com.tw/mail/img/EOLembrain_logo_s.png", 
            # src = "./img/EOLembrain_logo_s.png",
            alt = "EOLembrain",
            align = "right"),
        target="_blank")),
  
  # Application title                
  titlePanel("[EOLembrain] TW Geometric Tools"),
  
  source("external/sidebar.R",local=T)$value,
  source("external/main.R",local=T, encoding = "UTF-8")$value
))
