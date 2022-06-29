# INSTALL AND LOAD PACKAGES ################################
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

library(ggplot2)
library(datasets)
library(readxl)
library(tidyverse)
library(ggpubr)
library(rstatix)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

#load data set
setwd("C:/Users/stass/OneDrive/Desktop/5yearProject")
MRS_Data <- read_excel("Datasets/MRS_anova.xlsx")
str(MRS_Data)

MRS_MS <- MRS_Data[!(MRS_Data$T_groups %in% "H"),] 
MRS_H <- MRS_Data[(MRS_Data$T_groups %in% "H"),] 

#### plot
x=31

var = names(MRS_Data[x])

ggline(MRS_Data, x = "Time", y = var, color = "T_groups",
       add = "mean_se", palette = c( "green", "#00AFBB"), size = 1)

res <- t.test(MM20_A ~ Time, data = MRS_MS, paired = TRUE)
res
res <- t.test(MM20_A ~ Time, data = MRS_H, paired = TRUE)
res

