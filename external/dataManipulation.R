library(dplyr)

# Gtable <- read.ftable("external/Gtable.txt")
Gtable <- read.ftable(
  con <- file("external/data/tw_people_ftable_utf8.txt", "r", encoding = "UTF-8")
  ); close(con); rm(con)

Gtableflat <- as.data.frame(Gtable); rm(Gtable)
# str(Gtableflat)

# Recode
Gtableflat$area_NCSE <- memisc::recode(
  Gtableflat$city,
  北部地區 <- c("基隆市","臺北市","新北市","桃園市","新竹縣","新竹市"),
  中部地區 <- c("苗栗縣","臺中市","彰化縣","雲林縣","南投縣"),
  南部地區 <- c("嘉義市","嘉義縣","臺南市","高雄市","屏東縣"),
  東部離島地區 <- c("宜蘭縣","花蓮縣","臺東縣","金門縣","連江縣","澎湖縣"),
  otherwise="copy"
)

# factor重新排序
Gtableflat$area_NCSE <- factor(Gtableflat$area,
                               levels=c("北部地區",
                                        "中部地區",
                                        "南部地區",
                                        "東部離島地區"))


# 年齡分成10歲一組
for(i in 1:11){
  Gtableflat$age_by10[Gtableflat$age %in% levels(Gtableflat$age)[c(2*i-1, 2*i)]] <- i
}

Gtableflat$age_by10 <- factor(Gtableflat$age_by10, levels=1:11,
                              labels=c(
                                "0~9歲",
                                "10~19歲",
                                "20~29歲",
                                "30~39歲",
                                "40~49歲",
                                "50~59歲",
                                "60~69歲",
                                "70~79歲",
                                "80~89歲",
                                "90~99歲",
                                "100歲以上"
                              ))
# 變數排序
Gtableflat <- Gtableflat %>%
  dplyr::select(sex, age, age_by10, area_NCSE, city, Freq)


# 匯出物件-------------------------------------------------------------------

# for (i in 1:5){
#   Encoding(levels(Gtableflat[[i]])) <- "UTF-8"
# }
#
# save(Gtableflat, file="./external/Gtableflat.RData")

