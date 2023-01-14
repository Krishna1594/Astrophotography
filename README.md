# Astrophotography
Astrophotography is one of my hobbies that I enjoy. Incessant curiousity to have a closer look at them with my own eyes rather than looking at photographs on the internet put me on a journey to grab these stunning objects in space with my equipment. I have been doing this since 2018, began with my mobile device (since I couldn't afford a telescope initially) and ended having pertinent equipment for astrophotography.

This data is being recorded in a spreadsheet and continuously updated every time I picture a celestial object with my gear. The data contains how, when and at what time the celestial objects were photographed along with what equipment I used and what equipment I bought to improve my skills. The data also contains what type of celestial objects being photographed and what hurdles I faced over the years during my astrophotography. 

## Table of Contents
[The Data](#The-Data)

[Example Plots](#Example-Plots)

[Analysis-The Code](#Analysis-The-Code)

### The Data
The Data is not well arranged. However, this encourages me to improve my data cleaning skills and validate the data as per the idea behind each column.

> **Note:**
> The following acronyms are being used in the data:-
> 1) Ref :- Refractor
> 2) DoubRef :- Double Refractor
> 3) DSLR :- Digital Single Lens Reflex Camera
> 3) Num :- Number
> 4) ly :- Light Year
> 5) ISO :- Image Sensitivity to light 

### Example Plots
![Duration_vs_Distance_Plot](https://user-images.githubusercontent.com/64607588/196864964-0e432809-0a4e-43a0-94e2-c6072b326088.jpeg)
![Duration_vs_Observation-expenditure](https://user-images.githubusercontent.com/64607588/196865004-08eb9c44-30b6-4e05-a6b8-6877a6dd5406.jpeg)
![Astrophotography With Time](https://user-images.githubusercontent.com/64607588/196865026-9299ea8a-b55b-4b20-81de-88008cd49b14.jpeg)


### Analysis-The Code
These packages are being used for my project which will help me make right decisions on how to improve my quality of my pictures considering my city's light pollution:

https://github.com/Krishna1594/Astrophotography/blob/de860eb51ffbd70c6fe7b95ea8c32db0d45fa337/AstrophotoTime.R#L1-L22

For every plot I created, I have used specific theme for simple yet clean data representation. For example,

https://github.com/Krishna1594/Astrophotography/blob/de860eb51ffbd70c6fe7b95ea8c32db0d45fa337/AstrophotoTime.R#L47-L68

Also, a little trademark item that I added below the chart can be done as follows:

https://github.com/Krishna1594/Astrophotography/blob/de860eb51ffbd70c6fe7b95ea8c32db0d45fa337/AstrophotoTime.R#L74-L80

Or, I can even use the following code to have customized fonts. However, I have disabled them using '#' in fron of lines as I dont require at the moment.

https://github.com/Krishna1594/Astrophotography/blob/de860eb51ffbd70c6fe7b95ea8c32db0d45fa337/AstrophotoTime.R#L42-L45

