sidebarPanel(
  
  wellPanel(
    uiOutput("var_selected_panel")),
  
  wellPanel(
    uiOutput("sex_panel"),
    uiOutput("age_panel"),
    uiOutput("age_by10_panel"),
    uiOutput("area_NCSE_panel"),
    uiOutput("city_panel"),
    tags$style(type='text/css', "#age_selected { height: 300px; }"),
    tags$style(type='text/css', "#age_by10_selected { height: 300px; }"),
    tags$style(type='text/css', "#area_NCSE_selected { height: 100px; }"),
    tags$style(type='text/css', "#city_selected { height: 300px; }")
    
    
    
  )
)


