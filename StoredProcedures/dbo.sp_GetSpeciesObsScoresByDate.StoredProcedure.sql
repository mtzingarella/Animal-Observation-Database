USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpeciesObsScoresByDate]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSpeciesObsScoresByDate]

@ScientificName VARCHAR(255)

AS
BEGIN

SELECT 
    CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) as month_day,
    CASE WHEN EXISTS (
        SELECT 1 FROM BadDates WHERE month_day = CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) AND too_low = 'Y'
    ) THEN 0 ELSE SUM(o.ObsScore) END as total_obs_score
FROM 
    Observations o
WHERE 
    YEAR(o.observed_on) BETWEEN 2018 AND 2022
	AND
	o.scientific_name LIKE '%' + @ScientificName + '%'
GROUP BY 
    CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2))
ORDER BY month_day asc


END


GO
