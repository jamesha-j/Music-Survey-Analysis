
---Defining a CTE to calculate the median for ages that are blank
WITH MedianAgeCTE AS (
SELECT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY TRY_CAST(Age AS NUMERIC(10,2))) 
	OVER() AS CalculatedMedian
FROM dbo.survey_results
WHERE Age IS NOT NULL
),
-- Getting the single median value from the CTE
SingleMedian AS (
	SELECT TOP 1 CalculatedMedian FROM MedianAgeCTE
)
-- Update the table where there are ages that are null or empty
UPDATE s
SET Age = CONVERT(VARCHAR,Sm.CalculatedMedian)
FROM dbo.survey_results s
CROSS JOIN SingleMedian sm 
WHERE s.Age IS NULL OR s.Age = '';

--- Renaming Music Effects to MusicEffects
EXEC sp_rename 'dbo.survey_results.[Music effects]', 'MusicEffects', 'COLUMN';

--- Updating blank fields under MusicEffects column to No effect
UPDATE dbo.survey_results
SET MusicEffects = 'No effect'
WHERE MusicEffects  = '';

