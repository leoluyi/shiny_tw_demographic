
# source reactive expressions
source("external/appSourceFiles/reactives.R",local=T)

# UI outputs --------------------------------------------------------------

source("external/appSourceFiles/io.sidebar.R",local=T)
source("external/appSourceFiles/io.main.R",local=T)

# Primary outputs ---------------------------------------------------------

## filter text
output$filter_text <- renderText({
  input$filter_formula
})

## table
output$tableOutput <- renderTable({
  input$goButton
  isolate(Output())
})

# ftable(xtabs(Freq ~ city+sex, Gtableflat))
