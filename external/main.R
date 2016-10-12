mainPanel(
  wellPanel(
    uiOutput("filter_panel"),
    helpText("Example: city %in% levels(city)[1:3]  ",
             "(在變數city裡的第1~3個值內)"),
    verbatimTextOutput("filter_text")
  ),
  
  wellPanel(
    p("地區說明："), 
    p("北部地區: 基隆市, 臺北市, 新北市, 桃園市, 新竹縣, 新竹市"), 
    p("中部地區: 苗栗縣, 臺中市, 彰化縣, 雲林縣, 南投縣"), 
    p("南部地區: 嘉義市, 嘉義縣, 臺南市, 高雄市, 屏東縣"), 
    p("東部離島地區: 宜蘭縣, 花蓮縣, 臺東縣, 金門縣, 連江縣, 澎湖縣")
  ), 
  
  p(actionButton("goButton", "Go! 產生表格")),
  
  div("Table Export"),
  
  conditionalPanel(condition='input.goButton > 0',
                   tableOutput("tableOutput"))
)
