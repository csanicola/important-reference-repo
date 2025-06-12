# Analyzing Data in Tableau

[Source](https://campus.datacamp.com/courses/analyzing-data-in-tableau)

- by default when you import tables of data into Tableau, some numeric data are automatically but into **measures** but sometimes we want to keep them as **dimensions** (ex: MRNs, IDs, Latitude, Longitude)
  - to do this we just move it up from the line separating the measures and dimensions
- to change the **default measure** (aka from sum to avg), you would right-click then select measure and select the measure you want to change it to
- sometimes you want to create new **calculated fields**, to do so you can either start with the variable you want to include in the calculation and right-click that to create the calculated field or just right click anywhere on the side and select create calculated field and write in the formula you want to use
- also, it should be default to change the view drop down up top from **standard** to **fit width**
- some variables you want to change their **default properties** so everytime its on the canvas, it is presented in the same way
  - you would right-click and select the default properties and change what you want to change
- editing the Alias of a value or column of data lets you change the data title shown to make it easier for people to understand
- using the **highlighter**, we can highlight based on other columns and it doesn't reduce the rows when something is selected it just highlights the rows that match the syntax
- `DATEPART` is a function that can be used to determine if a date is a weekday or weekend
  - there are default numbers for the days of the week with Sunday being 1 and Saturday is 7

```
IF DATEPART('weekday',[Start Time]) = 1 	# this represents sunday
OR DATEPART('weekday',[Start Time]) = 7 	# this represents saturday
THEN 'weekend'		# with this we are saying if the date is either sunday or saturday its a weekend
ELSE 'weekday'		# if not its a weekday (this method is easier than doing 5 if/thens for the days of the week)
END
```

- you can add a 'Apply' button to the filters by clicking the carrot and selecting the Customize option for "Show Apply Button"

  - this allows people to be sure of their selections before the data changes and is more professional for users

- for time in tableau, there are many options to display like by days, hours, mins
- you can also have a **time analysis** either discrete or continuous

  - **Discrete** (bins): trends by hour, day of the week, month, etc
  - **Continuous** (time series): presenting data over time in the sequence it historically occurred
  - when changing a variable to be either discrete or continuous, the top section once you right click with give you descrete options while the bottom section gives you continuous options
  - you can also change how the data is shown on the visual by right clicking any of the x or y axis labels and clicking format and then on the left hand side under dates you can select the format of how you want the axis to look like

- when working with a table of values and we want to include a calculation, we can use a **quick table calculation** and select something like percentage of total

  - but we may want to change instead of **table across percentage of total** to **table down percentage of total** and we can do so by right clicking again and selecting "compute using"
  - anytime you see a field with a **triangle** next to it that means it has a **quick table calculation**

- adding a calculated value as a color for a table and changing the marks to squares allows the color variance to change so it can show darker for higher numbers and lighter for lower numbers which can be a powerful visual
- To create a script to separate the time in the day by Morning, Afternoon, Evening, Night:

```
IF DATEPART('hour', [Start Time]) >= 0 AND DATEPART('hour', [Start Time]) < 6
    THEN 'Night'
ELSEIF DATEPART('hour',[Start Time]) >= 6 AND DATEPART('hour', [Start Time]) < 12
    THEN 'Morning'
ELSEIF DATEPART('hour', [Start Time]) >= 12 AND DATEPART('hour', [Start Time]) < 18
    THEN 'Afternoon'
ELSE 'Evening'
END
```

---

_Needed to stop here because there were no more free lessons; the rest was behind a paywall_
