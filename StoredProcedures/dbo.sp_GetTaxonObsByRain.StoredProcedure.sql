USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTaxonObsByRain]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[sp_GetTaxonObsByRain]

@TaxonName VARCHAR(255)


AS
BEGIN

--Variables used to weigh observations
DECLARE @numDaysRaining int
DECLARE @numDaysNotRaining int
--Willimantic used because raining:not raining ratio was about the same for both stations and it was simpler to use, albeit a little less accurate
SET @numDaysRaining = dbo.getRainStats('WILLIMANTIC WINDHAM AIRPORT  CT US', 'raining')
SET @numDaysNotRaining = dbo.getRainStats('WILLIMANTIC WINDHAM AIRPORT  CT US', 'not raining')

--Creating a temporary table to fill with innerjoined data, which will then be transformed further
CREATE TABLE #temp (
    obs_date date,
    rain decimal(10,4),
    num_observations int
)
--Fill temp table with rainfall vs observation data
INSERT INTO #temp (obs_date, rain, num_observations)
SELECT o.observed_on, w.rain, COUNT(*) as num_observations
FROM Observations o
INNER JOIN Weather w ON o.nearest_station = w.station AND o.observed_on = w.obs_date 
WHERE o.iconic_taxon_name LIKE '%' + @TaxonName + '%'
AND YEAR(CONVERT(DATE, observed_on, 101)) BETWEEN 2018 AND 2022
GROUP BY o.observed_on, w.rain

--Group the data by "above 0.10 inches (raining) or below (not raining/sprinkling). 0.10 inches chosen somewhat arbitrarily
SELECT 
    CASE 
        WHEN rain <= 0.1 THEN 'Below 0.1'
        ELSE 'Above 0.1'
    END AS rainfall_range,
    SUM(num_observations) AS num_observations,
    SUM(CASE 
        WHEN rain > 0.1 THEN CAST(num_observations AS decimal) / CAST(@numDaysRaining AS decimal)
        ELSE CAST(num_observations AS decimal) / CAST(@numDaysNotRaining AS decimal)
    END) AS weighted_observations
FROM #temp
GROUP BY 
    CASE 
        WHEN rain <= 0.1 THEN 'Below 0.1'
        ELSE 'Above 0.1'
    END
ORDER BY 
    rainfall_range ASC

DROP TABLE #temp



END



GO
