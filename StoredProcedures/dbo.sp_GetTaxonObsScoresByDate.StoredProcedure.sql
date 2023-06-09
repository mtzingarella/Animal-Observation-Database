USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTaxonObsScoresByDate]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTaxonObsScoresByDate]

@TaxonName VARCHAR(255)

AS
BEGIN


SELECT 
    CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) as month_day,
    SUM(o.ObsScore) as total_obs_score
FROM 
    Observations o
WHERE 
    YEAR(o.observed_on) BETWEEN 2018 AND 2022
	AND
	o.iconic_taxon_name LIKE '%' + @TaxonName + '%'
	AND
	CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) NOT IN (
		SELECT month_day FROM BadDates WHERE too_low = 'Y'
	)
GROUP BY 
    CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2))
ORDER BY month_day asc


END
GO
