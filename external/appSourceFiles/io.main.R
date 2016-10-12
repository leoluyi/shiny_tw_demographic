

output$filter_panel <- renderUI({
  textInput(inputId = "filter_formula",
            label = "Please enter the filtering formula")
})
