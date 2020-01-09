
### A sample program to find the coordinates of membrane's interfacial atoms of a membrane surface
### Can be used with the coordinate file with a frame of a membrane or any surface


# load the package

library(tidyverse) 
library(ggplot2)
library(dplyr)


# set the working directory & import the data

setwd('C:\\Users\\Symon\\Google Drive\\School_Drive\\Research_Symon\\pa_submission\\Revision\\Data_Analysis\\Roughness')
roughness <- read_csv('Mem.csv')

# We need to divide the membrane/surface into small grids
# Decide how many grids we need and define the grid based on x and y cordinate (Here we choose 9 grids as an example)

roughness$grid_range[roughness$x <= 3 & roughness$y <= 3 ] <- "grid1"
roughness$grid_range[(roughness$x > 3 &  roughness$x <= 6) & roughness$y <= 3 ] <- "grid2"
roughness$grid_range[roughness$x > 6  & roughness$y <= 3 ] <- "grid3"
roughness$grid_range[roughness$x <= 3 & (roughness$y > 3 &  roughness$y <= 6) ] <- "grid4"
roughness$grid_range[(roughness$x > 3 &  roughness$x <= 6)  & (roughness$y > 3 &  roughness$y <= 6) ] <- "grid5"
roughness$grid_range[roughness$x > 6  & (roughness$y > 3 &  roughness$y <= 6) ] <- "grid6"
roughness$grid_range [roughness$x <= 3 & roughness$y > 6 ] <- "grid7"
roughness$grid_range [(roughness$x > 3 &  roughness$x <= 6) & roughness$y > 6 ] <- "grid8"
roughness$grid_range [roughness$x > 6  & roughness$y > 6 ] <- "grid9"



# Find the Z coordinates of the most top atoms of inside the all grid you defined

t1 <- roughness %>% filter(roughness$grid_range == "grid1") %>%  arrange(desc(z)) %>% head(1)
t2 <- roughness %>% filter(roughness$grid_range == "grid2") %>%  arrange(desc(z)) %>% head(1)
t3 <- roughness %>% filter(roughness$grid_range == "grid3") %>%  arrange(desc(z)) %>% head(1)
t4 <- roughness %>% filter(roughness$grid_range == "grid4") %>%  arrange(desc(z)) %>% head(1)
t5 <- roughness %>% filter(roughness$grid_range == "grid5") %>%  arrange(desc(z)) %>% head(1)
t7 <- roughness %>% filter(roughness$grid_range == "grid6") %>%  arrange(desc(z)) %>% head(1)
t7 <- roughness %>% filter(roughness$grid_range == "grid7") %>%  arrange(desc(z)) %>% head(1)
t8 <- roughness %>% filter(roughness$grid_range == "grid8") %>%  arrange(desc(z)) %>% head(1)
t9 <- roughness %>% filter(roughness$grid_range == "grid9") %>%  arrange(desc(z)) %>% head(1)


# Cat all the coordinates into a table 
 
topAtoms <- rbind(t1, t2, t3, t4, t5, t6, t7, t8, t9)


# export the data into a csv 
write.csv(topAtoms, file = "Interfacial_Atoms.csv")

