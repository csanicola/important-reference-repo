# Data Analysis with Tableau

[Source](https://www.coursera.org/learn/data-analysis-with-tableau-public/)

# Exploring Structure and Metadata

In order to better understand your data's architecture, it's important to take a look at the structure and metadata. The **structure** refers to the physical layout of your data — how it's organized in terms of rows and columns. **Metadata**, on the other hand, is theinformation about the data within your dataset, such as field names and data types. Together, they provide a comprehensive understanding of your dataset’s framework. Preparing the structure and metadata of a dataset generally involves three tasks:

- Determining structure
- Renaming fields
- Editing field data types

## Determining Structure

Determining the number of columns and rows in your dataset gives you a valuable starting point for understanding its scope and scale. The number of columns and rows reveals the breadth and depth of your data. A substantial number of rows often reflects a rich, detailed collection of data, while a variety of columns can indicate a wide range of variables at your disposal.

The true strength of your analysis in Tableau comes from how well the data aligns with the questions you seek to answer. It’s important to examine each data field to ensure they all meaningfully contributes to your analytical objectives. This approach involves focusing on the relevance of the fields in your dataset, prioritizing those that directly tie into the questions you’re exploring.

To explore the structure, you can begin by asking the following questions:

- _How many fields and rows are contained in the dataset?_
- _Is the data contained in these fields and rows relevant to my analytical goals?_

### How to Determine Structure

You can explore your data's structure on the data source page. Begin by opening your dataset on the data source page and then drag the specific table you would like to examine to the canvas. Once your table is loaded, you should be able to see the total number of fields and rows listed above the table details.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/bpxcwBFCTa-JgKBonsh4aA_f24cfb2e86904bf39411c4759f7632f1_Screen-Shot-2023-11-24-at-8.49.01-PM.png?expiry=1749859200000&hmac=QrZDxaS64lNpeMNbKs5eP7vytiZZMRU0YKl6Lx4rCOo)

You can use the table details on the left or the data grid on the right to take a look at the different fields within the dataset. Additionally, you can use the data grid to preview the information contained in each row of the dataset.

## Renaming Fields

In Tableau, renaming fields is essential for increasing readability. Some datasets have field names that are not as descriptive or clear as they could be. Unclear field names leave too much room for interpretation of what that field contains — although the field values are "clean," they lack specificity. Additionally, field names often show up in the visualization's end result and must be easy for the audience to understand.

When determining which fields should be renamed, you can ask the following question: _Do the current field names accurately and clearly represent the data they contain?_ This question can help you identify any ambiguous or misleading field names that could hinder data analysis and interpretation.

### How to Rename a Field

Renaming a field in Tableau can be done a couple of different ways. You can either double-click the field name or right-click on the field and select "Rename." This can be done either in the data grid or the table details.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/baTwXC83S4W-9pfpHdVhqA_53e8d0110821475a80b04cb3f67c51f1_iTq8gMItQQWZNOsYkrReVw_ef6a2a2534ac4c23a5cbdd284e56c4f1_wL-3v-fwQYe90imP5gRCDA_7666910dc96b4da4ae3097537dc464f1_1.png?expiry=1749859200000&hmac=kB-0tsq7vsS_Zirh1P6wAG4f2Luo8l8pmFcaqSkgqFU)

## Editing Field Data Types

Imagine you are preparing the Superstore data to create data visualizations that analyze sales. During your preprocessing, you notice that Tableau has categorized the _Sales_ field as a string (text) data type, as shown below. You know it is categorized as a string because of the "Abc" icon above the field name.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/YlNUTM0nS3mNrAuRiQekug_43585131f4c64be983ec36468c9305f1_xlxLCUHfRaqtRwL58tHKLg_378fa77092dc46c7aabb1c69b605b6f1_bP_-buMbS7uO309M7AHGTg_2965d4240a29435aa31cc5f3e50cf4f1_Data-Types1.png?expiry=1749859200000&hmac=7-0PdUu1tbNQnL9WFtnXpyyJIzPLDHKQz-DbGjOskyU)

Currently, with _Sales_ classified as a string, you will not be able to mathematically manipulate the data, hindering your ability to make certain quantitative data visualizations later on. Therefore, it would be best to change the data type from a string to numerical data. The following chart shows the various data types and associated icons that are featured in Tableau.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/DUL30vhHQp-A7TObl3IzCA_47aeaf904fa14f0199327d3d22443df1_Screen-Shot-2023-11-29-at-11.51.08-AM.png?expiry=1749859200000&hmac=oHjXZQy7CV0Hd2LGd8mIdA_RZMENUzVXfXXYweDQ7mc)

In order to get to this stage, you may ask this question: "Are the data types appropriate for the data represented?" This question guides you in verifying the suitability of data types for each field, which is crucial for ensuring the correct kind of analysis can be performed.

### How to Edit Data Types

A field's data type can be edited in a simple way. In the data grid, you can either right-click the field header, click the triangle in the top-right corner of the field, or click on the data type icon. All of these options will bring up the same menu, which looks like this:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/TR0M-SGCQhyn9ZnTUEAaag_3ffeb2ac06ef45c9a775eb2eb64b18f1_N6A0yTrGSCSQdxlhsZ2G7Q_a0cd5f072a464d6c96efc70a2abea2f1_6QcIiCtiQ9y2xeWgSRcxXg_2db5ac1d2a464e3da93ebce43eef9ef1_Data-Types2.png?expiry=1749859200000&hmac=kIROr65vwsUe3Ru_cRBBkpb49zk047drAkNqm6aF56w)

From there, simply select the data type you would like.

# Relationships, Joins, and Unions

Combining data from multiple tables is often necessary to create a comprehensive view of your dataset. This process can involve different methods, each suited to specific scenarios. Understanding when and how to combine tables effectively is crucial for accurate and insightful data analysis.

You will often need to work with multiple tables, so you will need to combine them to work on them simultaneously. In addition to combining tables from a single data source, Tableau allows you to combine data from multiple data sources*. *You can combine tables in the following ways:

- Relationships
- Joins
- Unions
- Cross-database joins
- Data blends

## Relationships

A **relationship** does not physically connect tables, unlike joins and unions. Relationships work by logically associating tables without physically merging them, thus maintaining the tables' original structure. Tableau will automatically select the best method to combine the data during your analysis based on the fields used in the visualization. Tableau defaults to relationships as they are the primary and often preferred method for combining tables unless there's a specific need for joins or unions. Relationships allow for more flexibility and efficiency in data analysis.

Relationships are the best choice for combining your tables when you can answer "yes" to the following question:

- _Do I have multiple tables with a common field, where there are multiple instances of one or more values?_

### How to Combine Using Relationships

You can create relationships in Tableau on the data source page. To do so, select the first table you would like to connect from the sidebar, then drag and drop the second table into the canvas. A noodle will appear between the two tables to indicate a connection between the tables. Tableau will automatically determine the most suitable way to combine the data based on these common fields. Review the GIF below to see an example of a relationship.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/5dkIif7TQp-2-Fg7FbCqNg_53b08a4e048d462b84346bfa3cbb65f1_relationship.gif?expiry=1749859200000&hmac=yFdb4uR7RTcGRWgUylIUBaF7OU98KZVNFNSsKfyYmsk)

## Joins

A **join** is a horizontal connection between two or more tables. Joins are used when you need to create a single, integrated table from multiple tables. When joining tables, there must be at least one unique field shared by both tables. Using a join will increase the total number of columns within your data. Joins are the best choice for combining your tables when you can answer "yes" to both of the following questions:

- _Are the tables coming from the same data source?_
- _Do I have tables that I can horizontally merge based on a common identifier (value)?_

### How to Combine Using Joins

To create a join in Tableau, you must first open the physical layer on the data source page by dragging over one of the sheets and then double-clicking it in the canvas. This step is crucial because dragging one table to another on the canvas without entering the physical layer will result in creating a relationship instead. Once in the physical layer, you can create a join by dragging one table to another and then selecting the type of join (inner, left, right, or full outer) based on the shared fields. This process allows you to specify exactly how the tables should be combined. Review the GIF below to see an example of creating a join in Tableau.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Vpc_vqn1SS-2SEcemLHUZw_1d243b99dcfa47048f206004391e82f1_join.gif?expiry=1749859200000&hmac=SOy3M5pWI6XwV7-ugEqrHIvaT_h-umAkwf_A25Pa5GU)

## Unions

A **union** is a vertical connection between two or more tables. A union combines tables with the same columns to increase the number of rows. It's ideal for merging similar data sets across different periods or categories into one continuous sequence. Unions are the best choice for combining your tables when you can answer "yes" to both of the following questions:

- _Are the tables coming from the same data source?_
- _Do I have tables that have the same fields, but contain different values?_

### How to Combine Using Unions

In Tableau, unions are done by selecting the tables with similar structures and using the union option to combine their rows. Review the GIF below to see an example of a union. The GIF also highlights how you can use the "Merge Mismatched Fields" option to combine the similar columns into a single column.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/8vab2p4CRYyMx8MNwIqdbQ_eadfb908d1f643ffb53b53826e054ff1_union.gif?expiry=1749859200000&hmac=tpBBd3OJoQKwgwQ-j_pFGP48ktBS1DEleuNtKYfcd8k)

## Data Sources vs. Tableau Data Sources

Before moving forward, a note/reminder on the difference between a _data source_ and a _Tableau data source_.

- A **data source** is the location and container of the data you choose to access when you use Tableau. This could be a spreadsheet in Excel/Google Sheets, a text file, or a PDF, among other file types. Data sources can hold multiple tables or sheets of data.
- A **Tableau data source** is the link between Tableau and the data. The Tableau data source contains any edits, connections, joins, and other manipulations you have made to the data source _in_ Tableau. In the following image, you will see the *Orders *and *People *tables joined together within the Tableau data source _Orders + (sample_superstore)_. The highlighted right side of the Tableau data source page is where you will build and edit the Tableau data source, which is different from the external data source you have connected to, like an Excel file. You can find details about the data source in the left pane.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/EK8MnAzOTxyGvhWouQq9Ug_989115b735d349f79e214131563946f1_OrdersandPeopleJoin.png?expiry=1749859200000&hmac=jakbN8DBMIl_bKEuShI7E0G5QpdAGoNjIhn_w6sXIOk)

As you continue below, be careful as you read about cross-database joins and data blends, as both of the terms, _data source_ and _Tableau data source_, will be used.

## Cross-Database Joins

A **cross-database join** works nearly the same as a regular join except that it joins columns from tables that are in _separate data sources_. As you read "separate data sources," there are two important distinctions you should note:

- separate: more than one data source is involved (as opposed to a join, which merges tables within a single data source)
- data source: as opposed to a Tableau data source

Note that cross-database joins are used strictly for combining _data sources_ — not _Tableau data sources_.

Cross-database joins are the best choice for combining your tables when you can answer "yes" to both the following questions:

- _Are the tables coming from multiple data sources (within a single Tableau data source)?_
- _Do I have tables that I can horizontally merge based on a common identifier (value)?_

### How to Combine Using Cross-Database Joins

A cross-database join follows the same steps as a regular join, but the tables are combined from two different sources. In order to access the tables from each source, you will need to swap between your different connections while completing the join. Watch the GIF below to see this in action.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/JaqIWAogSRGHhbseOjC0YQ_b604eee2699f450fa2bd9f669e83a3f1_Dec-28-2023-01-19-47.gif?expiry=1749859200000&hmac=c6DROiFJwyI1ue7D0C1UhzEKz4szD0EZsNXm7OZnN5I)

## Data Blends

A **data blend** is used to connect data from multiple _Tableau data sources_ into a single visualization. Unlike cross-database joins, data blending does not directly combine the data. Instead, both Tableau data sources are queried, and only the returned information from each Tableau data source is displayed together.

Data blends are the best choice for combining your tables when you can answer "yes" to the following question:

- _Are the tables coming from multiple Tableau data sources?_
- _Do I need to combine data at an aggregate level rather than a detailed row-level?_

### How to Combine Using Data Blends

For a step-by-step guide on completing a data blend, refer to the [following article from the Tableau.](https://help.tableau.com/current/pro/desktop/en-us/multiple_connections.htm?_gl=1*1dn43e3*_ga*MTc4NjE0MjcwNS4xNjk3MDYxNDgz*_ga_8YLN0SNXVS*MTcwMzE5ODE3MS4xMDguMS4xNzAzMTk4MTgwLjAuMC4w#differences-between-joins-and-data-blending)

# Organizing and Customizing Fields

The way in which fields are organized can significantly impact the ease of navigation, clarity, and effectiveness of your analysis. Tableau provides various methods to restructure and combine fields, enhancing the way you interact with your data. A key question to guide your exploration is: _Could the fields be restructured for better organization, navigation, or analysis?_ By considering this question, you can identify opportunities to optimize your dataset's structure, making it more intuitive and analysis-friendly. You can combine fields in the following ways:

- Folders
- Hierarchies
- Pivot fields

## Grouping Fields by Folders

A Tableau **folder** is a standard folder system that acts as a container to organize related fields. Folders in Tableau are used for the same reason you wouldn't want to leave all your computer files scattered across the desktop of your PC. Folders in Tableau help in grouping related fields, thereby decluttering the data pane and making specific types of data easier to locate. This reduces clunkiness and clarifies data for the analyst.

As you explore your data, you can identify opportunities for folders by asking the following question: _Are there any related fields that can be grouped together to streamline analysis?_ For example, fields such as _Country_, _Region_, and _State_ could all be grouped together into the folder of Location.

You will learn more about the specifics of folders in the next module.

## Creating Hierarchies

In Tableau, **hierarchies** organize data fields in a logical, ranked manner, enhancing drill-down analysis. Tableau creates date hierarchies by default, but you can also design custom hierarchies for more detailed exploration. For example, a hierarchy can include _Country_, _Region_, _State_, and _City_, allowing deeper data analysis. In order to identify opportunities to create hierarchies, you can ask the following question when exploring your data: _Do my fields contain levels or categories that can be logically arranged in a hierarchical order?_

You will learn more details about hierarchies in the following module.

## Combining Fields Into Pivot Fields

On occasion, you will run into a raw dataset in Tableau with multiple fields containing the same type of information but separated. For example, consider the following dataset which has individual columns for each month's sales.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/-Y7y-NYnQqmFbmLjOwvGWg_1424f29cfa6a4a46b0d7d5082f0ee4f1_Screen-Shot-2023-12-28-at-1.55.32-AM.png?expiry=1749859200000&hmac=a0janz6jueFSvWck0d6Ue_wUSiKjZZdgrkCLHfMLbuw)

Instead of having separate columns for each month's sales data, you can combine these into a single "Sales" field.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/etZQsNsYTTCMlebvP2Q50g_30baf08a59f04759bcf0a44a1a40bbf1_Screen-Shot-2023-12-28-at-2.03.46-AM.png?expiry=1749859200000&hmac=vV2f6sCW2QZPtaxUEpOMSqdj3PjHHupnsNF3Ee4LtD4)

In Tableau, this is known as a **pivot**, which is when two or more fields that could logically be categorized in the same way are stacked together into a single field. Pivoting is especially beneficial in large datasets, as it simplifies the data structure and makes it more conducive to summary and analysis.

As you move through data exploration, you can determine if data needs to be pivoted by asking the following question: _Are there multiple fields that represent the same type of information?_ Asking this exploratory question will allow you to identify areas to streamline your dataset using pivot fields to maintain fewer columns.

### HOW TO PIVOT FIELDS

Pivoting fields can be achieved by selecting all the fields you would like to pivot, right-clicking, and selecting "Pivot."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/4YYEMnuQTpmD-LgTLiJI-Q_5c7ed5de0ee1476da3fe1fbbbaa1e4f1_pivot.gif?expiry=1749859200000&hmac=Fj8pT7kiIfeBkMBUaZ37icnViZDLrFOrQTmB85Z4sxQ)

**Note: **To select multiple fields that are next to one another, you can click and drag your cursor over them. If the fields are not next to one another, press and hold Ctrl (PC) or Command (Mac) and select each field, one at a time.

By effectively organizing your fields, you streamline the data exploration and visualization process, making it more intuitive and efficient. Creating folders allows for better management and accessibility of fields, custom hierarchies enable deeper, more structured data exploration through drill-downs, and pivot fields consolidate similar data, simplifying complex datasets. Together, these techniques not only aid in maintaining a cleaner and more organized workspace but also significantly improve the ease and effectiveness of data analysis.

# Combining Values

Combining values in Tableau involves consolidating individual data points within a field into more meaningful categories or groups. This process is essential when you want to simplify your analysis by categorizing detailed data into broader segments. A guiding question here is: _Within a single field, are there values that can be categorized under a single value?_ Values can be combined in the following ways:

- Groups
- Sets

## Combining Values into Groups

In Tableau, grouping is exactly what it sounds like — a way to group related values. **Groups** essentially build a new field based on the original field chosen, but the values are now grouped with their respective "group names." For example, in the Superstore data, you could group cities together to create counties. Once a grouping is created, it is saved in a newly created field featuring the newly created group as well as all the ungrouped values. The following image shows _Sales Region_ groups being formed out of the _State_ field.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/eiXhyRmiSYiHJr0z0LED8w_fcbd0f574610498ab6628de9eeb7dff1_salesregion.png?expiry=1749859200000&hmac=_wckcjbIAQvhzDmFuEjgKcCVm1s3UbDbRAO4p4MXM4g)

In order to determine if your data should be grouped, you can ask the following question while exploring your data: _Is there a need to create multiple groups within a field to simplify analysis or highlight specific segments?_ For example, if you wanted to look at salaries across different departments but only had specific job titles, you would want to group the roles by each department so that you could have a higher level of analysis.

You will learn more about creating groups in the following module.

## Combining Values Into Sets

**Sets** function similarly to groups, as they allow you to segment a portion of your values in a new field. While these two are very similar, groups allow you to create multiple segments and leave the remaining values untouched. Sets, on the other hand, split up all the values into two groups — in or out of the set. The in/out modes of sets in Tableau offer a dynamic way to control which data points are included or excluded from your visualizations. The following image shows an example of the in and out group for a set of the top three subcategories in terms of _Sales_.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/d4wq7gRoT9umtqYNNMvUpQ_f2a4c849a63a4a62bc8a944105f388f1_sets.png?expiry=1749859200000&hmac=4sjsQf5XwLNVqBg72yr7RpQ8K-zrXcGmoS7lGjniML0)

This flexibility empowers users to perform detailed analysis on specific subsets of their data, enhancing the depth and precision of insights gained from Tableau visualizations. When deciding if you want to create a set, you can ask the following question: _Are there specific groups or categories within my field that I need to compare against the rest of the field?_

You will learn more about sets in the upcoming module.

While combining certain data enhances its value in analysis, other information might be irrelevant or even clutter the analysis, making it more effective to exclude it.

# Removing Fields and Values

Removing fields and values is crucial for focusing your analysis on relevant data. These steps allow you to exclude irrelevant or undesired values and fields. By thoughtfully considering which data elements to remove, you can streamline your visualizations and enhance the accuracy and relevance of your analysis. You can remove irrelevant data using the following methods:

- Hiding fields
- Adding filters

## Hiding Fields

When working with large datasets in Tableau, your workbook can become crowded with fields. To help you manage what fields you see, Tableau has a tool that allows you to hide fields temporarily. Hiding fields is advantageous because it can streamline your analysis by getting irrelevant fields out of your way to better focus on the relevant content. For example, say you are preparing data analysis on the Superstore's product popularity and notice that the field _Ship Mode_ is not useful to this analysis. In this case, you can hide this field.

It is important to note that when a field is hidden, it still exists and can be unhidden. This is advantageous compared with deleting data because you can still access the hidden data when needed. To determine if you should hide a field, you can ask the following question during exploration: _Are there any fields in the dataset that will not be useful in my analysis and can be hidden to simplify the view?_

### How to Hide a Field

Hiding a field can be done by right-clicking the field and selecting "Hide."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/-4CwCmLqTy67UMFAGUdjmA_e4d02d1ab8ae41eca585ca7e5876c0f1_Screen-Shot-2023-11-27-at-3.55.57-PM.png?expiry=1749859200000&hmac=3jafIifFv8b0aXQ8E4h2tXtIxWAeB67GOMvdAOrK_bY)

## Adding Filters

In the world of data analysis, a **filter** is essentially a rule or set of rules that is applied to the data within a table, and only the data matching that rule or set of rules will be seen and accessible. In other words, filtering serves as a way to limit the amount of data in your analysis — an important component of table organization.

For example, imagine you had a dataset that contained all of the high school students in a school district. The fields in the dataset are _Student Name_, _School_, and _Graduating Year_.

| **Student Name** | **School**               | **Graduating Year** |
| ---------------- | ------------------------ | ------------------- |
| Ayano Hironaka   | Vanguard High School     | 2019                |
| Jacek Olszewski  | Glenvale High School     | 2021                |
| John Barnard     | Vanguard High School     | 2020                |
| Eliza Jumel      | Liberty Hill High School | 2019                |

If you wanted to analyze data only related to students at Vanguard High School, you could use a filter to filter the table based on the* School* field.

As depicted below, Tableau would filter out rows of students who did not go to Vanguard High School.

| **Student Name** | **School**           | **Graduating Year** |
| ---------------- | -------------------- | ------------------- |
| Ayano Hironaka   | Vanguard High School | 2019                |
| John Barnard     | Vanguard High School | 2020                |

Once the filter was implemented, the rows containing data on students from other high schools, like Jacek and Eliza, would no longer be present in the data.

When deciding if it is appropriate to add a filter, you can ask the following question: _Within the fields, are there any values that should be excluded from the analysis?_ This could include be data that is outside of a certain range, such as _Sales_ below $50,000 monthly.

Filters can be applied at different levels depending on the scope of the analysis. There are two main types:

1. **Data source filters:** These are used to filter data in the data source before the data gets to the worksheet. Data source filters are ideal for scenarios where the excluded data is not relevant for any part of your analysis, like filtering out discontinued products or data from a region not covered by your analysis. You can ask the following question to determine if you should apply a data source filter: _Should specific values be excluded from the entire dataset across all worksheets?_
2. **Worksheet filters:** These are used to filter data for a specific worksheet. Worksheet filters are useful when you need different views or analyses of the same data on different worksheets. For example, one worksheet could focus on data from recent years, while another could analyze historical data. You can ask the following question to determine if a worksheet filter is necessary: _Are there values that need to be excluded only from a specific worksheet?_

# Creating Fields

Creating new fields in Tableau is a key step that adds more detail to your dataset, different from the earlier steps which focus more on organizing and simplifying data. This process is about improving your current data so it is better primed for analysis. Mastering the creation of new fields is important for a more comprehensive data analysis. This skill enables you to reinterpret and reframe your dataset, uncovering layers of information that were previously hidden or unexplored. Creating new fields can be completed through the following methods:

- Creating calculated fields
- Splitting fields

## Creating Calculated Fields

A **calculated field** is a new field created by manipulating existing fields using mathematical operators (symbols) and/or Tableau’s built-in functions. Calculated fields allow users to use existing data within calculations that can help uncover and visualize new information.

For example, consider a dataset that includes information on the number of beds and price (among other fields) for Airbnb rentals in New York City. Suppose you were interested in the price of the rental based on the number of beds. In that case, you could create a calculated field by dividing the _Price_ column by the _Beds_ column. Below, you can see the original fields on the left and the resulting calculated field on the right.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/2cyy4WlETaOupmy6vFm-yg_b9e8c86f0c154114ac5ed5218063b8f1_f6ZdwEHGRT2Ybbvbf5w4JA_93227a3e68a5418eb02fd67970c9e2f1_BHEVamMCShy1JmDFxVH6EA_5ae32659bebb4df7bb7a3f4dd9ecedf1_Beds.png?expiry=1749859200000&hmac=QtRlvWMPGpAQmthuPuWWUJ51j8WDIS-s5AMdXKzjKLY)

Creating calculated fields does not change the original fields within the dataset — it only _adds_ new columns to the data source, with the original fields left untouched. In your exploration phase, you should ask _Are there opportunities in my dataset to create new metrics through calculations that would provide a deeper understanding of the data?_

You will learn more about calculated fields in the upcoming module.

## Splitting Fields

One way that you can use calculated fields to improve your data is by splitting fields. When you start to look through a dataset, you will often find fields that contain complex values. Complex values contain two or more standalone values that are placed together. For example, a _Full Name_ field would contain _First Name_ and _Last Name_ information. These values are sometimes more useful if they are split into multiple fields rather than remaining in one. Multiple fields can allow for more data manipulation, which allows for more flexibility in your data visualization creation.

When exploring your data, you can determine if a field is a good candidate for splitting by asking the following question: _Are there any fields in my dataset that contain combined information which would be more useful if split?_

### How to Split a Field

The SPLIT function in Tableau has three parameters, as seen from the syntax below:

SPLIT(string, delimiter, token number)

Take a look at the table below to better understand these parameters.

| **Parameter Name** | **Argument Type** | **Description**                                                                           | **Example Argument** |
| ------------------ | ----------------- | ----------------------------------------------------------------------------------------- | -------------------- |
| string             | Field             | The name of the field that you would like to split                                        | [Customer ID]        |
| delimiter          | Character(s)      | The character(s) that define how the field will be split (e.g., comma, space, dash, etc.) | "-"                  |
| token number       | Integer           | The part of the string that you want after the split                                      | 2                    |

If you wanted to split the* Customer Name* column into _First Name_ and _Last Name_ in the Superstore dataset, you would want to use the following formulas:

- First Name: SPLIT(Customer Name, " ", 1)
- Last Name: SPLIT(Customer Name, " ", 2)

Watch the GIF below to see the SPLIT formula in action.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/P6E_6W3TQ8-mfbBv2XBF-Q_927fed36825b4e4d9c09642dbcad4ff1_split.gif?expiry=1749859200000&hmac=k45lADvwFZ83aY10WNxLgM9ZgK_8JlCOoiKZ0gGiMWQ)

## Key Terms

- **Tableau data analysis process**: A sequence of stages involving preparing and exploring data, analyzing it through visualizations and statistics to uncover insights, and crafting these into a narrative for informed decision-making
- **Structure**: The physical layout of your data, which is how it's organized in terms of rows and columns.
- **Metadata**: Theinformation about the data within your dataset, such as field names and data types.
- **Relationship**: A temporary connection between two or more tables based on a matching field.
- **Join**: A horizontal connection between two or more tables.
- **Union**: A vertical connection between two or more tables.
- **Cross-database join**: Joins columns from tables that are in _separate_ data sources rather than tables within a _single_ data source.
- **Data blend**: Combines aggregate information from a secondary data source and displays that information with the primary data source.
- **Folder**: A standard folder system that acts as a container to organize related fields.
- **Hierarchy**: Structure that organizes data fields in a logical, ranked manner, enhancing drill-down analysis.
- **Pivot**: Two or more fields that could logically be categorized in the same way are stacked together into a single field.
- **Group**: A collection of related data points consolidated under a common group name.
- **Set**: A segmentation of data points into two categories: in or out.
- **Filter**: A rule or set of rules that is applied to the data within a table, and only the data matching that rule or set of rules will be seen and accessible.
- **Data source filters:** Used to filter data in the data source before the data gets to the worksheet.
- **Worksheet filters:** Used to filter data for a specific worksheet.
- **Calculated field**: A new field created by manipulating existing fields using mathematical operators (symbols) and/or Tableau’s built-in functions.

# Filtering Data in Tableau Overview

Filters in Tableau are conceptually the same as the filters you might use in Excel or SQL. You're taking a field and telling Tableau, "Only include (or exclude) the rows that meet this set of rules."

Tableau filters allow you to interactively modify and refine your visualizations by selecting specific subsets of data. They serve as a bridge between your raw dataset and the insights you wish to convey, giving you the power to answer critical questions, explore trends, and gain deeper insights into your data. These filters act as a lens through which you can focus on specific dimensions, time periods, or segments of your data, enabling you to tailor your visualizations to meet your exact needs.

Tableau filters operate by providing users with a variety of options to restrict the data displayed within a visualization. Users can apply filters to various components, such as worksheets, dashboards, or even across multiple data sources, ensuring that the desired data subset is reflected throughout the entire project. Filters in Tableau can be applied to dimensions (qualitative data) or measures (quantitative data), allowing for a comprehensive exploration of your dataset.

As a reminder, you have already been introduced to two main ways to filter data in the first module:

- **Data source filters:** These are used to filter data in the data source before the data gets to the worksheet.
- **Worksheet filters:** These are used to filter data for a specific data visualization.

In this module, you will also learn about another way to filter data:

- **Context filters:** These are used to narrow down the data displayed in a view by focusing on a specific subset of the data. When a context filter is applied, Tableau temporarily creates a subset of the data based on the filter criteria and all subsequent analyses and visualizations are then performed on this reduced dataset. Note that context filters are applied only to the worksheets in which they are created. In that sense, you can think of a context filter as a specific type of worksheet filter.

Filters play a significant role in analytics because they decrease the number of fields and the amount of data used, allowing you to focus on specific groups or segments of the data.

# How to Create a Data Source Filter

Creating a **data source filter** in Tableau is done in the data source page. In the top-right corner, you will see a section called "Filters" that contains an "Add" button. Click this button to create a new data source filter or to edit existing filters. If no data source filters have been created, an empty "Edit Data Source Filters" dialog box will appear, as you can see in the following GIF.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/mNlMsfwxTPyOcZAhekIWXg_4e57030fa27b4ac5b2e8f59ce5b993f1_Data-Source--Add-Filter1.gif?expiry=1749859200000&hmac=xaBOrITfqWomptDpIIBbCQ3eWypuUHYknM5xNMPsX8k)

**Note: **The "Add" button will change to an "Edit" button after you create at least one filter. Pressing the "Edit" button will bring you to the same dialog box.

The "Edit Data Source Filters" dialog box holds a list of all the active filters you have set on your data source, as well as options to add, edit, and remove filters. Take a minute to look over the image below that contains a breakdown of the interface.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/KbeeYGHXRiGQBDFq_h3qJg_2def838a82164f0488aba9761110bdf1_Screen-Shot-2023-12-31-at-12.10.14-AM.png?expiry=1749859200000&hmac=bL3kipV-KuyGgIXUzJm8dYKRkCbxchrxYVqHtTMGWBk)

Now that you have a general understanding of the interface, it's time to add a filter.

When you want to create a new data source filter, click the "Add Filter" button in the bottom-left corner to get started.

Once selected, you'll need to choose which field you'd like to filter and define the rules that create the filter. As an example, suppose you're using the Superstore dataset to analyze the phone industry. The Superstore dataset contains a lot of data that is unrelated to the phone industry, so to speed up the performance of your data visualizations, you decide to filter the _Sub-Category_ field to only include rows related to phone products.

Thus, you'll select the _Sub-Category_ field as the field you'd like to filter.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/b3ZJILP_TcGOFNsr9XBdMA_0672e12eb5b74abd8b4feb81115df1f1_Data-Source-Filter-2.png?expiry=1749859200000&hmac=mHSJuXv422Lz0Tgxm3wMnJ6mDt1Qb5x4gZ13U_hel-s)

Next, you would select "Phones" since that's the specific _Sub-Category_ you're interested in. There are two approaches you can take here:

- Search for the value you'd like to filter using the search bar (you can just type the first few letters). From there, you'll have fewer options to pick from. Then, select the values for which you would like to create a filter.
- Alternatively, ignore the search bar and instead scroll down to manually search for the value and then select the value when you find it. They will be listed in alphabetical order.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/OlEtrKtxQpqa4KQvXs4Jrg_b7f075d52351465fa90b8ee2d5a9bff1_Data-Source-Filter-3.png?expiry=1749859200000&hmac=L_6WFTy4fQ5fIiwyTodJknXkEwX7K4V9b3ixTQH9duI)

Generally speaking, if you have a lot of different values, it's faster to use the search bar, but if you only have a few values, it's faster to scroll down and manually search.

When you're done, press "OK" in the bottom-right corner. From there, you will see the same "Edit Data Source Filters" interface but with the filter that you just created. Notice that _Sub-Category_ is listed as a filter, and the details are "keeps Phones." The _Filter_ and _Details_ fields change dynamically based on the filters you have applied, helping you to keep track of how you have filtered the dataset.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/uEYkizoDSq-gfxzP6dWHjQ_dc212b48c3aa4488b7c4ee84f5c24af1_Data-Source-Filter-4.png?expiry=1749859200000&hmac=vBluCYbK9LvDV8iUjHxMtNU2pd44I7CQ2vbZ9MvXF50)

From here, you can continue to add more filters and/or press "OK" when you're finished adding/editing/removing filters. Take a look at the GIF below to see this process in action.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ckXHSNGgRAWJ7PITeTRUFg_942fc130cb874ad09699fbe93be08ef1_Sub-Category-Phone-Filter1.gif?expiry=1749859200000&hmac=-rCGFSugI0B_pKt8zuNS81zVip1bTVU1FEMP4dotoSY)

After selecting "OK" to exit the "Edit Data Source Filters" dialog box, you should notice two changes:

- In the _Sub-Category_ field, the only values are "Phones."
- There were originally 9,994 rows of data. Now, after applying the filter, there are only 889 rows. This means that 9,105 (9,994 - 889 = 9,105) rows of data are being left out of this workbook because their _Sub-Categories_ were not "Phones." That's over 90% of the data — which could have a large impact on the performance of Tableau!

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ntOMXkH0TUWGREfkSjOyiQ_f9f0db346efe4af0b652d7e0bd1f6ef1_Data-Source-Filter-5.png?expiry=1749859200000&hmac=wVVIogWdEQL-FejY69Pcu8mBMwP9aM8tCVFumYqVolg)

Remember, data source filters are applied to the entire workbook, which means any worksheets, dashboards, and stories that you create can only access this filtered data. So, be sure to only filter data in the data source page that you don't plan to use in the entire workbook.

**Remember: You are in complete control! **Everything you do in Tableau can be undone. It's actually easier to remove a filter than it is to add one if you decide later on that you don't want it. Simply go back into the "Filter" menu, select the filter(s) you want to remove, and then press the "Remove" button.

# How to Create a Worksheet Filter

Creating a **worksheet filter** is very straightforward. Simply drag the dimension(s) and/or measure(s) you would like to filter to the Filters shelf. When you drag a new field into the Filters shelf, a dialog box will appear. Make your selections and voilà — your data is filtered!

You should take note that you'll get different dialog boxes depending on whether you're filtering on a dimension or a measure. For example, watch the following GIF, where a user drags a dimension to the Filters shelf.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Z9eoCGDFT5ajOZvlZVX_1A_da3dc86efa4b43f2b4b1c46b3c3a49f1_Worksheet-Filter-Dimension1.1.gif?expiry=1749859200000&hmac=_WWl5PGkOEPiKaUawio6Hf09XA6elFcdNm1ocDe49yI)

Notice that the user is prompted with a dialog box that asks them to select the fields that they would like to include in the visualization. From there, they simply select "OK," and the data is filtered. (There are other options, and you will explore those in another lesson.)

Now, watch the user drag a measure to the Filters shelf and take note of the dialog box that appears.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Bo8IFrmNQFqS5GpIUN36cQ_9177fc9d26be4cd38358ba688a69c7f1_Worksheet-Filter--Measure3.1.gif?expiry=1749859200000&hmac=LI4_ouSHDNgjan3Za1wwPOdk1r8DXX4IlGX6awoo_Wg)

Notice that the dialog box is rather different. This time, the user is first asked to decide which aggregate function they would like to use. From there, a second dialog box appears, prompting the user to determine the range of values. (Again, there are additional options, which you will explore in another reading.)

# Filter Interface with Dimensions

Filtering dimensions in Tableau is a fundamental technique that allows you to refine your insights and gain a deeper understanding of your data. Dimensions represent categorical or qualitative attributes in your dataset, such as regions, product categories, or customer names. By applying filters to dimensions, you can selectively isolate and analyze specific subsets of your data, making it easier to uncover trends, patterns, and actionable information. In this section, we'll explore how filtering dimensions in Tableau can be a game changer in your data exploration and reporting endeavors.

When you drag any dimension to the Filters shelf, a dialog box similar to the image below will appear. Take a minute to look over the dimension filter interface and pay attention to the various portions highlighted on the left.

![The filter dimensions interface has 3 main parts](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/6JA46IqUQfKlQqXY-jih8A_6ac961b5c1e34fc5be863b3ca1aed7f1_Picture2.png?expiry=1749859200000&hmac=KTCZ7lrsj-3YUwsDGp-z9dj6Qkb1EHuYbMup-SIPEU0)

1. **Filtered field**: The first thing you'll notice is that the window name identifies which field you are filtering within a set of brackets. In this example, at the top, you see _Filter [Region]_.
2. **Filter options**: There are four options that allow you to add rules to filter your field. Each option offers different filtering capabilities. By and large, you will most often use the _General_ option. However, it's a good idea to be aware of what you can do in all four filter options:
   1. _General:_ Used to manually select which data points are left in or out of your analysis. An example of using this would be to filter out everything but the South region, as shown in the image above.
   2. _Wildcard:_ Used to filter data based on a portion of characters within a dimension. For example, you could filter to remove all students that have a name that starts with "D," ones that end with "-an," or any other set of characters.
   3. _Condition:_ Used for filtering with functions. This is similar to calculated fields, which you will learn about later in this course.
   4. _Top/Bottom:_ Used to filter for the top or bottom of the list. For example, this allows you to create a filter that only reveals the top 10 in a dataset.
3. **Summary box**: The summary box describes the main details of the filter you are creating. As you add additional rules in any of the tabs, you'll see them summarized in this summary box. You'll also see how many values match the filter's set of rules that you've created so that you can confirm that you are getting the results you are expecting.

# How to Filter with Dimensions

Say you want to compare all of the measures for the three West Coast states: California, Oregon, and Washington. To start, think about which dimension(s)/measure(s) you would need to move and where you would need to move them.

You can start creating this table data visualization by adding:

- _State_ to the Rows shelf
- _Measure Names_ to the Columns shelf
- _Measure Values_ to Text property in the Marks card, as shown below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/NQv9zMBcQg-MWBpGuhfvHg_02249ccf6fd2411c94b3f63d83b528f1_Dimension-Filter-2.png?expiry=1749859200000&hmac=lJse82ZU9B1qp2o-TCaG_k4DYsC9OFW2oQBjoTRWzOg)

Next, you would add a filter by dragging the field you'd like to filter to the Filter shelf. In this case, you want to drag the _State_ dimension into the Filter shelf. From there, select the three desired states (California, Oregon, and Washington).

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/KBY8smmtSW-b1gFqTwJBNA_d648ddb0b1164e1f99991dbef87d47f1_Filter-State3.1.gif?expiry=1749859200000&hmac=jIh5swETJJoa6qVat13Kmeg3GBH2MWELXTjUyJQFSVE)

Voilà! After pressing "OK," you have a table that only displays the information for the West Coast states.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/nWJ0QH3pTz-rXZywJNilJw_9001decb471c4c57855ae6127cdd2cf1_Voila.png?expiry=1749859200000&hmac=0q-iPLRpQ4ySqAt3vNfLRja96UDQK3QRyWXFH9iuug8)

**Note: **The West Coast states, as defined above (California, Oregon, and Washington), is different from the West _Region_. If you filtered the table based on the West _Region_, your table would have looked like the following:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/2PZTygAQReSx1Sblo8k96Q_93d1f09e8a3241e2a9413cb6201e7df1_West-Region-Filter.png?expiry=1749859200000&hmac=MH6iR5tzS6vxJqvvDlS3OJTYqFadiZK9NwvIpxMQESo)

As a recap, the goal was to filter the sample dataset to use and display records only if the *State *field were equal to "California," "Oregon," or "Washington." To create this filter, you can drag the _State_ dimension to the Filters shelf and then select which states you would like to include in the view.

# Filter Interface with Measures

Measures are the quantitative values that drive insights and decision-making. Filtering measures in Tableau is a crucial technique that allows you to dissect and focus on specific numerical aspects of your data, such as sales revenue, profit margins, or quantities sold. By applying filters to measures, you can dynamically control the range or thresholds for these values, enabling you to zero in on critical data points, identify outliers, and glean actionable insights.

When you drag any measure to the Filters shelf, a dialog box similar to the image below will appear. Take a minute to look over the measure filter interface and pay attention to the various portions highlighted.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/s8ts9Ws5To-Ja5y1jss4yQ_e4103d47bf024d3297b5812beccfb4f1_Picture1.png?expiry=1749859200000&hmac=eJcwf2nPP97ENUZOrnZfbb2WcGuHGafYYhjp92k1h7E)

1. **Filter types:** There are four filter types you can add to filter a measure. Each option offers different ways you can customize the filter.
   1. *Range of values: *Used to edit the minimum _and_ maximum values included in the data visualization.
   2. *At least: *Used to _only_ allow editing of the _minimum_ value included in the data visualization.
   3. _At most:_ Used to _only_ allow editing of the _maximum_ value included in the data visualization.
   4. _Special:_ Used to filter null or non-null values from the data visualization.
2. **Minimum value: **When using the _Range of Values_ or _At least_ filter types, you will be prompted for a minimum value, which is entered here.
3. **Maximum value**: When using the _Range of Values_ or _At most_ filter types, you will be prompted for a maximum value, which is entered here.
4. **Value slider**: Alternatively, you can use the slider to adjust the beginning and end of your filter range. If the slider is used, the minimum and/or maximum written in boxes #2 and #3 will be adjusted accordingly. Note that if you select the _At least_ or _At most_ filter types, only one end of the slider will be adjustable. For example, if you specify an _At least_ filter, you can adjust the minimum value, but the maximum value will be fixed to the largest value of that field in your dataset.

# How to Filter with Measures

After filtering the _State_ field, you decide you'd like to limit the dataset even more by adding a second filter. You'd like your table to only show states with a total _Profit_ higher than $40,000.

In order to complete this task, you would need to do the following steps:

1. Drag the _Profit_ measure to the Filters shelf.
2. Select _SUM_ → "Next."
3. EITHER:
   1. Leave the filter type as \*Range of values**\*OR**
   2. Select the _At least_ filter type
4. EITHER:
   1. Type 40000 in the minimum textbox **OR**
   2. Slide the left part of the slider to the right until the minimum label displays 40000.
5. Press "OK."

To see this in action, review the GIF below:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/gVib9kRgRJ-e_fogzZgc4Q_ec3ff9d90ffe4db2b84a142bfa8fd2f1_Filter-Profit2.1.gif?expiry=1749859200000&hmac=lVDbfLm34Td-1vtl7mG6Pg8Nb1txZFonYGBdoan85rM)

You have now applied two filters, which revealed that, of the West Coast states, only California has made more than $40,000 in total _Profit_ for the Superstore.

# Understanding Context Filters

By default, when you define filters in Tableau, they operate independently. This means that each filter evaluates all the rows in your data source without considering the impact of other filters. However, you have the option to designate one or more categorical filters as **context filters** within your view. Think of a context filter as a standalone filter. Any other filters you apply are referred to as dependent filters because they only affect the data that passes through the context filter.

Context filters serve several purposes:

1. They can ensure that a specific filter is executed before others.
2. You can use them to create dependent numerical or top N filters. For example, you might set a context filter to include only the data related to technology products and then apply a numerical or top N filter based on profit as a dependent filter. This way, the latter filter processes data that has already passed through the context filter.

For instance, imagine you're responsible for managing technology products for a large chain superstore, and your goal is to identify the top 10 most profitable technology products across all stores. If your data source is extensive, you can implement a context filter to isolate technology products. Then, you can establish a top 10 filter based on profitability as a dependent filter, ensuring it only considers the data filtered by the context filter.

To create a context filter, select "Add to Context" from the context menu of an existing categorical filter. The context is computed once to generate the view. All other filters are then computed relative to the context.

Context filters

- Appear at the top of the Filters shelf;
- Are identified by a gray color on the Filters shelf; and
- Cannot be rearranged on the shelf.

As shown below, the _Sub-Category_ dimension is set to be the context for a view. The _Region_ filter is computed using only the data that passes through _Sub-Category_.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ydqZS3Q7QfyNmUWDWAFJEg_5d908a985e2a405f8eb14697a75b0ff1_Context-Filter1.gif?expiry=1749859200000&hmac=-5soRIrZn5zsME3NmV2imj0-2CDjDDoK16xoW0CZPH8)

You can modify a context filter by taking these steps:

- Removing the field from the Filters shelf: If other context filters remain on the shelf, a new context is computed.
- Editing the filter: A new context is computed each time you edit a context filter.
- Selecting "Remove from Context": The filter remains on the shelf as a standard filter. If other context filters remain on the shelf, a new context is computed.

# How to Create a Context Filter

Say you want to create a context filter to show the top 10 office supply products.

First, you’ll filter a view to show the top 10 products by sales. Then, you’ll create a context filter on _Category_ so you can see the top 10 office supply products.

To get started, the image below shows the sales for all _Sub-Categories_, sorted with the highest sales on top.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/k2KRj20gSxKGls30WXL2CQ_2263f83d0c3342c8ae400fa136db95f1_Context-1.PNG?expiry=1749859200000&hmac=aUY_83zFVfrYRj5xnvmxhpeTkwaLOyKCfKxyreE9JeY)

Now create a Top 10 filter to just show the top selling products. You can create this filter by dragging the _Sub-Category_ field to the Filters shelf. In the Filter dialog box, switch to the _Top/Bottom_ dropdown and define a filter that is "Top 10 by Sum of Sales."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/g4ejO_ppRK2d51ffPjEEcw_722b394dbaa3469f9f84f84822f9f8f1_Context-2.PNG?expiry=1749859200000&hmac=q0PMgqV8mUa-dlTJmZm6L_BSAnn40tZc-2onWioEnho)

When you click "OK," you’ll see that the view is filtered to show the top 10 product _Sub-Categories_ in terms of sales.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/v4QWGkHHQG6zfBZ4Qo3n2A_dab62613abcc41a48ece379143a49bf1_Context-3.PNG?expiry=1749859200000&hmac=K2CQfhyoiUyJrSQgE9S-ES4NwcJ6UAuAIfZJTid1L9E)

Now, let’s add another filter to show only office supply products. Drag the _Category_ field to the Filters shelf and select only "Office Supplies." When finished, click "OK."

The view is filtered but instead of 10 products, it now shows three. This is because by default all filters are evaluated separately and the view shows the intersection of the results. So, this view shows that three of the top 10 overall products are office supply products.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/gwZhzv_rTMSIJOGkXW2O8g_0c4aadb54266466180b40a9cdfac3ef1_Office-Supplies.PNG?expiry=1749859200000&hmac=ao8xj39DQsyhsocYqUmNjn0hwiQJ0MHYncvLvaby4M4)

To find out what the top 10 office supply products are, we need to make the _Category_ filter a context filter. Right-click the field on the Filters shelf and select "Add to Context."

The filter is marked as a context filter and the view updates to show the top nine office supply products. Why not 10? Because only nine of the _Sub-Categories_ contain office supplies. But, we now know that the top 10 filter is being evaluated on the results of that context.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/NAEOI7HCSmm5hi0Tj84_TQ_0f77fae8be914e2ebe7cc11a11023bf1_Office-Supplies-1.PNG?expiry=1749859200000&hmac=IiAi29Qw4YtnCxJnC5c0PRLsYWKK9vqfZCE2YKtW9as)

# Filtering Order of Operations

At this point, you have learned about a lot of different types of filters! Review the list below for a quick recap:

- Data Source Filters: Filters the entire workbook (all worksheets)
- Context Filters: Filters a specific worksheet, and is applied before standard (non-context) worksheet filters
- Worksheet Filters: Filters a specific worksheet - can be applied to either dimensions or measures

It's important to note that there is an inherent order of operations in which these filters are applied within Tableau. For example, as you learned in this lesson, context filters are applied _before_ standard (non-context) worksheet filters are applied. So how where do data sources filters fit into this flow? And how about filters on dimensions vs. filters on measures?

Take a look at the list below, which outlines the order in which the filters are applied:

1. Data Source Filters
2. Context Filters
3. Worksheet Filters on Dimensions
4. Worksheet Filters on Measures

If you'd like more information on Tableau's filtering order of operations, and filtering in general feel free to take a look at this [Tableau help article](https://help.tableau.com/current/pro/desktop/en-us/filtering.htm?_gl=1*68nvfp*_ga*MTc4NjE0MjcwNS4xNjk3MDYxNDgz*_ga_8YLN0SNXVS*MTcwNTEwMDMyOS4xMjYuMS4xNzA1MTAwNDc3LjAuMC4w).

In Tableau, **grouping** is exactly what it sounds like — a way to group related values. Groups essentially build a new field based on the original field chosen, but the values are now grouped with their respective group names. For example, in the Superstore data, you could group cities together to create counties. Once a grouping is created, it is saved in a newly created field.

The primary reasons for creating groups are to do one of the following:

- Deal with poorly structured or error-prone data.
- Condense your data in cases where a field contains a large number of values, making it challenging to analyze and/or visualize them all at once.

Grouping your data is a powerful way to keep your worksheets organized, in addition to many of the other concepts you have learned so far in this course. Failing to keep a Tableau worksheet organized can lead to several dangers and challenges that can have a negative impact on your work as an analyst:

- **Inefficient analysis:** Without proper organization, finding relevant data and insights becomes time consuming and inefficient. Analysts may struggle to locate specific data points or navigate through complex datasets, wasting valuable time and hindering productivity.
- **Lack of scalability:** Disorganized worksheets can become unwieldy as the dataset grows, making it challenging to handle larger data volumes. This lack of scalability may limit the depth of analysis and hinder the ability to handle more comprehensive datasets.
- **Difficulty in collaboration:** Collaborating with team members or sharing analyses with stakeholders becomes cumbersome if the worksheets lack structure and clarity. It may lead to misunderstandings, making it challenging to align different perspectives and collaborate effectively.
- **Inconsistent reporting:** Disorganized worksheets may lead to inconsistent reporting and visualizations across different projects or reports. A lack of standardized approaches can create confusion and make it difficult to compare data across various analyses.

To avoid these dangers, it is essential to prioritize worksheet organization in Tableau. By properly creating hierarchies and groups, analysts can create clear, meaningful visualizations that enable data-driven decision-making and support the overall success of the organization.

If you haven't thought about it yet, take a moment to think about the difference between folders and groups. The distinction lies in what you are organizing together:

- Related **fields** are placed in **folders**.
- Related **values** are placed in **groups**.

# Using Folders in Tableau

A Tableau **folder** is a standard folder system that acts as a container to organize related fields.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ijrg5JIPQC6d-AW8FYkzyg_e5a4d9adaf334263a9195e01365859f1_Screen-Shot-2023-12-31-at-12.39.51-AM.png?expiry=1749859200000&hmac=MKjUgg8krcetzyxOuzfB8vtcS2yyM1o4FkP2HpERL8w)

For example, in the image above, there are three folders: Customer, Order, and Product. The Customer folder contains all fields related to customers, the Order folder contains all fields related to orders, and the Product folder contains all fields related to products. By creating these folders, you can move and collapse the data within them, which provides more visual room in the sidebar and is useful when your data source incorporates data from multiple tables. The collapsed version of the three folders will look like the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/XNmviKjvQve-4l_BWePnjA_bd6d3d762603474798e680827e09a0f1_Folders-2.png?expiry=1749859200000&hmac=F_GiYCFLuzRFWp8S-Ac5Y03dZ2ehEsY9C79x4MRaJlo)

Folders in Tableau are used for the same reason you wouldn't want to leave all your computer files scattered across the desktop of your PC. They help remove clunkiness and clarify data for the analyst.

Creating folders in Tableau is simple, although you'll need to first change one setting in order to create folders. By default, Tableau orders the sidebar based on the data source tables. If you would like to use folders, then you'll need to change this setting so that it's grouped by folders. This can be done simply by selecting the arrow to the right of the search bar and then "Group by Folder."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/9MMMKo7OQZOtm2iFromQ8A_2628bcaa158f4b23bb0161c5eed409f1_Screen-Shot-2023-12-31-at-12.41.40-AM.png?expiry=1749859200000&hmac=0Q59yinc8bEQjF10cK297rByAWOmhLIebu0Ss9LrWqM)

From there, to create a folder, simply right-click one of the fields you would like to put inside a folder, and select "Folders" → "Create Folder..."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Kx7Ga1fsTDCNRbvv6SAhdA_f8f8c519cb9a48578e2f01d19e7225f1_Screen-Shot-2023-12-31-at-12.42.32-AM.png?expiry=1749859200000&hmac=92_4T1lGPDCb28D8EeRweRWdq7g7lg75WfrkcG_MJ9w)

From there, you'll give your folder a name and then drag any additional fields you would like directly into the folder. To see this in action, watch the following GIF.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/yvnx85wfTxSQOkIv_GVFjw_32781f0329ea4c14a1be7726fed207f1_Folders1.gif?expiry=1749859200000&hmac=4XdWwBkxW-8r-peGO-2qSEwUL9h_RTOsXuSggck5DQc)

Note that if you don't update the sidebar setting to "Group by Folder," then you will not have the option to create folders.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/OVjINxWuQfu9vfF9HIM6FA_d8eb8b4fd03445b2823ae8bbc514d9f1_Screen-Shot-2023-12-31-at-12.43.33-AM.png?expiry=1749859200000&hmac=BD6bOilGN5FAIM-UqMd9d3Ta_czfjVnGMMlqhGaE8k0)

# Introduction to Hierarchies

In Tableau, a **hierarchy** is another organizational structure in which dimensional metadata is organized by position. As a reminder, **metadata **is theinformation about the data within your dataset, such as field names and data types.

Tableau will sometimes assume and implement hierarchies itself, but they can also be created manually. The icon used to represent a hierarchy is similar to what you may have seen with a typical family tree, with a parent node branching off to two child nodes. Hierarchies give a rank to the metadata and allow for the data to be used in drill-down reports, essentially specifying which fields make up or "belong to" other fields.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/fOZ6Il_XR06RoWYbV9v2EQ_5c25950ae16548ecbda45dd7b76dddf1_Higher-1.png?expiry=1749859200000&hmac=dm_iPrYq_cDp0dbORR9okmYp8aMa9yc6eMgMe9xHuu4)

In the Location hierarchy in the above image, _Country_ is the first field in the hierarchy, which can be broken up into _Regions_, which can be broken up into _States_, and so on. Each rank encapsulates the fields below it to create a hierarchy. One way to think about this is as a pyramid where each layer down the hierarchy reveals a greater level of detail, as shown below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/9I1MMzKYTJ6RVQ45Gs4F0Q_8af590f96bf24b20b4231e52218635f1_Higher-2.png?expiry=1749859200000&hmac=kCoPuwt9l015jxgnchrHGoaIIruSxQlP-Oz14KQgkHk)

Any field in the hierarchy can be dragged into a view or shelf, including the name of the hierarchy itself (e.g., Location). However, it's important to note that if you drag the name of the hierarchy itself onto your worksheet, Tableau will place the top-level field from the hierarchy in the view (e.g., _Country_).

As an analyst, you'll use folders simply to add greater visual organization to your worksheet navigation. However, if you want to relate fields in a parent-child fashion, allowing for the drill-down functionality, then hierarchies are your way to go.

# Create a Custom Hierarchy

To create a hierarchy, you will first need to decide what this hierarchy will be. For example, if you are using a dataset that provides data fields related to animals' taxonomic classifications, you might want to create a Taxonomy Classification hierarchy, with fields such as _Order_, _Family_, _Genus_, and _Species_ belonging to this classification.

After deciding on the hierarchy you need to create, you can right-click on one of the fields, then select "Hierarchy" > "Create Hierarchy...". It doesn't matter which field you initially select, as the ranking can be rearranged later. Alternatively, you can drag a field onto the parent field to create a hierarchy. In the example above, _Family_ would be dragged onto _Order_. From there, simply drag any additional fields into the hierarchy.

Review the GIF below to see the creation of the _Location_ hierarchy.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Ur56VHbQQZKqFas5YP6zQw_bae4215a10d4415cbb3e1edfdd6c86f1_Location-Hierarchy-3.1.gif?expiry=1749859200000&hmac=Lc_UcKvIiDn974aYwDuL1UJAQXkTHrTG-v135bOP-mY)

Tableau provides analysts with a lot of flexibility to design hierarchies as they see fit. However, mistakes can be made with this level of flexibility. If you make a mistake while creating a hierarchy, that's okay! It can be easily undone. However, try to exercise caution when creating hierarchies and make sure that each field truly belongs.

Before you use a hierarchy in a drill-down report, you need to consider the order of the fields. Your goal is to create a hierarchy that breaks down the general grouping into smaller, more specific groups. For example, in the hierarchy below, all fields are in order from the general all-encompassing field*,* _Country_, to the most specific field, _Postal Code._

Specifically, _Country_ can be broken into _States_, *States *into _Cities_, and _Cities_ into _Postal Codes,_ as shown in the following image.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/7e2MfDSTTv2EeoE1ebAsBw_2a62655c9efd4c73a2e44c9898d984f1_Higher-3.png?expiry=1749859200000&hmac=YMCK73cOiAvqS_iEjYHRn_c-osY2JgfxGtScaJc6g9M)

Now that you have gathered all related fields, you can use a hierarchy within the worksheet to build a drill-down report, which can be used to immediately add deepening levels of granularity.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/kQH8dxAHRoayalBD3fi6Hw_f05c9f5cb3904702a4e1b626978679f1_Location-Hierarchy-1.1.gif?expiry=1749859200000&hmac=VV9WUoARS763nNLAI4Kzsv28kLVLTQKmZOcjRxkFCGk)

In the previous GIF, notice that as you expand the location hierarchy, the breakdown of what makes up the table visualization changes with a single click. As a data analyst, you'll want to implement hierarchies whenever there is a relationship that can be drilled down between multiple fields. The varying levels of detail are often explored, either by you or the audience.

# Understanding Drill-Down Reports

To **drill down** in Tableau means to break data into smaller pieces. By drilling down, you or the user can explore different levels of detail — or granularity — as needed, providing much more freedom to choose how you need your data summarized or shown. This is one of the useful tools Tableau possesses to help the user get valuable data perspectives within seconds. Drill-down reports are simply data visualizations that implement this drill-down feature.

For example, the Location hierarchy can be added to the Columns or Rows shelf and can quickly be drilled down into smaller pieces as you go down the hierarchy.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/IaaXps5DQTC6e2-UhfS5DQ_dd152037468b410782b3dbaf08d10ff1_Drill-Down-1.png?expiry=1749859200000&hmac=hVwOIlAFURD2aqWBZ8ZofrTI2I2j5JIIcqgIbfuvuls)

As mentioned previously, dragging the Location hierarchy onto the Rows shelf automatically places the first field (_Country_) on the Rows shelf. Now, using the drill-down function, you can quickly expand the data by adding the field below the selected field in the hierarchy.

As seen in the following GIF, for each field in the Rows shelf, there is an icon directly to the left of the field name. If the icon shows a plus sign, this means the field can be further drilled down. Clicking the plus sign will add the next field in the hierarchy onto the Rows shelf. Vice versa, selecting a minus sign would essentially "drill up" and remove the field directly below in the hierarchy.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/nH3CDBg-SYGwCz6lIG3IXw_ec373fb996da41a2ae1c57b727aae2f1_2024-01-19_12-09-11-1-.gif?expiry=1749859200000&hmac=hbnnyH94P4zj44UXMFjR73iXolGA9GoKMn329Y0uj-U)

Notice that you can also drill down and up directly from within the actual table visualization:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/_z1EPji9QRa6-WlrVsv5eg_c9a263d0680147059551f21deedefcf1_2024-01-19_12-14-32-1-.gif?expiry=1749859200000&hmac=TQjCSRs-LL3F2xT4C8oLGa-6gbjTMl6nVAJXZiPMNSI)

As you may expect, you're free to use any combination of drilling down or up through the shelves or table viz. In addition, you can pull fields off of the shelves to remove them from the table viz, and can continue to drill down or up with the remaining fields. Take a look at the GIF below to see this in action:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/1k3tzDapTKqTGap1biiz1w_765f82aa306f4342ab86ff2ac77480f1_2024-01-19_12-25-08-1-.gif?expiry=1749859200000&hmac=BcxNhF61twggM80qbVybqXjM7yoFaOjXy6g_O7fORwI)

Another example of dimensions that typically have a hierarchy are dates and times. You'll see an example of this in a moment.

# How to Drill Down in Time

When you add a field with a date data type to any dataset, it is automatically considered a hierarchy that you can drill down. This is because dates and times can always be broken down into smaller intervals.

For example, if you look at the _Order Date_ field from the Superstore data, you'll see that it's structured using a DD/MM/YYYY format.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/xmczoo74TKSLOX291gE3uA_c661cba6f38045a9911e29704d85f0f1_Drill-Down-2.png?expiry=1749859200000&hmac=e-JgPDu4Ug4VU4lpRzE2Bl-fI0_MPwypbqk6Z6L2Y3w)

If you were to drag the _Order Date_ field from the sidebar onto the Rows shelf, however, you wouldn't see the field represented this way. Tableau would automatically condense the field into years, as seen in the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/gUBxVt7aQJmghjDLzLxnMA_fe4acbc67861420e86ad00c1a89241f1_Drill-Down-3.png?expiry=1749859200000&hmac=2XV5Ofxei0uU-4IHlIJ-yz844yHm0EVKHLagJHTOnjY)

Tableau has assumed that this field has a normal date hierarchy. Thus, dragging the field onto the Rows shelf acts similarly to dragging the name of a hierarchy onto the shelf, where it defaults to using the highest-level field in the hierarchy. In this case, that is years, because years are the highest-level part of a date captured by this field.

But, what if your goal were to view the data in months or days? To accomplish this, you could use the drill-down function to change the level of detail within the visualization. You could do this by clicking the plus sign icon on the _YEAR(Order Date)_ field in the Rows shelf and so on. Review the following GIF to see this in action.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/pKcIw_7_TS23vLU6vWWGcQ_2c61c113ad9e4be7b24e1c19409aa4f1_Order-Date1.gif?expiry=1749859200000&hmac=W5i9FM816l63g-LGV-pXk74PFESxwfQurJHuelQ28XM)

One thing to note before moving on from the Date hierarchy is that you'll notice the sidebar doesn't reflect this existing hierarchy, as it does with the Location hierarchy. Be aware that this type of hierarchy will nearly always be assumed if there is a date field present in your dataset.

# How to Create a Custom Group

In addition to folders and hierarchies, another way you can combine your data is by creating groups. To create groups, right-click on the field you'd like to group, then select "Create" → "Group..." as seen in the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ErjG_2SCRVK_jiRBcBP0Sg_2daa8daef549481384dddb3625829bf1_Groups-1.png?expiry=1749859200000&hmac=K-xzd3zYg9fYg8ihHPEXW5gOi2DZ_yUHXmr-Jl_pqZI)

From there, the grouping interface will appear, which will look something like this:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/jOEIFFJ3RPinyCubgNMvqA_5e5b26a294dc4a7d9e22162ed2d132f1_Groups-2.png?expiry=1749859200000&hmac=QytHrJW-GoZCiaWwon7KjQ9Ii2v9V2gcVGWXf3b_LwM)

Here, you'll be prompted to create a new field name. Below that, you'll see a list of all of the values from the original field you selected. At that point, you can begin creating your groups.

There are two ways to create a group. The easy way and the more time-consuming way.

The easy approach involves _first_ selecting all of the values you would like to group together and _then_ creating the group. The steps for the easy approach are as follows:

1. Select all of the values that are to be a part of the first group. To select multiple values, press and hold Ctrl (PC) or Command (Mac) while selecting each value.
2. Once all of the values are highlighted, press the "Group" button in the bottom-left corner.
3. You'll now be prompted to create a name for the group. Give your group a name that reflects the values you have selected. Note that you can collapse the group to hide the values that are within the group. This is a nice feature to help you focus on the remaining values that are to be placed into other groups.
4. Repeat steps 1-3 for all of the other groups you would like to create.

Watch the GIF below to see steps 1-3:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/zq2WHqLsQeaPdcJbXj9OSA_8af75a7e4fdb4490b79b2680de1a95f1_West-Coast.gif?expiry=1749859200000&hmac=b7XrCuwdco0zF1NUTcRi_KIckHmupBof44SkpmhWn8g)

You may be wondering why you should know the more time-consuming approach to creating groups. The main reason is if you find yourself in a situation in which you need to make updates or if you accidentally missed one of the values that was supposed to be a part of the group. Knowing this approach will prevent you from having to create the group from scratch.

This approach involves _first_ creating the group and _then_ selecting all of the values. The steps are as follows:

1. Select one (or more) of the values that are to be a part of the first group.
2. Press the "Group" button in the bottom-left corner.
3. Create a name for the group.
4. Drag and drop the remaining values into the group.

Take a look at the GIF below to see this in action:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ZgoxI2RMQgmPduVNK078zQ_4dbba25441be4fec882c4fd8e8eab4f1_West-Coast-1.gif?expiry=1749859200000&hmac=WozO2bqq8Kt1zmz7I7jXZJwQnfHj8r4-a6byG2ZnHVA)

As you can imagine, dragging and dropping each value individually can be rather time consuming. Ideally, you would _first_ select all of the values and _then_ create the group, but know that you can always add values at a later time if you accidentally miss one of the values when initially creating the group, or if you decide to include a new value later on.

When you're finished making groups, all you need to do is close the dialog box by clicking the "X" in the top-right corner. You'll notice your new group shows up as a field in the sidebar. If you drag this new field into the Rows shelf, you'll see that each group shows up as a single value, as seen in the image below. Note that the image below shows the result of two groups that have been created: West Coast and Southwest.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/wTqGA7RaQCq9tUjreWxk_w_0b1458c5b312420da1776a1e3aa7caf1_Groups-3.png?expiry=1749859200000&hmac=IjGGNCRQMDPZ6LvIYJIc9nr1rqAqjPn7ImPg3tt9qNU)

Can you try to predict what would happen if you now dragged the _State_ field into the Rows shelf, to the right of _Sales Region_?

Below, notice how the West Coast states are grouped next to the West Coast value and the Southwestern states are grouped next to the Southwest value.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Q0pD7x5gTfCYO_WUOeIP-Q_cbaf5e24dbf84f3188080fbeaa111bf1_Groups-4.png?expiry=1749859200000&hmac=zU6jCNe54hhoDRYVjAqZMkfhui2pCC2gZWYAu0I11d4)

Also, take a moment to compare the _Sales_ values between the previous two tables. Looking at West Coast, for example, you can see that the first table shows that the total sales is $613,760. This shows up in the second table as the sum of the three states in the West Coast group: $457,688 + $17,431 + $138,641.

By creating groups, you are essentially adjusting the granularity (making your data less granular).

There are many reasons why you might choose to create groups. For example, being a data analyst often comes with working with unclean or poorly structured data. Imagine that an analysis of various companies was being conducted using a dataset on the yearly figures from each company. Perhaps the person entering the data sometimes used the company's full name and other times used the abbreviated name (e.g., General Motors vs. GM). This could result in a complicated analysis but could be easily remedied by grouping these two names.

# Introduction to Sets

Sets function as curated subsets, offering a methodical approach to segmenting and scrutinizing specific data elements. These sets act as dynamic filters, enabling users to focus on pertinent information, such as identifying peak months or analyzing the performance of top-selling products.

By leveraging sets, users can effortlessly pinpoint and analyze specific aspects of their data, akin to employing refined lenses that zoom in on targeted insights. While Tableau provides fundamental set creation capabilities, the more advanced features — including dynamic sets that adapt to evolving data and fixed sets that maintain stability amid fluctuations — are accessible through Tableau Desktop.

Let's say your manager is interested in knowing how the sales for the top three _Sub-Categories_ perform compared to all other _Sub-Categories_. To determine this, you could create a set for the top three _Sub-Categories_ in terms of sales, as shown in the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/qgINrvKGRbaywTxIZu-JDg_5bb848080942473c86f46851b16d9ef1_Sub-Cat-Set-2.PNG?expiry=1749859200000&hmac=UIRIEjEzfE76jrWawI8xQj_ff3CeooPPl6ul2DPqHs8)

### In/Out Mode:

Once a set is created, Tableau provides two primary modes for utilizing sets: in and out.

**In mode:** When you use a set in "In" mode, it includes only the members of the set in your visualization or analysis.

- This mode is useful when you want to focus exclusively on the data points that meet the conditions defined by the set.

**Out mode:** When you use a set in "Out" mode, it excludes the members of the set from your visualization or analysis.

- This mode is beneficial when you want to analyze the data outside the conditions specified by the set, providing a comparative view.

The In/Out mode of sets in Tableau offers a dynamic way to control which data points are included or excluded from your visualizations. This flexibility empowers users to perform detailed analysis on specific subsets of their data, enhancing the depth and precision of insights gained from Tableau visualizations.

Coming back to our example, we can see that the "In" group — the top three _Sub-Categories_ in terms of sales (Phones, Chairs, and Storage) — generate less total sales than the "Out" group — all other _Sub-Categories_ combined.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/zIqhu46ARRmTah_NWNORhw_12f2878599504e55ba12f4b3c2453bf1_Sub-Cat-Set-3.PNG?expiry=1749859200000&hmac=M9JJJLGd03vtghXYBPfxzLkm4ffz3RqAdvEJzet_IeU)

# Introduction to Aggregation

**Aggregation **in Tableau means that the field is summarized using mathematical equations such as sum total, median, or average. In other words, it means to "roll up" the data and present it in a summary form using statistical functions known as aggregate functions. Without aggregate functions, you would not be able to create data visualizations.

For example, imagine a pasture with many sheep, like the one depicted in the following images. If a farmer wanted to know how many sheep are in the pasture, then the farmer would need to aggregate the field and get the total number of sheep. This reveals that the flock consists of 36 sheep.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/dBxtpHvvSs-BhWSJVsVxKQ_b04c72aabb0d4383904f1826b1ef7df1_Sheep-Aggregation.png?expiry=1749859200000&hmac=9o1V96Pp_KW45acR6Z5_pNY70kV_tlZJi1cIQNJQnGk)

This effect of rolling up a pasture of sheep into a flock of 36 using the SUM aggregate function is the same process that happens with datasets. Rows of data are aggregated, returning an easier-to-comprehend summary number.

**Aggregate functions** are built-in Tableau functions that allow you to summarize fields of data by returning single values, such as the minimum, average, or sum of a column. Tableau automatically aggregates any measure field added to a Tableau worksheet. Why? Without aggregation, you would have no way to condense the numeric data and derive insights!

Take a second to read over the common Tableau aggregate functions below. If you've ever used spreadsheet software (i.e., Google Sheets or Excel), SQL, or most other programming languages, you'll quickly notice that aggregate functions look very familiar.

| AGGREGATE FUNCTION | DESCRIPTION                                                    |
| ------------------ | -------------------------------------------------------------- |
| SUM(expression)    | Returns the sum total of a numeric field                       |
| AVG(expression)    | Returns the average value of a numeric field                   |
| MEDIAN(expression) | Returns the median value of a numeric field                    |
| COUNT(expression)  | Returns the number of non-empty values within a selected field |
| COUNTD(expression) | Returns the number of unique values within a selected field    |
| MIN(expression)    | Returns the smallest value of a selected field                 |
| MAX(expression)    | Returns the largest value of a selected field                  |

If you'd like to explore the other aggregate functions, visit Tableau's [documentation](https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields_aggregate_create.htm) or review the [Aggregation and Granularity external module](https://trailhead.salesforce.com/content/learn/modules/aggregation-and-granularity).

Example Aggregate Functions

Consider an example of an _aggregate_ function — SUM:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Hhbhf0uKQHOfaWy3IgT_Fw_0ea569d187654d95b122948194d564f1_Function-3.png?expiry=1749859200000&hmac=nzSDz5DWD0F-B-Gf_xr9IsSYRwzfivcpoW_nQli9vsM)

This function would return a single value, which represents the total profit (the sum of every row in the _Profit_ field).

The sum of _Profit_ is useful information, but the true power of aggregate functions is unlocked when they are used to build visualizations. This is because aggregate functions are efficient and return results instantaneously for tasks that would otherwise take a long time.

You may have noticed that Tableau defaults to the SUM aggregation. This can be changed to another aggregation, as you know, since you've done it before when you changed the _SUM(Discount)_ to _AVG(Discount)_.

It's important to note that there are two ways to go about changing the aggregation type:

- Worksheet-level aggregation: Sets the aggregation for the worksheet
- Default aggregation: Sets the aggregation for the entire workbook

Continue below to see how this is done.

## Edit the _Worksheet_ Aggregation

There are many ways to change how the measure is aggregated on a _specific worksheet_. One way is to go to the Marks card, right-click the measure → Select "Measure" → Select the aggregation.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/0GFGEvcqQ4i12azc4eSuYw_7becbf3cde094635841ac5a67ff2cff1_Aggregate-Measure.png?expiry=1749859200000&hmac=eAKFUCfb0IWE_mFDn7lbw7bVHPZUKuVIk-5I_mMQMkA)

## Edit the _Default_ Aggregation

You can also change how the measure is aggregated across the _entire workbook_. To do this, head over to the sidebar, right-click the measure → Select "Default Aggregation" → Select the aggregation.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/6dq4kh1aSVuZff75ME4FvQ_f295854ca3f84452aec87e7838f864f1_Aggregate-Default.png?expiry=1749859200000&hmac=t_Xbq16TIPPTR1iUAdzs0qo62pkOwzDgr8GHb9bQZHQ)

# Aggregate Functions in Calculated Fields

It's important that you understand the difference between calculated fields that have been built with aggregate functions and calculated fields that have been built with non-aggregate (e.g., string, date, and number) functions. Consider the following example to better understand why.

## Calculated Fields Example

Consider the following basic dataset that contains _Profit_ and _Sales_.

| Product | Profit | Sales |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| ------- | ------ | ----- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A       | $50    | $200  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| B       | $10    | $100  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |

Now, suppose you were asked to determine the average profit ratio. How would you go about it?

Note that _Profit Ratio = Profit / Sales_. For example, a $3 profit on a $10 sale would have a profit ratio of 0.3 (3 / 10).

### APPROACH #1

One option might be to first calculate the profit ratio for both products and then average them together:

| Product     | Profit | Sales | Profit Ratio |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| ----------- | ------ | ----- | ------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A           | $50    | $200  | 0.25         |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| B           | $10    | $100  | 0.1          |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| **Average** |        |       | 0.175        |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |

As you can see, this approach results in an average profit ratio of 0.175.

### APPROACH #2

Another option might be to first calculate the total profit, then the total sales, and then get the ratio of those values:

| Product   | Profit | Sales | **Average Profit Ratio** |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| --------- | ------ | ----- | ------------------------ | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| A         | $50    | $200  |                          |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| B         | $10    | $100  |                          |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |
| **Total** | $60    | $300  | 0.2                      |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |

Using this approach, the average profit ratio turns out to be 0.2.

So, which approach is correct?

Technically, either can be correct! It depends on the kind of information you're looking for. Each ratio has a different meaning.

- Approach #1 represents the average profit ratio by treating each product with equal importance.
  - This was done by first calculating the profit ratio for each product and then averaging those values together.
    - Note that _Product A_ was five times more profitable and two times more expensive than _Product B_.
  - This is an example of creating a calculated field using _non-aggregate_ functions.
  - The formula would be: **[Profit]/[Sales]**
- Approach #2 represents the average profit ratio by taking into consideration the "weight" of each value.
  - This was done by first finding the total _Profit_ and total _Sales_ and then finding the ratio of those values.
  - This is an example of creating a calculated field using _aggregate_ functions.
  - _Profit_ was aggregated using the SUM function.
  - _Sales_ was also aggregated using the SUM function.
  - The formula would be: **SUM([Profit])/SUM([Sales])**

Suppose you were analyzing this data — which profit ratio do you think the CEO would want to learn about?

Most likely, the CEO would be interested in the profit ratio determined using **Approach #2**. It's unlikely that you would want to treat each product with equal importance.

## Aggregate vs. Non-Aggregate Functions in Calculated Fields

When should you use aggregate functions vs. non-aggregate functions in calculated fields? While there's no hard-and-fast rule, there are some general considerations.

The choice between aggregate and non-aggregate functions depends on the level of detail you want to achieve in your analysis. Aggregate functions perform calculations on _groups of data_, while non-aggregate functions perform calculations on _individual data points_.

In general, you should use aggregate functions in calculated fields when you want to perform calculations throughout _multiple rows_ of data, such as finding the sum or average of a _column_. Non-aggregate functions, on the other hand, are useful when you want to perform calculations on _individual data points_, such as converting a date field to a specific format.

Understanding the appropriate use of aggregate and non-aggregate functions will help you create meaningful calculations and visualizations in Tableau.

# What Are Table Calculations?

**Table calculations** calculate data based on only what is in a present view after all other calculations have been processed, allowing you to further manipulate data _after_ you have created the visualization. These types of calculations differ from calculated fields in that they are created and reside specifically within _one visualization or view_. **Calculated fields**, on the other hand, are actually created _on the Tableau data source_, which is why they create a new field on the data sidebar and can be used in multiple visualizations within a project.

There are two key benefits to using table calculations:

- Because you are only running calculations on the subset of data in the present visualization (table calculations do not run on any data that has been filtered out), they tend to be more efficient.
- Table calculations show the relationship between the values of a specific field.

For example, say you owned a furniture store and you wanted to calculate the _% of Total Sales_ for each product _Sub-Category_. Table calculations could quickly calculate the percentage for each product to show the relationship these products have to the total sales of the furniture store.

In the Tableau table shown below, all furniture _Sub-Categories_ are shown, along with the _Sales_ and _% of Total Sales_ for each.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/PpTvzxUlT5-a0CuQYcrfxw_0272deed98574388887cc74f19487cf1_Table-Calculations-1.png?expiry=1749859200000&hmac=Pn06_WEFnvmNcd_LBG2hy8UUHZvJix8Yw4k3rGdEzN0)

To create the calculation for the _% of Total Sales_, you have two options:

- **Table calculations**, which are highly customizable **OR**
- **Quick table calculations**, which are commonly used table calculations that are pre-built into Tableau. You will explore these next.

# What Are Quick Table Calculations?

Quick table calculations are the frequently used table calculations that allow you to quickly calculate data after it has been visualized, while avoiding the manual setup involved with normal table calculations.

As mentioned previously, table calculations can only be run on data that exists in the current view. This means that the field you wish to run the quick table calculation on must already be present on a shelf in the view. To view the quick table calculation options, right-click on a field and hover over the "Quick Table Calculation" option. This will reveal all of the quick table calculations available for the selected field, as shown in the following image.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/xSKRVV-2RAafn1ziRYgKpQ_9afaa60426bc4bfb801da5412525abf1_Quick-Table-Calculations-1.png?expiry=1749859200000&hmac=-c-65O5FRUne648gFMniWl6qRqhw0nyHRvG1axf4Nak)

Within the "Quick Table Calculation" menu are a handful of functions that are commonly used after a visualization has been created, such as a running total, percent of total, moving average, etc. By selecting one of these calculations, you will change the way the selected field is calculated. Investigate this further in the following example.

# How to Use a Quick Table Calculation

Say you wanted to look at *Profit *by _Region_. For this, you'll drag the *Region *field onto the Rows shelf and the *Profit *field onto the Text property in the Marks card, creating the table shown below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/nBvW9a3KSBiEcjuGFwN62g_58631ca72080400a871c294beccf79f1_Quick-Table-Calculations-2.png?expiry=1749859200000&hmac=uQhyFp7k97eeCanCUC7q71PwPpjlATTeb25WNtGH5LM)

To better compare the regional Superstore profit, it may be useful to see *Profit *as a percentage of the total rather than as a currency, as shown below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/axPWlKYqRj2MkjtgwxzG4w_5190fd91a96b4f5fa92a9f6f4447e5f1_Quick-Table-Calculations-3.png?expiry=1749859200000&hmac=11dGUKCKydlUK2jWWnQlOVAkPy9U2gsj4yNU-HQnLBE)

Mathematically calculating the percentage of the total would involve dividing the *Profit *for each *Region *by the total *Profit *in the view, and then multiplying by 100. Instead of building a calculated field or using a calculator, you can use a quick table calculation.

To do this, simply right-click the _SUM(Profit)_ pill in the Marks card and select "Quick Table Calculation" > "Percent of Total."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/tFUMubrDQzyZehpWX0UrwQ_4cbfd3f565cf415bb4f7bf954786c0f1_Quick-Table.1.gif?expiry=1749859200000&hmac=6Wzm8dj8lSoJeDDF1NZqjYvmu3BT9fphbxBObcdGJLw)

Now _SUM(Profit)_ is displayed as a percentage of the total *Profit *across all *Regions, *revealing a better summary of the breakdown of *Profit *by _Region._

Notice that the _SUM(Profit)_ pill in the Marks card has a triangle, known as a delta, on the right side. This indicates that this is a table calculation.

What if you wanted to show both the total profit* and *profit as a percentage in your table? You might think you should simply drag another _Profit_ measure over to the Text property in the Marks card, but if you do, your table will look something like this:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/oYfBhJ4vTvCjHuWPerzD-Q_50d7ea073e914132968561c167bbd1f1_Quick-Table-Calculations-4.png?expiry=1749859200000&hmac=FqY0uZ6yiGlTZCqONeg6y6wiMdRYUuuEW-992YYRbTI)

This table is not as clean and straightforward as it could be. It would probably be nicer if the profits were in one column and the percentages were in another.

To do this, instead of dragging another Profit field to the Text property in the Marks card, drag it directly to the table, as shown in the GIF below:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/_9SgqL9ASACKn0VgwVAiNg_eb0a2e2b74a349338314d7500bc93cf1_2024-01-19_12-59-52-1-.gif?expiry=1749859200000&hmac=6mxPbWz1ECUOOUmbg9SUOjEl21UHXM7AlObwtLeRQv8)

You'll notice quite a lot happens when you do this — that's the power of Tableau! It will take care of a lot of the background work for you. Notice the _Measure Names_ dimension was automatically added to the Columns and Filters shelves, and the _Measure Values_ card appeared and contains both of the measures you were working with, as shown below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/MeZ9dtczQd2i4l55bKbWpw_44a9ea6b291e4fcfba78a10711da26f1_Quick-Table-Calculations-5.png?expiry=1749859200000&hmac=AccsK07Ly7GgXLCuOE1nIL3w5UrT5yabai-81SDfz-Y)

You now understand how to use quick table calculations to perform local mathematical operations, which highlight the relationships between measure and dimension values within a single view.

# What Are Grand Totals and Subtotals?

Tables in Tableau are built for the audience to compare values and uncover insights. Frequently, a table is enough to get a point across by itself. However, as tables get larger and more complicated, they can start to become confusing and difficult for an audience to assess comparisons and insights. To prevent any confusion and give you a higher likelihood of communicating the correct insights, you can add grand totals and subtotals to your table visualizations.

Suppose you created the following table that shows the number of products sold by _Category_,_ Sub-Category_, and _Region_.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/f7kBJ4RpRA6INhN62d1CcA_c2bfd58fb68140d58033a9ce558fe6f1_Grand-And-Sub.png?expiry=1749859200000&hmac=0vFfpiBVofxehgZUaD3PadSz5AQmJcQfunVMM3GYDmM)

Now, imagine you were interested in determining the following:

1. The total number of products sold in the Central region.
2. The total number of office supplies sold in the Southern region.
3. The total number of binders sold across all four regions.

This is where grand totals and subtotals come in!

**Grand totals **and** subtotals** allow the audience to compare the performance of pieces of data within a table to the overall performance. For example, the visualization below is the same table as above, but it includes subtotals for each _Category_, grand totals for each _Region_ (column), and each _Sub-Category_ (row). It also includes the grand totals of the subtotals.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/65sDls3tT6S9QQA9FfuAXA_5e4f7054ff16468c97a2841fbf005af1_Grand-And-Sub-1.png?expiry=1749859200000&hmac=Hc9kct03njEtaowly39nJJUjTNfnOO8a1D2M52gli8I)

Now, consider the three questions stated earlier. Can you use the table above to find the answer?

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/137334ZJR6ests5zpww4gg_d1629ec280c84e8e802954ccfeb75bf1_Grand-And-Sub-2.png?expiry=1749859200000&hmac=PZ4-k_20gqETUDVImSFr-GecSQGWrwCxfh0Ir9zDAiw)

1. The total number of products sold in the Central region: **8,780**
2. The total number of office supplies sold in the Southern region: **3,800**
3. The total number of binders sold across all four regions: **5,974**

As you can see, having those subtotals and grand totals makes answering these types of questions much easier. So, how do you add totals to your data visualizations?

# Adding Grand Totals and Subtotals to a Table

You are encouraged to participate in this lesson. To do so, please observe the following GIF for guidance on arranging your table.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/XV6V6a61QvG3sLx3A9Oezw_868b33fe3211481fb11797dd8e74eff1_Grand-And-Sub.1.gif?expiry=1749859200000&hmac=6DJELmvTb745wenTRGG_Qkz-L9-3AdYyrlM8rCbVjQI)

Let's get started adding totals to the table. There are a couple of ways to do this.

**OPTION 1**

1. Click the "Analytics" tab in the sidebar.
2. Drag _Totals_ to your table. As you drag it over, you'll see three options:
   1. Subtotals
   2. Column Grand Totals
   3. Row Grand Totals
3. Drop "Totals" into the option you would like.
4. Repeat these steps if you would like additional totals.

The image below shows where you will find the items in the steps above.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/HQ4OKohvQWO4OJt9NrJlQg_d3e20349b73147629158808a22c1c5f1_Grand-And-Sub-3.png?expiry=1749859200000&hmac=Z6lJcafblaL6O1Zvvc4edhW0m3gRVF9VD2x6rxTNtfw)

To see option 1 in action, watch the following GIF:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/mMO8K0r5Q26XNQhZ8ubvNA_4f50787f98234baca05a0233006ce5f1_Grand-and-Sub-1.1.gif?expiry=1749859200000&hmac=16pZyCXN14meQ61VS-NkhyxwBQGKISRalP6eFkSP_Qk)

**OPTION 2**

1. Click the "Totals" icon in the top toolbar.
2. Select which option(s) you would like. The three options that were selected for the table above are highlighted in the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/1SzZUh0cQ0yzfPzOmE6r2w_f36f8c82be5e4117a3d1a2ae28931bf1_Grand-And-Sub-4.png?expiry=1749859200000&hmac=-aaGmIQuTzLkWyTwnBEFcjUrC3ySC_qXPOR-WIwaJQA)

To see option 2 in action, watch the following GIF:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/DmdNVYZyQx6HBOeiP6TdLw_3050bba4a82d4e3e8ac3d3ca211c0af1_Grand-and-Sub-2.1.gif?expiry=1749859200000&hmac=2iHqa5AhwGYWTiKQJhmEMkcThFaybJfHY6bATnS2tnc)

# Statistics Cheat Sheet

Review these concepts from the external modules in the previous lesson items. At the bottom of this item, there will be a link to download this file so you can use it as you continue progressing through the certificate.

# Statistics Cheat Sheet

## Variable Types

**Discrete**: A range of numbers that are countable or are not infinite. For example, the number of children in a home.

**Continuous**: A range of numbers that is infinitely small or exists unbroken in their range. For example, time gets infinitely smaller: even between 1.64 seconds and 1.65 seconds, there are infinite values, like 1.642378765.

## Distributions

**Frequency distributions:** The spread of data based on the count (frequency) of different groups in the data. For example, counts of candy colors in a kid’s Halloween candy bag.

**Proportion distributions:** The spread of data based on the proportion (or percentage) of the total number of rows in the data. For example, the proportions of candy that are certain colors in a kid’s Halloween candy bag.

**Bin:** An interval that data falls into across its entire range of values. For example, test scores out of 100 could be binned by 10 points for each letter score: 90-100 for an A, 80-89 for a B and so on.

**Symmetrical distribution:** A distribution of data that has a mean equal to its median and the same shape on either side of its center. If you folded this data in half vertically, both sides would overlap with each other.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/WhxNYmTERx21Z3-l5HJP9A_13f8d3b7387e44b0adaafef17e41eff1_Qos6ox9KHJF9TK11Sl0hsxN5X4ePAKXEqUgfD1AzE3XBw4X7-kCaWtrLn5cORrzuVfil1eJvfu1c4P1M480vA2x4VkdGua4R5LXAKh9srYxAN2P0m6XNmIXxnAKSbFHvXbLJmhvhqcOyO3DbTcnBEPU?expiry=1749859200000&hmac=jSo3r96vQ7T5HifXa0mUd_tl3UjI-PKB1Mt0w5pCKfw)

**Right-skewed (positively skewed) distribution: **A distribution of data that has a mean larger than the median. It has a tail of data that stretches to the right. Most of the data falls on the left side of its interval.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/A32HUgSSTF2re5xRm3av4w_ee0d153130a54b5a8367826cf48f41f1_6UGyg-wFaPywon1dJ3K95uuqrytSU95eAiUYCMpzgukQzSUBahpNvmtWflFEeK2_SQC5cj1_7Nc9Q63PeWAxk6o534-oIDUDnOphOQBw4Mg7_Q5gH76B-ED1x10S660DBa2aZoJnSURSphqqm0YoJMI?expiry=1749859200000&hmac=qkY5TPIJI3d4aqok43pBZ_L-dDBHrZgNqmWBUZVOPUA)

**Left-skewed (negatively skewed) distribution: **A distribution of data that has a mean smaller than the median. It has a tail of data that stretches to the left. Most of the data falls on the right side of its interval.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/AsN-eL9oQEu4Lk0V2nIINw_ce53952c0af6455181caa6b93d52fef1_rezblIcl89t2MbI6rverPXwlVYTgFmfWrRBpOHkb08OlWCrRaCNdsgaiPHHU46QjVmJBZhaopznQ5WEK-ulJIxmarYt5gAiwSRz_wr5u6CO3ZdBUBLowiNMQ5oCYuo9Hny2gz5L73zWgMT8rbsUE240?expiry=1749859200000&hmac=PEra3rjxFvJnvWTY5kkLYBR2xxTaoJiQwSZMNLnZ6zo)

**Normal distribution:** A distribution of data that has a shape like a bell. It is symmetric (the mean equals the median). There are expectations for the standard deviations around the mean, as well — depicted below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ShmHAWRXS0CvVVprZFme9A_c416efaf3d5a42b7ab4111190de1f8f1_6Cx7iMq9uyRbudUtFXg0Z7J0ErGqAbZY2JL-AmNpEsJEVKuUec8T-_Ujt1NtR7IAAF3wsoCf8Uy12G09SXsUO0vEdnpoL-mUPfFCh1Rvx5t4GvEZfZ1MdYqPLi67k53BezNWLPXtx6LDULusWN4yfMU?expiry=1749859200000&hmac=mWxzRa5XsPMeEJ9h7Cf_WqWXAURySVYDLQ9AWxJ02zE)

## Measures in Datasets

**Mean: **The sum of a group of numbers divided by their count. For example, [2, 3, 3, 4] becomes (2+3+3+4)/4=3.

**Variance:** The spread of the data. It is calculated by finding the sum of the squared distance from the mean of all data points divided by the number of data points.

**Standard deviation:** The square root of the variance. Standard deviation is useful in hypothesis testing for defining ranges of expectation for how frequently the population mean would fall in a sample if samples were repeatedly taken.

## Visualizations

**Histogram:** A chart that groups continuous values into different groups (known as bins) to show the distribution of numerical data. It is useful for seeing the “shape” of the data.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/-QCgfCBjR1CW_P3cUdHUIw_0318b28e85644c5ba767de80030900f1_BsOsjr3syImD9nb9YhMxnHZIZIchT9ND6M37YCrgbj8gzTV7icmOgoq1oMuRLtCSGikd2g94yqn0NmnQF0fu9CeWB4p9PKM6u4XSim8-s7IuraPLj28cYb6-j6dzCuUXxz0gEdCadP_wLaC_ltvdHcE?expiry=1749859200000&hmac=txBdkIFVkH2MizdzYkBD8e9QfMyM-X1y9cirQNgeVFY)

**Box plot:** A graph that displays a distribution based on five measures. The five measures are the maximum and the minimum as well as the 25th, 50th (the median), and 75th percentiles. It is useful for understanding where most of the data falls across the five measures and for spotting outliers.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/LYw-ELQeTYWTvTzrx0KaNA_bcf2002dc8584c5bab1423af7c236df1_p33bBjooN8eadzqTtSPpTsIVNlDrBITdB0x8So25quGwi4mbiHIcz9nJrFE_1diBJaHfOHIBIaId46QBpgoK0jVqCM-E-4Px9yiNtY49G7aB3VCbx3tBdBt4jJYucTIdwW6jsm7KP6pt97H_sInTSlg?expiry=1749859200000&hmac=1lYe8-SxW0gHm0vdqIyQ0pxukVPo565IexmoIzKxTdM)

## Hypothesis Testing

**Confidence interval:** The interval contains a population mean for a certain proportion of the time when performing repeated sampling. When using a 95% confidence interval, it would be expected that 95% of all intervals in the data will include the population mean (not sample mean).

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Oob1hujFQSe5KKH6OW2M5A_070c7f4c6617419c897c7c72db9fb5f1_78f73945cf6d7dd19705dcbb5bf117ef_0-db-6-bcef-3-f-54-4825-a-76-b-466-a-89960-ba-8.png?expiry=1749859200000&hmac=cRqsBGSWB3RQcSqE7OLCq3Ch5ONdJkssiEz1Bo-fPJU)

**Hypothesis test:** A statistical test to determine if there is enough evidence in sample data to draw conclusions about a population.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/E0H2uzA_TyyDeHNpRp1z9g_e636750778314f6d860c57a653866cf1_cd9e662e01c23b6a6d77241ef5a69270_16-e-22757-fba-0-4-d-63-815-c-9-e-8687-f-82-b-22.png?expiry=1749859200000&hmac=IJlNdKkTea2DWv--O3Py87qmsE5bJYrLT0yZ8ZUyIXk)

**Null hypothesis:** The hypothesis that there is no difference between the population estimates being compared. The null hypothesis is never accepted, but the hypothesis test can "reject" or "fail to reject" the null depending on the evidence.

**Alternative hypothesis: **The hypothesis that there is a difference between the population estimates being compared. A hypothesis test looks to support an alternative hypothesis but never confirms it.

**p-value: **The likelihood that the null hypothesis is true from 0 to 1. This value determines whether we reject the null hypothesis or fail to reject the null hypothesis. The p-value never proves one hypothesis over another — it only supports one and not the other.

[Here is the link to download the Statistics Cheat Sheet](https://docs.google.com/document/d/1LRsg0qSvt7RW5VkpGMM5_4VfAiVjRvPVL9hVR9bxdZc/edit?usp=sharing "Statistics Cheat Sheet in Google Docs"). Feel free to download it for your records. You can do this by going to "File" (in the top-left of the document), then "Download." Select the file type you'd like to download and save.

# Histograms

A **histogram** is a chart that groups continuous values into different groups (known as bins) to show the distribution of numerical data. While they look similar to bar charts, histograms serve a distinct purpose. Histograms are univariate visualizations, meaning they only plot one numerical field. This allows you to see the frequency of occurrences within the field, which helps you understand the probability of data within that numerical field. When a histogram is created, a dimension called a bin is created, which is used within the visual. Bins describe a consistent value range that data is sorted into to form groups. For example, in the following visual, a histogram has been created to show the distribution of the number of products purchased per Superstore visit.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/0EfwhpPSSiKL8oYAJH4fWg_18a197f2f4bb4b49b88ccee3480c1af1_Histogram187bin.png?expiry=1749859200000&hmac=HKTbs4ZMhNwMbCE-HBSR73IbPov34Hi3A6wXD3oufhQ)

By default, Tableau decided to set the bin size to 1.83, meaning that the first bin represents the number of orders that contained between 0 and 1.83 products purchased — which you can see is about 900. The second bin represents the number of orders that contained between 1.83 and 3.66 products purchased, which is about 4,800, and so on.

Of course, this bin size doesn't make very much sense, considering you can't order a portion of a product. A better bin size would be a whole number, such as 2. Now consider the same data, but with a bin size of 2.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/h3opIAx3RCyGeO5pIanoow_e3539c1e3b574e33b24829dc9af4cef1_Histogram2bin.png?expiry=1749859200000&hmac=dlB39UWQlEdBGwIpz3KpDDOPPxIAgAIp27tY_EZemzU)

This is much easier to interpret. For example, you can see that:

- About 900 orders are in the first bin and consist of 0 to 2 products;
- About 4,800 orders are in the second bin and consist of 2 to 4 products; etc.

One very important question you should be able to answer is: If a customer ordered 2 products, is that reflected in the first bin or the second bin? Similarly, if a customer ordered 8 products, for example, is that reflected in the fourth bin or the fifth bin?

In histograms, values on the left side of the bin are inclusive, whereas values on the right are exclusive. This means that:

- About 900 orders consisted of 0 or 1 product;
- About 4,800 orders consisted of 2 or 3 products; etc.

The only exception is the last bin. Both the left and right values are inclusive. In the histogram above, the final bin represents the number of orders containing 14, 15, or 16 products.

To interpret a histogram, you should be aware of skewness. **Skewness **is the measure of symmetry or asymmetry of a distribution. Distributions are typically classified as left-skewed, right-skewed, or balanced:

- **Left skewed (negatively skewed):** If the histogram's tail (the part that stretches out) is longer on the left side, it's left skewed. Another way to think about it is if there are more bins on the left side of the peak, then it's left skewed.
- **Right skewed (positively skewed):** If the tail is longer on the right side, it's right skewed.
- **Balanced (symmetrical):** If the bars are pretty much equal on both sides and the histogram looks like a mirror image, then it's balanced (or symmetrical). This means there's no skewness, and it's centered around a middle value.

Looking at the previous histogram, you can see that the data is skewed to the right.

A few questions you can answer using histograms are as follows:

- What is the distribution of salaries at the company?
- What is the distribution of product costs?
- What is the distribution of the Superstore sales?

For each of these questions, you are only comparing one numeric variable.

# How to Build a Histogram

To create a histogram in Tableau, you'll need 1 **measure**.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/8eE4xNtPQw6zx6mxAuCZkg_64267a39013749b4a1cc3c011246ddf1_hist.png?expiry=1749859200000&hmac=bdmFLJLGjznrCB2ScURnODrTJ3XyBIRfDTDcQD4YSYg)

Histograms are one of the more straightforward visualizations to create because a histogram is made up of only one measure, as shown above. Notice that the fine print that says "Creates a bin field." The bin field is used to create the size of the bins. You will be able to adjust the bin size later on if you wish.

You will now learn how to create the following histogram in Tableau using the Superstore dataset. It will show the different amounts of products people buy when they go to the store — for example, how many times people bought just 1 item, 2 items, and so on.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/lEBxgnhnQUu3zk7RpIVnpg_0dfc1740932e4915bccc6cca53e0c5f1_h3opIAx3RCyGeO5pIanoow_e3539c1e3b574e33b24829dc9af4cef1_Histogram2bin.png?expiry=1749859200000&hmac=PxUO3ILe8InyWoM7NsnLuSZ4z5Bvkh8bneqILsVnsbw)

## Creating a Histogram from the "Show Me" Menu

To create this histogram, you would select _Quantity_ from the data pane on the left, then open the Show Me menu and select the histogram option from the dropdown. See the GIF below to follow along with these steps.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/uwkEej73RR2CwlY3bzpGWg_88885fb5c1d44bd0bff3f42d1d2e97f1_histo.gif?expiry=1749859200000&hmac=OnWUepIjydjD__mCtSjivxLa3rKIKOItVrlBKVETONs)

When you click the histogram icon in Tableau, you will immediately have a detailed chart appear on your screen. The Columns shelf will be populated by the *Quantity (bin) *dimension, which break down the continuous range of quantity data into intervals. The Rows shelf will be populated by the *CNT(Quantity) *measure, which shows the number of orders that had a particular number of items.

Notice that after creating a histogram, you'll see the newly created _Quantity (bin)_ dimension listed in the Data pane (see the image below).

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/I5sVhb3WRBK0ceMvImorGg_16b6508f03e646f685d30f044f2459f1_Histogram187binnewfieldcallout.png?expiry=1749859200000&hmac=CwCHhfGkfe7T4H_9uE4y_GNbT6oEw44oBOL7luKjKTU)

Of course, this bin size doesn't make very much sense, considering you can't order a portion of a product. A better bin size would be a whole number, such as 2. To edit the bin size follow these steps:

1. Right-click the new *Quantity (bin) *field and select "Edit..."
2. Set the size of bins to 2.
3. Exit the "Edit Bins" menu by clicking the "X" in the top-right corner.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/g8uuHYC3ScmYUHFvG_3GbA_2512a7d4190a4a82acb629ac05f151f1_bin-size.gif?expiry=1749859200000&hmac=Ss0DKVYfY5_kLzRKT4RVx7LAIw8J57w0n5L8ae8r3DY)

## Creating a Histogram from Scratch

Start by creating a new field by right-clicking on the _Quantity_ measure and clicking "Create" → "Bins..." Set the size of the bins to 2, then exit the "Edit Bins" menu by clicking the "X" in the top-right corner.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/qxkyeno8STq5lLeWW74-OA_e0c56b9dc53040d38a2dedd67ff388f1_Nov-07-2023-18-35-42.gif?expiry=1749859200000&hmac=zetDADl6F5yWwPVZUJBLODQF2GDse3RODodnKEvSK_U)

Drag the newly created _Quantity (bin)_ dimension to the Columns shelf and the _Quantity_ measure to the Rows shelf. By default, the _Quantity_ measure is aggregated using the SUM function. You will want a count of the quantities, so right-click the *SUM(Quantity) *pill in the Rows shelf and select "Measure" → "Count." To remove the gaps between the vertical bars, convert the _Quantity (bin)_ dimension from discrete to continuous by right-clicking the _Quantity (bin_) pill in the Columns shelf and selecting "Continuous."

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/8_U1KJ_bTmOgH88YLfBusQ_1cf8ba5c20a0449b85fb9fe1a9c2bcf1_Nov-07-2023-18-40-46.gif?expiry=1749859200000&hmac=-sL2n3tn0_bX-pC6prXvjqqL1yCJQwEhzf7dVjXx1Hk)

Histograms are great at showing the distribution of data, allowing you to really dive into the measures and find trends.

# Histogram Design

## Histogram Dos and Don'ts

**DO:**

- **Choose the right bin size:** The bin size should represent the data. Bin size should reflect the data granularity and the purpose of the analysis. Too many bins can make the histogram look noisy, and too few can oversimplify the data. For example, if the histogram in the previous item only had 2 bins, you would not get much insight into how many items customers usually get per visit, as most of the variation occurs between 0-8 items.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/uLgALOLIRJm_vaKh9a_J9g_6ddf255371a547a1aad6b2d33931b4f1_Screen-Shot-2023-11-07-at-7.43.07-PM.png?expiry=1749859200000&hmac=KSX8IQGESxi4vk5FubNZ9IXjR83GbCRNeI-GOOw9T90)

- **Consider the shape and distribution**: In a histogram, the shape and distribution of the data provide insightful information about the overall characteristics of the dataset. A symmetrical histogram suggests a balanced distribution, while skewed histograms have a prevalence of values on one side, suggesting a negatively or positively skewed distribution. The spread of the bars shows how much variation exists: a widespread means more variability, while a narrow spread suggests more uniformity.

**DON'T:**

- **Use inconsistent intervals**: Using intervals of different sizes in a histogram can distort the way the data is represented. Consistent intervals are important because they ensure that each bar has the same width and that the frequency of data within each bin is comparable. Note that, by default, Tableau will set your histogram up with consistent variables.
- **Include too many bins**: Too many bins can overcomplicate a histogram and make it difficult to discern the overall trends and patterns in the data. The goal of a histogram is to simplify the complexity of the data by grouping similar values, and if there are too many intervals, the visualization becomes cluttered and less informative.
- **Leave gaps for continuous data**: When working with continuous data, the bins in a histogram should have no gaps between them. This is because the data points are part of a continuum and the histogram should visually represent that continuity so as to not confuse the viewer and create a visual separation.
- **Forget to try different bin counts**: The initial generated bin count might not always be the best one for revealing the distribution of the data. It's important to try out different bin counts to ensure that the histogram accurately reflects the data's structure. This will involve adjusting the bin width to group the data differently and highlight various aspects of the data's distribution.

# Box Plots

**Box plots**, also known as box-and-whisker plots, are visualizations that show a statistical summary of selected data. The statistical summary is made up of five values: the data's minimum, maximum, median, first quartile, and third quartile. Box plots give a quick overview of the data within a field, which can be useful for explaining your analysis.

Below is a box plot describing the *Profit *of each _Sub-Category_. Within the box plot, *Profit *is plotted onto the x-axis, and each individual dot represents the _Profit_ for the* Sub-Category*.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/mY4x20NeRqu8YjN3yoQrCw_f734b186621e47b9924ac8473aab15f1_Southern-Regional-Profit-by-Sub-Category.png?expiry=1749859200000&hmac=yksM2dB1cYvoAwFthsI1nGoOzCKQYPQgvny4lnqGnr4)

A box plot provides a summary of the following values:

- **Minimum:** The smallest value in the dataset.
- **Maximum:** The largest value in the dataset.
- **Lower Whisker:** The smallest value within the dataset that falls within an _acceptable range_, typically within 1.5 times the interquartile range (IQR) below the first quartile (Q1). If the value falls out of this range, it will be considered a potential outlier. This is marked by the leftmost horizontal line (or whisker) that extends from the main box.
- **Upper Whisker:** The largest value within the dataset that falls within an _acceptable range_, typically within 1.5 times the interquartile range (IQR) above the third quartile (Q3). If the value falls out of this range, it will be considered a potential outlier. This is marked by the rightmost horizontal line (or whisker) extending from the main box.
- **Quartiles:** Numbers that divide the values in your dataset, when put into a list from least to greatest, into four equal quarters.
  - **Lower Hinge / First quartile (Q1):** The value that separates the first 25% of your dataset from the next 25%. The first quartile can be found by finding the middle value between your minimum and median values. This is the left edge of the box on the darker gray side.
  - **Median (Q2)**: The middle value within your dataset. The median is also known as the second quartile. It separates the first 50% of your data from the second 50%. This value is indicated by the middle line inside the box, which is also the dividing line between the light and dark gray shaded boxes.
  - **Upper Hinge / Third quartile (Q3)**: The value that separates the last 25% of your dataset from the second-to-last quarter. The third quartile can be found by finding the middle value between the median and the maximum values. This is the right edge of the box on the lighter gray side.
- **Interquartile range (IQR).** The interquartile range, or IQR, is composed of the middle 50% of your dataset. This includes any values that fall between Q1 and Q3. This is shown on the box plot as the entire gray shaded area (both shades of gray).

In a box plot, the **whiskers** serve to illustrate the spread of the majority of the data. These whiskers typically extend from each quartile to the minimum and maximum values within a set range, which is often 1.5 times the interquartile range (IQR) from the first and third quartiles. While this range is commonly used, it can be adjusted to better suit the analyst's specific requirements or the nature of the data.

Additionally, it's important to understand that these 'minimum' and 'maximum' points are not the absolute lowest and highest values in the dataset, but rather the furthest points within the 1.5 times IQR limit. Data points that lie beyond this threshold are considered potential **outliers**. These potential outliers represent values that are significantly lower or higher than the bulk of the data. Any potential outliers will appear as floating dots above or below the whiskers, as shown in the image below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/4Y1e1BY7TNy5O-XQybLHXA_8c81947ad69247dfa18e48b3affab3f1_Screen-Shot-2023-11-13-at-12.07.54-PM.png?expiry=1749859200000&hmac=yp0I_SyiTzSaar5v_V7DQze74V--jQiW6z4ak0fs0U0)

By including both whiskers and outliers, box plots provide a comprehensive view of the data's distribution, emphasizing its overall range and possible anomalies.

A few questions you can use a box plot to answer include the following:

- What is the distribution of waiting times for customers at different service counters?
- How do the ages of participants differ across different categories of a survey?
- What is the variability in monthly sales for different products in a retail store?

# How to Build a Box Plot

To create a box plot in Tableau, you'll need 0 or more **dimensions **and 1 or more **measures**.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Z7b9rcwUTtmzSKeUfpxyJA_d2ed47510f9941d8971ff27bfa6440f1_box.png?expiry=1749859200000&hmac=ASBjwP0v3OQ5MjPPUJCdh3Uoa1oW5IQX-nLoy-Ifyf8)

You will learn how to create the following box plot in Tableau using the Superstore dataset. It will show the distribution of profit across different sub-categories of products.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/7ECWWWEjR-eVxbbZBFBNcw_faec89f5d6c64106be382b0b65e9d5f1_Screen-Shot-2023-11-09-at-4.15.19-PM.png?expiry=1749859200000&hmac=1nMlUDoSN0D_zCQhPzYKKGqNgM8zIY-rigdDrcA4fJs)

## Creating a Box Plot from the "Show Me" Menu

The box plot from above can be built by following these steps:

1. Select the _Profit_ and _Sub-Category_ fields.
2. Click the Show Me menu and select the box-and-whisker plot option.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/9ARdgH77QK2GVM9BiBrIGQ_b7dc758ff6c747a9a85120fd558364f1_Nov-09-2023-15-35-59.gif?expiry=1749859200000&hmac=S9PddEyYulsygdyG29ddku_frIMtOUUP2mxgn5S_u9s)

As with other visualizations, the box plot can be customized. For example, you can change it from a vertical box plot to a horizontal box plot and adjust the height/width.

1. Press the "Swap the Rows and Columns" button. Alternatively, you can manually move the _SUM(Profit)_ pill from the Rows shelf to the Columns shelf. (The GIF below shows both of these approaches.)
2. Drag the bottom part of the box plot down to increase the height.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/dlXreE03T6K0wc9iDdlkvA_1fa8fa246c744f35b2648cfada01acf1_Nov-09-2023-15-39-54.gif?expiry=1749859200000&hmac=MQ4KLvjcs-f5wT2Tt27TqOeZFFvSxQnzanfNZn6odZA)

And you have yourself a beautiful box plot! You can get additional information about your data by hovering over certain details of the graph. If you hover your mouse the blue dots, you will see which subcategory the dot represents:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Vjkhsy3lT2KtMHiarhXrgw_bff4445eaaff488488aa76adcc908ff1_Screen-Shot-2023-11-09-at-3.41.47-PM.png?expiry=1749859200000&hmac=kQoLm5I6riMh8g9LOUJJQIumOxF_6Hj91zS98RMsQPg)

If you hover your mouse over the middle box, you will be able to see all the statistical summary of your selected data:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/lN4vXRarTduwMk8ZCBaboA_edac5e67250a4308a766dee7431f17f1_Screen-Shot-2023-11-09-at-3.43.06-PM.png?expiry=1749859200000&hmac=vb3VduBROocyVOjqjVBpCvDkNCd9mES7JAoWFe6pBhU)

## Creating a Box Plot from Scratch

In addition to using the Show Me menu, you can also create a box plot without using this tool. To do so, complete the following steps:

1. Drag the _Profit_ measure to the Columns shelf.
2. Since this visualization is meant to show the _Profit_ by _Sub-Category_, drag _Sub-Category_ to the Detail tile in the Marks card.
3. The box plot should consist of circles, so change the mark type to a Circle.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/tpSDUMy9S4u0gsRU2MJs0A_46a3e8dd53094216a4ef539eb15558f1_Nov-09-2023-16-58-55.gif?expiry=1749859200000&hmac=rQUzwAR_retZI0NmmgtQ8uI0B--5GIKlsQBhUNswfU8)

- To add the lines and shading, click on the Analytics tab and drag "Box Plot" to the data visualizer and drop it on the "Add a Box Plot" option.
- Increase the height of the rectangle by dragging the bottom down.
- Dragging the bottom down resulted in larger circles. To reduce the size, click on the Size property in the Marks card and change the value on the slider.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/hU87-u2VR6imuUpVFS7R7Q_dcd55c9ee51a4ea29b26141e0d5ec5f1_Nov-09-2023-17-05-50.gif?expiry=1749859200000&hmac=_gxB0bkpaUGRP6rMOd56HZlELV9NmPzQ5bgkNeumBXk)

Box plots are a great tool to give your audience a quick summary of how your dataset behaves. You should use box plots when you'd like to explain your data using one or more of the statistically created summative numbers.

# Box Plot Design

## Box Plot Dos and Don'ts

**DO:**

- **Use the right data**: Box plots are most effective for comparing the distributions of a continuous variable across different categories or groups. The primary variable you're plotting should be continuous, while the category being compared should be discrete. This will allow for a clear and meaningful comparison between the different groups.
- **Include and explain outliers**: Outliers are typically defined as data points that lie beyond the whiskers, which extend to 1.5 times the interquartile range (IQR) from the quartiles. Tableau automatically identifies outliers and places them outside of the box and whiskers. In the example below, the box plot displays the distribution of monthly profit at a restaurant. There is an outlier of $83K that represents the profit for August, during which time the restaurant was closed for renovations. Explaining such outliers provides essential context, revealing specific circumstances behind unusual data points and aiding in accurate interpretation.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/CdT4wje-Q5CWzwoQ2Js6KQ_a861aa2abc234b22b0335293043690f1_Screen-Shot-2023-11-10-at-12.05.11-AM.png?expiry=1749859200000&hmac=X-W_aYsGQSiOJr9LENwe9TBlf8yYpG3b2pJbzQ_14Qk)

- **Use annotations**: Annotations can add valuable context to the data points in a box plot, helping to explain why certain data points are outliers or highlighting key statistics. By providing additional information, annotations can make the box plot more informative and easier for the audience to understand. For example, an annotation could be added to the above graph to explain why the outlier is outside of the whiskers.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/-ZEnh3C8SUCVRDVl7fmTjQ_3c26b038e48248e8a6483cecfbb137f1_Screen-Shot-2023-11-10-at-12.18.05-AM.png?expiry=1749859200000&hmac=mqpeqMXTJhVQ61-1sAYaBgBZxHPKgkdoOXYfrMw2Erc)

- **Assess symmetry**: Just like a histogram, a box plot can reveal the skewness of the data. If the median line within the box is not equidistant from the box's edges, it is skewed. A median closer to the lower quartile indicates a right-skewed distribution, whereas a median closer to the upper quartile indicates a left-skewed distribution.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/haX5uJToQVSHRhxAEMr_QA_3c0a67eada914e788c2d02249b219bf1_Screen-Shot-2023-11-13-at-1.25.28-PM.png?expiry=1749859200000&hmac=2xQH23LMSjXCXJEiryNijek56yZmHHP-wXiX3S0KYTk)

**DON'T:**

- **Use for limited data points:** Avoid using box plots if your dataset is too small. Box plots are most effective with a sufficient number of data points to show variations in distribution. With a limited dataset, the quartiles, median, and outliers may not accurately represent the data's spread, leading to misleading interpretations. For very small datasets, consider alternative visualizations such as histograms.
- **Use when measurements are similar:** Do not rely on box plots if the data points are identical or extremely close in value. In such cases, the box plot will lack meaningful variation and fail to provide useful insights. When your data lacks variability, other forms of data summary or visualization might be more suitable to convey the information effectively.
- **Ignore scale**: It is important to choose a scale that accurately reflects the range and variability of your data. If your scale is too zoomed in, differences between data will be over exaggerated. Conversely, if the scale is too wide, the information will be compressed, and important details will be difficult to see. Choose a scale that is appropriate for your data and provide transparency around any changes made.

## Key Takeaways

**What are distributions, and how can their shapes be described?**

A distribution shows all possible data values and the frequency of their occurrence, helping to understand how many times each data value occurs. The shape of a distribution in a histogram can be symmetrical, positively skewed (right skewed), or negatively skewed (left skewed), depending on the spread and balance of data values. In symmetrical distributions, the mean and median are equal and at the center. In positively skewed distributions, the median is less than the mean. In negatively skewed distributions, the median is greater than the mean.

**What are variance and standard deviation, and why is understanding the spread of data important?**

Variance measures how data points vary from the mean, while standard deviation is the measure of the distribution of statistical data, indicating how spread out the data is. To calculate variance, find the differences between each data point and the mean, square these differences, sum them up, and divide by the number of data points. Standard deviation is the square root of the variance. Analyzing the spread of data helps in understanding how data points vary from the mean, informing you about the distribution and variability of the data.

**What is a histogram, and how are values sorted in a histogram?**

A histogram is a statistical bar chart used to show the distribution of numerical data, plotting the frequency of occurrences within one numerical field. When a histogram is created, a dimension called a bin is created, which is used within the visual. Bins describe a consistent value range that data is sorted into to form groups. In histograms, values on the left side of a bin are inclusive, while values on the right are exclusive. The only exception is the last bin, where both left and right values are inclusive.

**What is a box plot, and what kind of questions can it help answer?**

A box plot, also known as a box-and-whisker plot, is a visualization that shows a statistical summary of data, including the minimum, maximum, median, first quartile, and third quartile values. Box plots can help answer questions about the distribution of data, such as waiting times at service counters, age differences in survey participants, and variability in monthly sales across products.

## Key Terms

- **Discrete**: A range of numbers that are countable or are not infinite.
- **Continuous**: A range of numbers that is infinitely small or exists unbroken in their range.
- **Frequency distributions:** The spread of data based on the count (frequency) of different groups in the data.
- **Proportion distributions:** The spread of data based on the proportion (or percentage) of the total number of rows in the data.
- **Symmetrical (balanced) distribution:** A distribution of data that has a mean equal to its median and the same shape on either side of its center.
- **Right-skewed (positively skewed) distribution: **A distribution of data that has a mean larger than the median.
- **Left-skewed (negatively skewed) distribution:** A distribution of data that has a mean smaller than the median.
- **Normal distribution:** A distribution of data that has a shape like a bell. It is symmetric (the mean equals the median).
- **Mean: ** The sum of a group of numbers divided by their count.
- **Variance:** The spread of the data. It is calculated by finding the sum of the squared distance from the mean of all data points divided by the number of data points.
- **Standard deviation:** The square root of the variance.
- **Confidence interval:** The interval contains a population mean for a certain proportion of the time when performing repeated sampling.
- **Hypothesis test:** A statistical test to determine if there is enough evidence in sample data to draw conclusions about a population.
- **Null hypothesis:** The hypothesis that there is no difference between the population estimates being compared.
- **Alternative hypothesis: **The hypothesis that there is a difference between the population estimates being compared.
- **P-value: **The likelihood that the null hypothesis is true from 0 to 1. This value determines whether we reject the null hypothesis or fail to reject the null hypothesis.
- **Histogram:** A chart that groups continuous values into different groups (known as bins) to show the distribution of numerical data.
- **Bin:** An interval that data falls into across its entire range of values.
- **Box plot (or box-and-whisker plot):** A visualizations that show a statistical summary of selected data — the five measures are the minimum and maximum, as well as the 25th, 50th (the median), 75th percentiles.
- **Minimum: **The smallest value within the dataset that falls within an acceptable range, typically within 1.5 times the interquartile range (IQR) below the first quartile (Q1).
- **Maximum:** The largest value within the dataset that falls within an acceptable range, typically within 1.5 times the interquartile range (IQR) above the third quartile (Q3).
- **Median**: The middle value within your dataset. The median is also known as the second quartile. It separates the first 50% of your data from the second 50%.
- **Quartiles: **Numbers that divide the values in your dataset, when put into a list from least to greatest, into four equal quarters.
  - **First quartile (Q1): **The value that separates the first 25% of your dataset from the next 25%. The first quartile can be found by finding the middle value between your minimum and median values.
  - **Third quartile (Q3)**: The value that separates the last 25% of your dataset from the second-to-last quarter. The third quartile can be found by finding the middle value between the median and the maximum values.
- **Interquartile range (IQR)**: The range composed of the middle 50% of your dataset. This include any values that fall between Q1 and Q3.
- **Outliers**: Any values that fall outside of the interquartile range.
- **Whiskers**: The lines that typically extend from each quartile to the minimum and maximum values within a set range, which is often 1.5 times the interquartile range (IQR) from the first and third quartiles.

# Understanding Scatter Plots

A **scatter plot **is a data visualization used to show the relationship between two quantitative variables, or how they correlate. **Correlation** is the relationship between variables. It is important to remember that just because one variable has a relationship with the other variable, that doesn't mean one caused the other.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/7mX5DwK_RkCwXvbWlsAbYw_51fadb710fd148a9ad90daf784e01df1_Scatter-Plots.PNG?expiry=1749859200000&hmac=teMKcEKALfIrEt1hwgMadSxaKWetLbJ6ZJZOXmsW_Lk)

For example, suppose a recent study determined that there is a strong correlation between the consumption of ice cream and the occurrence of sunburns. However, this doesn't mean that eating ice cream _causes_ sunburns. The real cause is that both ice cream consumption and sunburns are more likely to happen on hot, sunny days. The correlation doesn't indicate a direct cause-and-effect relationship between the two.

A scatter plot requires a measure in both the x-axis and y-axis to plot dimensional data points. For example, the following scatter plot shows the _Sales_ and _Profit_ for each _Postal Code_. Each circle represents a single _Postal Code_ and has been placed as follows:

- Horizontally (along the x-axis) based on the respective _Sales_.
- Vertically (along the y-axis) based on its respective _Profit_.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/iOUaDSX0Qgq-FkAHt0niFw_ab422ab8b3a9456a9d2065cd6ee84ef1_Scatter-Plots-1.png?expiry=1749859200000&hmac=y_YQK-dLTZBacYFAmDEsIR6SAFewousIvyb5pVKDGi8)

You can see that there appears to be a general upward trend, meaning the larger the sales, the larger the profit (again, generally speaking).

Scatter plots allow you to hypothesize whether a similar pattern may be followed in the future. If new data were created, you could predict how likely it is that new data points would land close to the trend line.

A few examples of questions you could answer using scatter plots are:

- Does increased advertising spending result in higher product sales?
- What's the relationship between temperature and the number of ice cream cones sold?
- How does age impact the average hours of sleep a person gets?

The questions you can answer with scatter plots always contain two numerical variables and usually a dimension you can plot on the numerically created grid.

## Independent and Dependent Variables

When working with scatter plots, you'll often hear the terms **independent variable** and **dependent variable**.

- **Independent variable**:
  - In data analytics, the independent variable is the variable that you believe may influence or explain changes in the dependent variable.
  - It's often used in regression analysis, where you seek to understand the relationship between the independent variable(s) and the dependent variable.
- **Dependent variable**:
  - The dependent variable in data analytics is the variable you're trying to predict, explain, or understand based on changes in the independent variable(s).
  - It's the outcome or response that you're examining and measuring.

When determining which measure is the independent variable and which measure is the dependent variable, most often, you can simply ask yourself this question: _Which measure depends on the other?_ For example, in the scatter plot above, you see _Sales_ on the x-axis and _Profit_ on the y-axis. Now ask yourself the question: Does _Sales_ depend on _Profit, or_ does _Profit_ depend on _Sales_?

Hopefully, you were able to recognize that _Profit_ depends on _Sales_. This means that:

- _Sales_ is the independent variable (it does not depend on _Profit_) and
- _Profit_ is the dependent variable (it depends on _Sales_).

One reason this is important to understand is that by convention, most often, the independent variable is placed on the x-axis and the dependent variable is placed on the y-axis, as seen in the *Sales *vs._ Profit_ example above. If they are swapped, you risk confusing your audience.

# How to Build a Scatter Plot

To create a scatter plot, you'll need 0 or more **dimensions **and 2 to 4 **measures**.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/uTD7n9znSHOutIsuwtSY0A_6507072630294267ba095df8c3dcd5f1_Scatter-Plots-2.png?expiry=1749859200000&hmac=CeW8D0Z1lZ2jU34JTcPUU82DJiDGDvrlkIKCNW2vY9Y)

## Creating a Scatter Plot from the "Show Me" Menu

To build the scatter plot from the previous lesson, you would do the following:

1. Select the _Sales, Profit_, and _Postal Code_ fields.
2. Click the Show Me menu and select the scatter plot option.

To see these steps in action, review the GIF below:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/FSHoCiFBSam0Bevpr_kHAw_764bc51004ea478eafed9be7de8530f1_Scatter-GIF-1.gif?expiry=1749859200000&hmac=DCEa-VHTm3abU89fkK1eAuTqyZ-EKUTt6czaZmo1Aks)

## Creating a Scatter Plot from Scratch

Now, take some time to consider how to build this visualization from scratch. When you're ready, continue below to check your thought process.

Notice what makes up the horizontal (_Sales_) and vertical (_Profit_) components of this visualization. As a reminder:

- **Columns** are stacked **horizontally** along the **x-axis**.
- **Rows** are stacked **vertically** along the **y-axis**.

With that said, you would do the following:

1. Drag _Sales_ to the Columns shelf.
2. Drag _Profit_ to the Rows shelf.
3. Drag _Postal Code_ to the Details property in the Marks card.
4. If the mark type doesn't change to Shape, then you would click the dropdown and manually change it. Note that the mark type might still be Automatic, but as long as the Shape icon is showing, then it can be left as is.

To see this in action, watch the GIF below:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Lay7iRSPQ32np1jqg6hCwA_884e034ebf434e3cbcb74974127fd2f1_Scatter-GIF-2.gif?expiry=1749859200000&hmac=0iRttp7eg3GEFuqGlg2u0oAIsbXJwydC8xAUTwwGx04)

# Scatter Plot Design

## Scatter Plot Dos and Don'ts

The following insights clarify when and how to deploy trend lines effectively in scatter plots. Don't worry if this doesn't make sense quite yet. It will once you learn about trend lines in a future section.

**DO:**

- **Communicate the removal of outliers:** The rationale behind the removal of any outliers should be clearly explained to the readers.
- **Use trend lines if there is added value:** Trend lines condense all the points into something often more meaningful for audiences — however, only keep them in your visualization if they add value.

**DON'T:**

- **Automatically remove outliers:** Sometimes you will have plotted points that don't match up with your trend line. Don't automatically remove them without careful consideration. There should be a good reason for removing outliers (e.g., it is known that the data point was collected in error).
- **Compare too many trend lines:** The audience can only handle so much information. Avoid overusing trend lines in your scatter plots.
- **Add a trend line without enough data points: **While there is no strict or universally accepted minimum number of data points required to add a trend line, the fewer data points you have, the less meaningful a trend line is. Generally speaking, you should shoot for a minimum of 10-15 data points before considering adding a trend line.

# Understanding Reference Lines

**Reference lines** are straight lines that are either vertical or horizontal and show a comparison between each data point on an axis and the value of the reference line itself. Once a reference line is set, its value remains the same unless the Tableau developer or user redefines it.

To create a reference line, you'll need to use a visualization that uses an axis with a continuous variable. Potential visualizations include bar charts, line graphs, scatter plots, and area charts. The value of the reference line can be set either with a specific number or computed from a chosen statistical calculation, such as the median.

In the example below, the reference line was calculated using the average aggregate function. The reference line allows the audience to see which copier earned more than the average _Profit_ of all the copiers.

![A reference line is added to the bar chart, calculated using the average aggregate function.](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/zkvC9QzqTdujnE8UV4GPug_2c3f2f5e415043b1b109bb98c60ee2f1_Reference-Line-1.png?expiry=1749859200000&hmac=UqqU7WSShM36iDaZO_vcR9s7ccHPRfM2pH4wYYIagIE)

The company's stakeholders can use this comparison to make product or marketing decisions about under- or high-performing products. For example, the company could decide to double down on the marketing campaign for the high-performing copier.

# How to Add a Reference Line

Imagine you just got hired at QuickShip as an analytics consultant. The first task QuickShip gives you is to analyze the five types of envelopes it sells and present the information to the sales team so they can decide which products to discontinue based on profitability.

To compare the five envelopes, you choose to create a bar chart that shows the _Sales_ for the five types of _Envelopes_ QuickShip sells, as shown below.

![Image displaying a bar chart representing sales data for the five types of envelopes sold by QuickShip.](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/3GZd7TE9TUSQCdDPl-2Tmg_4e9c908825da44849596969576c91bf1_Reference-Line-2.png?expiry=1749859200000&hmac=ZJM_AuKELYokgsph4Mvi2n-smf1EftriG45rbHEwHhg)

The sales team has requested that you add an average line so they can compare which envelopes have above- and below-average sales. As depicted in the following GIF, you would select the Analytics tab and drag "Average Line" onto the Table option.

![GIF depicting a user adding an average line to the chart by selecting the Analytics tab and dragging the 'Average Line' onto](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/RcK73w4OSVKHx8Vfq5stJg_4933d3d89f414e1992d5b813e58ea6f1_Average-Reference-Line.gif?expiry=1749859200000&hmac=QLj2uuKSVJqV0_Qt624q3WeOHvQUFU4nS7n2Vl0vgpI)

Now the sales team can quickly visualize the two envelopes that sell more than average and the three underperforming envelopes.

Before you move on, it is essential to know that the Table option from the "Add a Reference Line" menu — used to create the reference line above — is one of three scopes you can choose from, as shown in the following image.

![Image illustrating the selection options for adding a reference line: Table, Pane, or Cell.](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/9BpiosVFS6iVdgNVh91LcA_325d7e1e1cf84f19b788f9a275e9daf1_Reference-Line-3.png?expiry=1749859200000&hmac=LGqUDC9ZS6NVie1nh7EWdt_ScRatlIljWhFmhqKCEtE)

In the context of drag-and-drop analytics, scope can be defined as the span of data considered by an analytic item. These scopes include: Table, Pane, and Cell.

- **Table:** Added once throughout the entire visualization.
- **Pane:** Added once per pane within the visualization.
- **Cell:** Added once per cell within the visualization.

One thing to keep in mind is that these scoping options are not available for every analytics item within the Analytics tab. Items such as Box Plots, Forecasts, Trend Lines, and Totals do not use these scoping options. Don't worry if you're not familiar with these types of analytics techniques just yet. You'll explore what these techniques are and how to use them at a later time.

# Understanding Reference Bands

**Reference bands** are similar to reference lines, but they also use a secondary number and shade the area between the two values. The shaded area can be useful for showing which data points fit within a specific range or area.

In the following scatter plot image, a reference band was created to show which _Sub-Categories_ earn more than $20,000 and less than $40,000 in _Profit_.

![Scatter plot depicting profit and sales of product sub-categories with a reference band highlighting $20k - $40k in profit.](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/pCT4df7aTsuv-pPoPwoneQ_d6ea22ef503b49ffae4accad3fc20ff1_Reference-Bands-1.png?expiry=1749859200000&hmac=xhjuwZicpbHUx6GF58TdgW0dKWf0bBlSqd_itLchX9Y)

Placing the reference band leads the audience directly to the _Sub-Categories_ that meet the band's goals. This helps convey your message more effectively by removing much of the ambiguity and potential for misinterpretation. Business and data analysts can use reference bands to highlight specific areas of data visualizations that are important to the company.

# How to Add a Reference Band

To create the reference band shown in the example in the previous reading, you would take the following steps:

1. Create the initial visualization, which in this case is a scatter plot using the _Sub-Category_ dimension and _Sales_ and _Profit_ measures, as seen below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/fDCMe4EXTV6gMLlk3kEg1g_22d53502312b461c8d5a04460b49edf1_Reference-Bands-2.png?expiry=1749859200000&hmac=n-lhXyAh0XhlswCC2Rito3n0vSuZOUK3fPogo9BAsK0)

2. Click on the Analytics tab.
3. You want to place the band on the _Profit_, so drag "Reference Band" over to the chart and drop it under the Table scope option in the _SUM(Profit)_ row.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/ME-7miPLQFSdshj1c9caEA_37346a34c6164ec5bc698334f6fc19f1_Reference-Bands-3.png?expiry=1749859200000&hmac=wYRJ_7oDjVvqzl_EU3faH2lwlAj5xsX-U2OkRwxLHM4)

4. You'll be presented with the Edit Band interface. In this case, you want to set the "Computation" values to be "Constant" and then enter 20,000 and 40,000 for "Value (From)" and "Value (To)", respectively, as seen below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/BCLVwg_gRMu1ICx_7t2dbg_935a98ee92d9429bb08a6baed27907f1_Reference-Bands-4.png?expiry=1749859200000&hmac=q6Wdbb8o0OmsQBQJqvriXjP21n3y7Cv-ZaY_dX8JXMU)

**Note:** You won't be able to enter the 20,000 and 40,000 values until you first change the "Computation" to "Constant."

Watch the GIF below to see these steps in action:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Jhhhqb33TK6I27bW-8Th2g_e67e290269d14842acab1aba20ee9bf1_Reference-Bands-GIF.gif?expiry=1749859200000&hmac=UVLVczgzY08PZ4hbSHJSuiZp5wdTAEMgHYz1rlThzv4)

It is important to remember that the more you can direct the audience's eyes to the insights you'd like them to see, the better.

# Understanding Distribution Bands

**Distribution bands** are a visual representation of the distribution of data points within a given range or interval. They help users understand the concentration or density of values across a continuous axis, typically used for numerical data. These bands showcase the spread of data by indicating the frequency or density of values within specific ranges.

Distribution bands offer users the flexibility to generate bands either as multiples of a prior aggregate (like 50%, 100%, or 150% of an average) or as lines or bands derived from statistical metrics (such as percentiles, quantiles, and standard deviation). These resulting bands will exhibit varying shades of a selected primary color, representing the intervals between two measures.

In the following scatter plot image, distribution bands were created to show which _Sub-Categories_ are between 25-50%, 50-100%, and 100-150% of the average in terms of _Profit_.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/wTbbXkLsRWy9qwISMc2a9g_8433b9d62b864dcd824d913fa3a24bf1_Distribution-1.PNG?expiry=1749859200000&hmac=S0tqz-fkUUBwlZY3Fseg5SQw2Ub-ErlhxS_N3vlJQe4)

Placing distribution bands within your visualization effectively guides the audience's attention toward _Sub-Categories_ meeting the bands' objectives. This helps streamline the delivery of messages by minimizing ambiguity and potential misinterpretation. Business and data analysts can use reference bands to highlight specific areas of data visualizations that are important to the company.

# How to Add Distribution Bands

Creating distribution bands is similar to creating a reference band. To create the distribution bands shown in the example in the previous reading, you would take the following steps:

1. Start by creating the initial visualization, which in this case is a scatter plot using the _Sub-Category_ dimension and _Sales_ and _Profit_ measures, as seen below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Dr-4BgkJQbqMaqpvxRPZmw_780d0bac4f49464cbf882e9ecde546f1_Reference-Bands-2.png?expiry=1749859200000&hmac=knKxZlMbBqWVchtsWkIi_Egk-bIc5-tn8I1eDPogSh4)

2. Click on the Analytics tab.
3. You want to place the band on the _Profit_, so drag "Distribution Band" over to the chart and drop it under the Table scope option in the _SUM(Profit)_ row.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/th5B1-HQQaC79QfNhPNeTA_bb902a87689147acb1c372b3b4a8e4f1_Distribution-3.PNG?expiry=1749859200000&hmac=Fb7x1kvZDY2-n2RJFBP9k8qr-ACRj9XzP1RLcqQH0nI)

4. You'll be presented with the Edit Distribution interface. In this case, you want to set the value to be "25%,50%,100%,150% of Average", as seen below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/WG8ce5-yQ3ekoTtDCBtHqg_8bd3c47c868443ce87e28b64237ee5f1_Distribution-7.PNG?expiry=1749859200000&hmac=dgLj1K8mTbm306Qw2OtDfe41GP29rxqLOTCNBfL0PHI)

Watch the GIF below to see these steps in action:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/CfOcQr64RNSs2Wk4GKjo7A_42b7150b02594a3c9a1bf33ea405f0f1_Distribution-GIF.gif?expiry=1749859200000&hmac=f4dGHXUpV22zZBQhuf5B9Faubwhov8xbUs2UX5dxEt8)

**Remember:** The more you can direct the audience's eyes to the insights you'd like them to see, the better.

# What Are Trend Lines?

Let's continue exploring analytics features available in Tableau by looking at trend lines.

In Tableau, you don't need to know the function behind the trend lines to create them. However, you do need to understand what a trend line is telling you. **Trend lines** simplify the overall pattern in your data into an easily interpretable visual element. Trend lines are created using statistical functions to help you confirm that trends exist.

There are five types of trend lines you can create in Tableau.

- Linear
- Logarithmic
- Exponential
- Polynomial
- Power

You will only be exploring **linear** trend lines in this lesson. However, it is good to note that the others (all of which are non-linear) are options.

A **linear trend line** is a straight line that best fits a set of data points in a way that represents a linear trend in the data. In order to use a linear trend line, it's important that the data points seem to generally follow a straight-line pattern. If the data points seem to have a more clearly curved pattern, then another type of trend line should be used.

For example, the line graph below seems to show a generally linear trend.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/CLVXN13lRMe6nU82KOJchQ_9163a8904979431f89517bb4659650f1_Trend-Line-1.png?expiry=1749859200000&hmac=sOFLMeG_tLMcYEOXw757MxnffirEPz7TRUZ4bNuGydA)

To visualize this trend, take a look below, where a linear trend line has been added.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/L5EWWfh-SA6tYn08u3a08w_50c7f8e22cae469d8b7855784b217df1_Trend-Line-2.png?expiry=1749859200000&hmac=FJMZ2LV5-no3wR7_yV9RqCOhm53tmDcXDcVpbMOfYQU)

Now you can get a better sense of where the company's *Profit *is heading, on average, and can use that information to plan for the future — as seen in the visualization below where the axes have been extended.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/qHHYXZh9SCatU59wWjkdeQ_332c78a4b8ba4321b0f84fa897b68ff1_Trend-Line-3.png?expiry=1749859200000&hmac=ORANIAzZRAOGkwHjcxX1Uch1tJW2DSMEz4786HXXb0I)

When adding trend lines to visualizations, there are a few considerations and questions you should ask yourself:

- Do I have enough data points? After all, it would be misleading to state there is a "trend" unless there is enough supporting data! Generally speaking, you should aim to have a minimum of 10 to 15 data points to support a meaningful trend.
- Are there any outliers (extreme data points) affecting the trend line? Even a single outlier can have a significant impact on the trend line. Note that you should only remove outliers if there is a justifiable reason (e.g., a non-representative, one-time event causing an anomaly).
- Does the trend line enhance the visualization? If the trend line doesn't provide additional insights or clarify the pattern, then there is no need to add the trend line. Note that it's up to you, as the analyst, to determine whether or not the trend line adds value.

# Trend Lines, Correlation, and Regression

Looking at the scatter plot below, ask yourself: What's the relationship between _Sales_ and _Profit_?

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/Pbz9_fuZQFicJ0CeViFREQ_c625245b0d934243b31724fa0a707cf1_Trend-Line-4.png?expiry=1749859200000&hmac=nKOj9MYk7uuC50h5cxNqEuVMRnNspD14HX3v0UqAikE)

You might note that as _Sales_ increase, _Profit_ seems to follow.

Now, consider the following image, which shows the same scatter plot, but with a trend line added.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/i072ugE9TDm78cTt8V7FQA_b9bf943e498c42f8aca6a33fc35211f1_Trend-Line-5.png?expiry=1749859200000&hmac=8KIFkLv6rcyquWeSlWy5obdbuPdRJIN4UyUbeegTV44)

If you didn't notice the trend before, you are almost certain to notice now! When you add a trend line to a scatter plot, you can more easily visualize the relationship between the variables. While the trend line helps _visualize_ the direction and strength of the relationship between _Sales_ and _Profit_, looking at it alone is not enough to _quantify_ the relationship. This is where the trend line tooltip provides valuable information:

- The first value is the **equation** of the trend line, summarized as Y = mX + b. It quantifies the relationship between your variables and allows you to predict future values.
- The second is the **R-Squared** value. R-Squared is a statistical measure of how the amount of variance (how close the data is to the trend line), and is displayed as a number from 0 to 1. Simply put, it tells you how well the trend line "fits" the data. If the data is perfectly on the line, the r-squared value would be 1.
- The third is the **P-value.** The p-value is used to show the probability of obtaining the desired result and is also displayed as a number between 0 and 1.

As a reminder, correlation is the statistical measure that describes the strength and direction of a relationship between two quantitative variables. Like correlation, a **linear regression **alsodescribesthe direction and strength of the relationship between two numeric variables, but goes a step further. Unlike correlation, a linear regression uses the best-fitting straight line through the points on a scatter plot to predict Y values from X values.

Let's explore how adding a trend line can help you determine the correlation of values on a scatter plot as well as act as a regression line to predict future values.

Trend Lines and Correlation

In order to quantify the correlation of points on a scatter plot, you will need to determine the correlation coefficient, commonly denoted as 'r'. The correlation coefficient ranges from -1 to 1. A value close to 1 implies a strong positive correlation, while a value close to -1 indicates a strong negative correlation. A value around 0 suggests no correlation. You can find your correlation coefficient using one of the three values included in the tooltip, R-squared.

If you know the R-squared value, you can easily calculate the absolute value of the correlation coefficient (r). To determine the value of your correlation coefficient, simply take the square root of the R-squared value. Keep in mind the direction of the trend line, as the correlation coefficient will have the same sign (positive or negative) as the slope of the trend line equation.

In the example above, the R-squared value is about 0.47, meaning if you calculate the square root, you will find that the correlation coefficient is roughly 0.69. The slope of the trend line is positive (moving up and to the right), therefore r = 0.69. If the slope was negative (moving down and to the right) then the r would have been -0.69.

When it comes to determining the strength of the relationship, consider the following classifications from the Trailhead module on correlations:

| r =                                 | Correlation                 |
| ----------------------------------- | --------------------------- |
| 0.90 to 1**_or_**-0.9 to -1         | Very strong correlation     |
| 0.70 to 0.89**_or_**-0.70 to -0.89  | Strong correlation          |
| 0.40 to 0.69**_or -_**0.40 to -0.69 | Modest correlation          |
| 0.20 to 0.39**_or_**-0.20 to -0.39  | Weak correlation            |
| 0 to 0.19**_or_**0 to -0.19         | Very weak or no correlation |

In the example presented earlier, since the correlation coefficient is about 0.69, it would be safe to say that there is a modestly positive correlation between _Sales_ and _Profit_. It is important to note that a perfect correlation (0.99+) is rarely found in data.

## Trend Lines and Regression

While correlation can help you better explain existing relationships, linear regression can be used to predict future values. The trend line in a scatter plot, such as the one shown above, represents the linear regression model. With the equation of this line, you can predict future values of Y (Profit) based on given values of X (Sales). This predictive capability is what sets regression apart from correlation.

In the above example, the equation given in the tooltip is Profit=0.169773∗Sales−164.194**P**r**o**f**i**t**=**0**.**1**6**9**7**7**3**∗**S**a**l**e**s**−**1**6**4**.**1**9**4**P, r, o, f, i, t, equals, 0, point, 169773, times, S, a, l, e, s, minus, 164, point, 194.

Here's what each part of this equation represents:

- **_Profit_**: The dependent variable you are trying to predict.
- **_0.169773_**: The slope of the trend line, which indicates for every dollar increase in Sales, Profit increases by approximately 17 cents.
- **_Sales_**: The independent variable used to predict Profit.
- **_-164.194_**: The y-intercept, suggesting that when _Sales_ are zero, the predicted _Profit_ starts at a negative value, which could imply initial costs.

Using the values from the chart, you can make predictions about _Profit_ based on _Sales_. For example, if you want to predict the _Profit_ for $30,000 in _Sales_, you would calculate it as follows:

Profit = (0.169773 \* $30,000) - 164.194
Profit ≈ $4,929

This calculation predicts that for $30,000 in Sales, the Profit would be approximately $4,929.

While the linear regression model is a great tool for prediction, not all of the data points will perfectly follow this model. The R-Squared value helps us understand this by indicating how much of the data's variation is captured by the trend line. In the above example, the R-squared value in the tooltip is 0.468653, meaning that about 47% of the variance in _Profit_ can be explained by _Sales_, or about 47% of the data "fits" on the trend line. An R-squared value closer to 1 would indicate a better fit.

Remember, that the linear regression model is based on the data range provided. Predictions made outside of the data range (such as $120,000 in _Sales_) would likely be less accurate.

# How to Create a Trend Line

You can add a trend line by navigating to the Analytics tab and dragging "Trend Line" to the data visualizer over the "Linear" option that appears, as seen in the GIF below.

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/0ZUmLJv8RWysgpqW_-Grnw_b64c2dcab68e4b3f93efd44175e63bf1_Trend-Line-1.gif?expiry=1749859200000&hmac=ucD7MjnQDg0ogkYpnhMosuG6vPWcc0Sjq_oFcvEemt8)

Trend lines are powerful tools that allow you to access information from data visualizations that may not have otherwise been readily available.

## Trend Line Tips

- **Watch out for outliers:** Outliers can skew your trend lines into giving non-realistic results. Watch out for outliers and the effect they have on the visualization.
- **Avoid overusing trend lines:** Trend lines are not intended to be added to every visualization. Use them sparingly to add value to the story you are attempting to convey.
- **Avoid using a trend line for small datasets:** The value of a trend line is the ability to aggregate large amounts of data into a predictable line. Trend lines are not as useful for tiny datasets.

# How to Add a Forecast

Imagine the warehouse for the Superstore is working on fine-tuning some of the processes around storage throughout the year. They have asked you to create a data visualization that shows the _Quantity_ of products sold each month. The warehouse plans to use this information to help more accurately forecast shipments and other general logistics that come along with managing a large warehouse.

To do this, you would take the following steps:

1. Drag _Order Date_ to the Columns shelf.
2. Right-click on _Order Date_ in the Columns shelf and select the **continuous** "Month."
3. Drag _Quantity_ to the Rows shelf.
4. Right-click on the graph and select "Forecast" → "Show Forecast."

To see these steps in action, watch the GIF below:

![](https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/4jjaYm3_SYyzvF5_aAE6Ug_d9ba989a2b284c4c9771c353d4b54df1_2023-09-14_13-24-10-1-.gif?expiry=1749859200000&hmac=LwIv4_XUZSFJTU5VjLg-c_vL5oGgJt2SpHBgHap_sGY)

Great! Now the warehouse employees have a better idea of what's coming up and can better prepare themselves.

The analytics team can now review the information to help the warehouse team plan for shipments and the overall utilization of the warehouse's services over the next two years.

## Key Takeaways

**What are scatter plots, and why are they used?**

A scatter plot is a data visualization used to show the relationship between two quantitative variables, or how they correlate. Each point on the scatter plot represents a data pair with one variable on the x-axis and the other on the y-axis. However, it's important to note that correlation in a scatter plot does not imply causation. Scatter plots are particularly useful for visualizing trends and predicting future patterns.

**What is the difference between independent and dependent variables?**

In data analytics, the independent variable is the variable that you believe may influence or explain changes in the dependent variable. You can often manipulate the independent variable for analysis, but it doesn't necessarily imply causation. The dependent variable in data analytics is the variable you're trying to predict, explain, or understand based on changes in the independent variable(s). It's the outcome or response that you're examining and measuring.

**What are reference lines, reference bands, and distribution bands?**

Reference lines are straight lines that are either vertical or horizontal and show a comparison between each data point on an axis and the value of the reference line itself. Once a reference line is set, its value remains the same unless the Tableau developer or user redefines it. Reference bands are similar to reference lines, but they also use a secondary number and shade the area between the two values. The shaded area can be useful for showing which data points fit within a specific range or area. Distribution bands refer to the grouping of data points based on a specified measure or criteria such as percentiles, quantiles, percentages, and standard deviation.

**How do visualizations benefit from trend lines? **

Linear trend lines offer a concise means of identifying data patterns, facilitating comparisons between quantitative variables, and aiding in basic forecasting. They simplify complex data trends for audiences, enabling easier comprehension of overall trends and relationships between variables. It's crucial to note that not all data follows a linear pattern, necessitating consideration of alternative trend line types like exponential or logarithmic for a more accurate representation of relationships within the data.

**What is the difference between trend lines and forecasts?**

Trend lines and forecasts are both tools used to analyze data over time, but they serve different purposes. Trend lines visualize the overall direction of a data series, while forecasts predict future values based on historical data. Trend lines tend to be simpler, but they are useful for identifying and comparing trends. Forecasts are more complex, but they are limited to time-series visualizations.

## Key Terms

- **Scatter plot:** A data visualization used to show the relationship between two quantitative variables, or how they correlate.
- **Correlation:** The relationship between two quantitative variables.
- **Independent variable:** The variable that you believe may influence or explain changes in the dependent variable.
- **Dependent variable:** The variable you're trying to predict, explain, or understand based on changes in the independent variable(s).
- **Analytics:** The process of discovering and interpreting meaning from data.
- **Reference lines:** Straight lines that are either vertical or horizontal and show a comparison between each data point on an axis and the value of the reference line itself.
- **Reference bands:** Similar to reference lines, but they also use a secondary number and shade the area between the two values.
- **Distribution bands:** Visual representations of the distribution of data points within a given range or interval.
- **Trend lines:** simplify the overall pattern in your data into an easily interpretable visual element.
- **Linear trend line:** A straight line that best fits a set of data points in a way that represents a linear trend in the data.
- **R-squared:** A statistical measure of how close the data is to the trend line, and is displayed as a number from 0 to 1.
- **Linear Regression:** Describesthe direction and strength of the relationship between two numeric variables and uses the best-fitting straight line through the points on a scatter plot to predict Y values from X values.
- **Forecast:** A prediction of future data using historical data.
- **Variance:** Measures how data points vary from the mean.
- **Algorithms:** Made up of a sequence of well-defined computational instructions used to process information and are usually created by data scientists and software developers.
- **Trend:** The tendency of your data to follow an increasing or decreasing path.
- **Seasonality:** A pattern in your data that is related to a specific period of time.
  - **Additive seasonality:** A time-series pattern in which seasonal fluctuations or variations remain relatively constant in magnitude regardless of the overall level or trend in the data.
  - **Multiplicative seasonality:** A time-series pattern in which seasonal fluctuations or variations are proportional to the overall level or trend in the data, meaning they increase or decrease with the level of the data.
- **Prediction interval:** A type of confidence interval that describes the probability of a future data point landing within that area.
