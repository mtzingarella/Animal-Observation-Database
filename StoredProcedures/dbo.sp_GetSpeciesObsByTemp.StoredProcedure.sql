USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpeciesObsByTemp]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 	CREATE PROCEDURE [dbo].[sp_GetSpeciesObsByTemp]
    @ScientificName VARCHAR(255)
 
 AS
BEGIN
 
 
SELECT 
    FLOOR(Weather.max_temp / 5) * 5 AS temp_range, 
    COUNT(*) AS observation_count,
    CAST(COUNT(*) AS decimal(10, 4)) / NULLIF(dbo.GetTempStats('WILLIMANTIC WINDHAM AIRPORT  CT US', FLOOR(Weather.max_temp / 5) * 5), 0) AS weighted_observations
FROM 
    Observations
INNER JOIN 
    Weather ON Observations.nearest_station = Weather.station
WHERE 
    Observations.observed_on = Weather.obs_date 
    AND Weather.max_temp BETWEEN 0 AND 100
    AND Observations.scientific_name LIKE '%' + @ScientificName + '%'
    AND YEAR(Observations.observed_on) BETWEEN 2018 AND 2022
GROUP BY 
    FLOOR(Weather.max_temp / 5) * 5
ORDER BY 
    temp_range;




END


GO
