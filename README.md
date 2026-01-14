# Music Survey Analysis

## Table of Contents

* Case Study
* Dataset Description
* Data Cleaning and Transformation
* Data Analysis
* Dashboard

## Case Study
This project explores the relationship between music genre preferences, age groups, and self-reported mental health conditions, including anxiety, depression, OCD, and insomnia.

## Dataset Description
The dataset is based on survey responses and includes:

Age groups: 0–18, 19–25, 26–35, 36–50, 51-65, 66-70 and 71-79

Favorite Genre (most frequently listened to music genre)

Mental health condition levels:

* Low

* Medium

* High

Perceived effect of music on mental health:

* Improves

* No effect

* Worsens

Visualizations were created in Power BI to analyze distributions and comparisons across categories.

## Data Cleaning and Transformation

#### Age Group Column
```
AgeGroup = 
SWITCH(
    TRUE(),
    consumers[Age] <= 18, "Children and Adolescents",
    consumers[Age] <= 30, "Young Adults",
    consumers[Age] <= 45, "Adults",
    consumers[Age] <= 60, "Middle-aged Adults",
    "Seniors"
)
```
#### Anxiety Level
```
Anxiety Level = 
SWITCH(
    TRUE(),
    'survey_results'[Anxiety] <= 3, "1-Low",
    'survey_results'[Anxiety] <= 7, "2-Medium",
    'survey_results'[Anxiety] <= 10, "3-High"
)
```
#### Depression Level Column
```
DepressionLevel = 
SWITCH(
    TRUE(),
    'survey_results'[Depression] <= 3, "1-Low",
    'survey_results'[Depression] <= 7, "2-Medium",
    'survey_results'[Depression] <= 10, "3-High"
)
```
#### Insomnia Level Column
```
InsomniaLevel = 
SWITCH(
    TRUE(),
    'survey_results'[Insomnia] <= 3, "1-Low",
    'survey_results'[Insomnia] <= 7, "2-Medium",
    'survey_results'[Insomnia] <= 10, "3-High"
)
```

#### OCD Level Column
```
OCDLevel = 
SWITCH(
    TRUE(),
    'survey_results'[OCD] <= 3, "1-Low",
    'survey_results'[OCD] <= 7, "2-Medium",
    'survey_results'[OCD] <= 10, "3-High"
)
```
#### Adding Age Group Column
```
= Table.AddColumn(#"Changed Type", "Age Group", each if [Age] <= 18 then "0-18"
else if [Age] <= 25 then "19-25"
else if [Age] <= 35 then "26-35"
else if [Age] <= 50 then "36-50"
else if [Age] <= 65 then "51-65"
else if [Age] <= 70 then "66-70"
else if [Age] <= 79 then "71-79"
else "80-90")
```
## Business &  Analytical Questions
1. How does anxiety levels vary by music genre and age group?
2. Are certain genres associated with higher or lower levels of depression?
3. Is there a relationship between music preference and insomnia severity?
4. Do OCD levels differ significantly by genre?

## Insights
**Distribution of Anxiety Levels by Favorite Music Genre & Age Group**
   * Younger age groups (especially 19–25) show higher counts of medium to high anxiety across genres such as Pop, Rock, Hip Hop, and EDM.

* Genres like Classical, Jazz, and Gospel tend to show higher concentrations of low anxiety levels, particularly in older age groups.

* High-energy genres appear more frequently associated with elevated anxiety levels among younger respondents.


**Distribution of Depression Levels by Favorite Music Genre & Age Group**
* Pop, Rock, Rap, and Hip Hop show higher counts of medium and high depression, especially in the 19–25 and 26–35 age groups.

* Classical and Jazz listeners consistently report lower depression levels across age groups.

* Older age groups show fewer high-depression responses overall.

**Distribution of Insomnia Levels by Favorite Music Genre & Age Group**
* High insomnia levels are most visible among listeners of Pop, Rock, EDM, and Video Game Music.

* Genres such as Lofi, Classical, and Jazz show a stronger presence of low to medium insomnia levels.

* Insomnia appears more prominent in younger age groups regardless of genre.

**Distribution of OCD Levels by Favorite Music Genre & Age Group**
* Medium OCD levels dominate across most genres, indicating consistency rather than extreme variation.

* Higher counts of high OCD levels appear in genres such as Pop, Rock, and EDM, particularly among younger respondents.

* Older age groups report fewer high OCD levels overall.

**Effects of Music on Mental Health**

* The majority of respondents report that music improves their mental health.

* Rock, Pop, Hip Hop, and R&B show the highest counts of perceived improvement.

* A smaller but notable group reports that certain genres worsen their mental health, most often within high-energy or emotionally intense genres.


## Dashboard
