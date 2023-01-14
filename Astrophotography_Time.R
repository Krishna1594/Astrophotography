library(readxl) 
library(crayon) 
library(stringr) 
library(stringi) 
library(openxlsx) 
library(janitor) 
library(tidyverse)
library(ggrepel)
library(tidyr)
library(lubridate) 
library(dplyr) 
library(ggplot2) 
library(plotly) 
library(plotrix) 
library(viridisLite, lib.loc="~/R/win-library/3.5") 
library(viridis, lib.loc="~/R/win-library/3.5")
library(hrbrthemes)
library(scales)
library(formattable)
library(showtext)
library(cowplot)
showtext_auto()
## Lets load global results-data of users participated in this survey:

Data <- read.csv(file.choose(), header = TRUE, sep = ",", stringsAsFactors=FALSE)

## Data Cleaning is a must 
Data$Month_Year<- as.Date(parse_date_time(Data$Month_Year, c('m-y')))# this avoids problems with date on axis while plotting
Data$Distance_ly <- as.numeric(Data$Distance_ly) #chr/string coerced to number forms
Data$Expenditure <- currency(Data$Expenditure,
                             symbol = "INR",
                             digits = 2L,
                             format = "f",
                             big.mark = ",",
                             sep = " "
)
DatNA = is.na(Data$Object_interested) # Logical values highighting NA rows.
Data <- filter(Data, Data$Observation_Time != "-") # removing empty rows while I was at work.
summary(Data)
showtext_auto()

#Add fonts from Google.
#font_add_google("Roboto Mono", "Roboto Mono")
#font_add_google("Open Sans", "Open Sans")
#font_add_google("Special Elite", "Special Elite")

# Set ggplot theme
theme_set(theme_minimal(base_family = "Sans"))
theme_update(
  plot.background = element_rect(fill = "#fafaf5", color = "#fafaf5"),
  panel.background = element_rect(fill = NA, color = NA),
  panel.border = element_rect(fill = NA, color = NA),
  panel.grid.major.x = element_blank(),
  panel.grid.minor = element_blank(),
  axis.text.x = element_text(size = 10),
  axis.text.y = element_text(size = 10),
  axis.title.y = element_text(size = 13, margin = margin(r = 10)),
  legend.title = element_text(size = 9),
  plot.caption = element_text(
    family = "Sans",
    size = 10,
    color = "grey70",
    face = "bold",
    hjust = .5,
    margin = margin(5, 0, 20, 0)
  ),
  plot.margin = margin(10, 30, 10, 30)
)

# Turn on showtext
showtext_auto()

# This plot shows at what time I have observed the celestial objects.
col2 <- viridisLite::inferno(12)
TvM <- plot_ly(marker = list(size=8)) %>% 
  layout(title = '<b>Astrophotography with Time  .  Visualization by Krishna Bharatula<br> <sup> Symbols :- ???-Planetary Objects | ???-Nebulae | ???-Star Clusters <sup>', 
         plot_bgcolor = "#fafaf5",
                            xaxis = list(title = 'Time (Month-Year)'), 
                            yaxis = list(title = 'Celestial Objects Photographed'),
                            legend = list(title=list(text='<b>Time-hrs<b> (as per color)')))
TvM <- TvM %>% add_markers(x = Data$Month_Year, y = Data$Num_of_Planetary_Obs, color = Data$Observation_Time,
                           colors = col2, symbol = I(17))
TvM <- TvM %>% add_markers(x = Data$Month_Year, y = Data$Num_of_Nebulae, color = Data$Observation_Time,
                           colors = col2, symbol = I(18), showlegend = FALSE)
TvM <- TvM %>% add_markers(x = Data$Month_Year, y = Data$Num_of_StarClusters, color = Data$Observation_Time,
                           colors = col2, symbol = I(15), showlegend = FALSE)

# Display Plot
TvM