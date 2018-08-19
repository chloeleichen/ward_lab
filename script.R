library(readr)
library(dplyr)
library(tidyverse)

fish <- read_csv("fish-1-8.csv")

#schema:
# 1. Top view Rotated rectangle
# 2. Top view area
# 3. Side view rotated rect
# 4. Side view area

top.rect.index = seq(1, nrow(fish), 4)
top.area.index = seq(2, nrow(fish), 4)
side.rect.index = seq(3, nrow(fish), 4)
side.area.index = seq(4, nrow(fish), 4)

top.length = fish[top.rect.index, ]%>% select(RRLength)
top.width = fish[top.rect.index, ]%>% select(RRWidth)
top.area = fish[top.area.index, ]%>% select(Area)
side.length = fish[side.rect.index, ]%>% select(RRLength)
side.width = fish[side.rect.index, ]%>% select(RRWidth)
side.area = fish[side.area.index, ]%>% select(Area)
top.ratio = top.length/top.width
side.ratio = side.length/side.width

fish.df = data.frame(top.length,  top.width, top.ratio, top.area, side.length, side.width, side.ratio, side.area)

colnames(fish.df) <- c("Length (Top view)", "Width (Top View)", "Ratio(Top)", "Area(Top View)", "Length (Side View)", "Width (Side View)", "Ratio(Side)", "Area(Side View")


qplot(fish.df$`Length (Top view)`, fish.df$`Length (Side View)`)

qplot(fish.df$`Ratio(Top)`, fish.df$`Ratio(Side)`)

cor(fish.df$`Length (Top view)`, fish.df$`Length (Side View)`)
