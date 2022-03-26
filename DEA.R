getwd()
setwd("C:/Users/tough/OneDrive/Dokumen/R")
dir("data")

#call out packages
library(readxl)
library(deaR)
library(dplyr)
library(fPortfolio)

#Import data
contoh <- read_excel("data/contoh_DEA.xlsx")
contoh <- as.data.frame(data)
summary(contoh)

##Change column name
#Realisasi Dana Dekonsentrasi/kapita = rdd_kapita
#rasio PUS = rasio_pus
#rasio RS = rasio_rs
#rasio SDMK RS = rasio_sdmk_rs
#rasio SDMK PUS = rasio_sdmk_pus
colnames(contoh) <- c("", "AHH", "rdd_kapita", "rasio_pus", "rasio_rs", "rasio_sdmk_rs","rasio_sdmk_pus")
View(contoh)
?deaR
 
#Select input and output
dta <- read_data(contoh, dmus = 1, inputs = 3:7, outputs = 2)

#calculate the effiency
res <- model_basic(dta, orientation = "io", rts = "vrs")
result <- summary(res)
View(result)

efficiencies(res)
references(res)
targets(res)
lambdas(res)
plot(res, showPlots = TRUE)

eff <- plotEfficientFrontier(res)
?plot.fPORTFOLIO
