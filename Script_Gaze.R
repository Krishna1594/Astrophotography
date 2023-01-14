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
Data <- filter(Data, Data$Equipment_Used != "-") # removing empty rows while I was at work.
summary(Data)

# Note `color = Equipment_used` and s`hape = Equipment_used`.
# This means each eqipment used will have BOTH  a different color and shape.
## Create 'highlight' indicator variable
Data <- Data %>% 
  mutate(
    name = Object_interested,
    highlight = name
  ) 
plt <- ggplot(Data, aes(x = Month_Year, y = Distance_ly)) +
  geom_point(
    aes(color = Equipment_Used, shape = Equipment_Used),
    size = 1.5, 
    alpha = 0.8 # It's nice to add some transparency because there may be overlap.
  ) +
  scale_x_date(date_labels = "%b-%Y")+
  scale_y_log10(breaks = trans_breaks("log10", function(y) 10^y))+ 
  theme(legend.position = "right", plot.title = element_text(size=11))+
  # Use custom colors
  scale_color_manual(values = c("#386cb0", "#fdb462", "#7fc97f", "#660099"))+
  ggtitle("Till What extent I have seen?")+
  xlab("Duration")+
  ylab("Distance(lightyears)")
plt + annotation_logticks(sides="l")

# Add labels without overlapping
plt <- plt + 
  geom_text_repel(
    aes(label = highlight),
    family = "Poppins",
    size = 3,
    min.segment.length = 0, 
    seed = 42, 
    box.padding = 0.5,
    max.overlaps = Inf,
    arrow = arrow(length = unit(0.010, "npc")),
    nudge_x = .15,
    nudge_y = .5,
    color = "grey50"
  )
## The Main Theme
plt <- plt + 
  # Add axes labels, title, and subtitle
  labs(
    title = "Extent of celestial objects I have gazed",
    subtitle = "Scatter plot of Duration vs Distance of gaze",
    x = "Duration (month-year)",
    y = "Distance (light years)"
  ) +  
  theme(
    # The default font when not explicitly specified
    text = element_text(family = "Lobster Two", size = 8, color = "black"),
    
    # Customize legend text, position, and background.
    legend.text = element_text(size = 8, family = "Roboto"),
    legend.title = element_text(face = "bold", size=10, family = "Roboto"),
    legend.position = c(1, 0.2),
    legend.justification = c(1, 0),
    legend.background = element_blank(),
    # This one removes the background behind each key in the legend
    legend.key = element_blank(),
    
    # Customize title and subtitle font/size/color
    plot.title = element_text(
      family = "Lobster Two", 
      size = 20,
      face = "bold", 
      color = "#2a475e"
    ),
    plot.subtitle = element_text(
      family = "Lobster Two", 
      size = 15, 
      face = "bold", 
      color = "#1b2838"
    ),
    plot.title.position = "plot",
    
    # Adjust axis parameters such as size and color.
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 12),
    axis.ticks = element_blank(),
    # Axis lines are now lighter than default
    axis.line = element_line(colour = "grey50"),
    
    # Only keep y-axis major grid lines, with a grey color and dashed type.
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(color = "#b4aea9", linetype ="dashed"),
    
    # Use a light color for the background of the plot and the panel.
    panel.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4"),
    plot.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4")
  )