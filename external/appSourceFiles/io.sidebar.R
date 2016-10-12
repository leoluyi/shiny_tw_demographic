output$var_selected_panel <- renderUI({
  if(!is.null(dat())){
    checkboxGroupInput(
      "var_selected",
      label="Choose variables:",
      choices  = varnamesfactors(),
      selected = varnamesfactors()[[1]],
    )
  }
})



output$sex_panel <- renderUI({
  if(any("sex" %in% input$var_selected)){
    selectInput(
      "sex_selected",
      label="Choose sex:",
      choices  = c("All", levels(dat()$sex)),
      selected = "All",
      multiple=TRUE,
      selectize=FALSE
    )
  } else return()
})

output$age_panel <- renderUI({
  if(any("age" %in% input$var_selected)){
    selectInput(
      "age_selected",
      label = "Choose age:",
      choices  = c("All", levels(dat()$age)),
      selected = "All",
      multiple=TRUE,
      selectize=FALSE
    )
  } else return()
})

output$age_by10_panel <- renderUI({
  if(any("age_by10" %in% input$var_selected)){
    selectInput(
      "age_by10_selected",
      label="Choose age_by10:",
      choices  = c("All", levels(dat()$age_by10)),
      selected = "All",
      multiple=TRUE,
      selectize=FALSE
    )}
  else return()
})

output$city_panel <- renderUI({
  if(any("city" %in% input$var_selected)){
    selectInput(
      "city_selected",
      label="Choose cities:",
      choices  = c("All", levels(dat()$city)),
      selected = "All",
      multiple=TRUE,
      selectize=FALSE
    )}
  else return()
})

output$area_NCSE_panel <- renderUI({
  if(any("area_NCSE" %in% input$var_selected)){
    selectInput(
      "area_NCSE_selected",
      label="Choose area_NCSE:",
      choices  = c("All", levels(dat()$area_NCSE)),
      selected = "All",
      multiple=TRUE,
      selectize=FALSE
    )}
  else return()
})



