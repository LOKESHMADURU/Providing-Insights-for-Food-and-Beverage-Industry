create database brand_awareness;

use brand_awareness;

-- 1)Demographic Insights 
-- a) Who prefers energy drink more? (male/female/non-binary?)
SELECT 
	Gender, count(*) as 'Total_Gender_Cout'
FROM 
	dim_repondents
INNER JOIN 
	fact_survey_responses
ON 
	dim_repondents.respondent_id = fact_survey_responses.respondent_id
GROUP BY 
	gender;

-- b)Which age group prefers energy drinks more?
SELECT 
	Age, Current_brands, count(*) as 'Total_Energy_Drinks_Preference' 
FROM 
	dim_repondents
INNER JOIN 
	fact_survey_responses
ON
	dim_repondents.respondent_id = fact_survey_responses.respondent_id
GROUP BY
	Age, Current_brands
ORDER BY
	Total_Energy_Drinks_Preference desc;
    
-- c) Which type of marketing reaches the most Youth (15-30)?
SELECT 
	 Marketing_channels, count(*) as 'Total_Counts' 
FROM 
	dim_repondents 
INNER JOIN 
	fact_survey_responses 
ON 
	dim_repondents.respondent_id = fact_survey_responses.respondent_id
WHERE
	Age = "15-18" OR Age = "19-30" 
Group BY
	 Marketing_channels
ORDER BY
	Total_counts DESC;
	
-- 2)Consumer Preferences
-- a) What are the preferred ingredients of energy drinks among respondents?
select 
	Ingredients_expected, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Ingredients_expected
order by
	Total_Counts DESC; 
    
-- b) What packaging preferences do respondents have for energy drinks?
select 
	Packaging_preference, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Packaging_preference
order by
	Total_Counts DESC; 

-- 3) Competition Analysis
-- a) Who are the current market leaders?
select 
	Current_brands, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Current_brands
order by
	Total_Counts DESC;

-- b) What are the primary reasons consumers prefer those brands over ours?
select 
	Current_brands,Consume_reason, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Current_brands, Consume_reason
order by
	Total_Counts DESC;

-- 4) Marketing Channels and Brand Awareness
-- a) Which marketing channel can be used to reach more customers?
select 
	Marketing_channels, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Marketing_channels
order by
	Total_Counts DESC;
    
-- b)How effective are different marketing strategies and channels in reaching our customers?
select 
	Consume_frequency,Marketing_channels, count(*) as "Total_Counts"
from 
	fact_survey_responses
group by 
	Consume_frequency,Marketing_channels
order by
	Total_Counts DESC;

-- 5. Brand Penetration
-- a) What do people think about our brand? (overall rating)
select 
	Current_brands,Brand_perception, count(*) as "Total_Count"
from
	fact_survey_responses
where
	Current_brands = "codeX"
group by
	current_brands,Brand_perception;

select 
	Current_brands,General_perception, count(*) as "Total_Count"
from
	fact_survey_responses
where
	Current_brands = "codeX"
group by
	current_brands,General_perception;

-- b. Which cities do we need to focus more on?
select 
	city, count(*) as "Total_Count"
from 
	dim_repondents
inner join
	fact_survey_responses 
on
	dim_repondents.respondent_id = fact_survey_responses.respondent_id
inner join
	dim_cities
on
	dim_cities.city_id = dim_repondents.city_id
group by
	city 
order by
	Total_Count asc;

-- 6. Purchase Behavior
-- a. Where do respondents prefer to purchase energy drinks?
select
	purchase_location, count(*) as "Total_Count" 
from
	fact_survey_responses
group by
	purchase_location
order by
	Total_Count desc;

-- b. What are the typical consumption situations for energy drinks among respondents?
select
	Typical_consumption_situations, count(*) as "Total_Count"
from
	fact_survey_responses
group by
	Typical_consumption_situations
order by
	Total_Count desc;
    
-- c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
select
	Limited_edition_packaging,Price_range,count(*) as "Total_Count"
from
	fact_survey_responses
group by
	Limited_edition_packaging,Price_range;
    
-- 7. Product Development
-- a. Which area of business should we focus more on our product development? (Branding/taste/availability)
select 
	Current_brands,Reasons_for_choosing_brands,count(*) as "Total_Count"
from
	fact_survey_responses
group by
	Current_brands,Reasons_for_choosing_brands;

