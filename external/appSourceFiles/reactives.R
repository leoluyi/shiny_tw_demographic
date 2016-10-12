dat <- reactive({ Gtableflat })

varnames <- reactive({
  if(!is.null(dat())) v <- names(dplyr::select(dat(),-Freq))
  else v <- NULL
  v
})

varnamesfactors <- reactive({
  var.is.factor <- sapply(dplyr::select(dat(),-Freq),is.factor)
  if(!is.null(varnames())) v <- varnames()[var.is.factor]
  else v <- NULL
  v
})


## Data subsetting
d.sub <- reactive({
  if(!is.null(dat())){
    d.sub <- dat()

    ## primary filter
    if(length(input$filter_formula) != 0 && input$filter_formula!="") {
      d.sub <- dplyr::filter_(
        dat(),
        .dots = as.formula(paste0("~", input$filter_formula, collapse = " ")))
    }

    ## dplyr::select variables
    d.sub <- dplyr::select_(d.sub,
                            .dots = c(input$var_selected, "Freq"))
  } else d.sub <- dat()
  d.sub
})

d.sub2 <- reactive({
  if(!is.null(d.sub())){
    d <- d.sub()

    if(any("city" %in% input$var_selected) & !any(input$city_selected == "All")){
      #     filter_criteria <- lazyeval::interp(~ which_column %in% input$city_selected,
      #                                          which_column = as.name("city"))
      #     dplyr::filter_(dat(), filter_criteria)
      d <- dplyr::filter(d, city %in% input$city_selected)
    }

    if(any("sex" %in% input$var_selected) & !any(input$sex_selected == "All")){
      d <- dplyr::filter(d, sex %in% input$sex_selected)
    }

    if(any("age" %in% input$var_selected) & !any(input$age_selected == "All")){
      d <- dplyr::filter(d, age %in% input$age_selected)
    }

    if(any("age_by10" %in% input$var_selected) & !any(input$age_by10_selected == "All")){
      d <- dplyr::filter(d, age_by10 %in% input$age_by10_selected)
    }

    if(any("area_NCSE" %in% input$var_selected) & !any(input$area_NCSE_selected == "All")){
      d <- dplyr::filter(d, area_NCSE %in% input$area_NCSE_selected)
    }

    return(d)
  } else dat()
})

Output <- reactive({
  if(!is.null(input$var_selected))
    vars <- input$var_selected
  else vars <- "."

  xtab_formula <-
    formula(paste0(c("Freq ~ ", paste0(vars, collapse="+")),
                   collapse=""))

  xtab <- do.call(xtabs, list(xtab_formula, data=d.sub2(), drop.unused.levels=T))
  as.data.frame(prop.table(xtab)) %>%
    dplyr::rename(Prop = Freq) %>%
    mutate(Prop = paste0(format(round(Prop*100,2), nsmall=2), "%"))
})

