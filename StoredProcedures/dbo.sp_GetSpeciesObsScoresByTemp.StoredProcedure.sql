USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpeciesObsScoresByTemp]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetSpeciesObsScoresByTemp]

@ScientificName VARCHAR(255)

AS
BEGIN
--..temp as in temporary...
CREATE TABLE #tempTable(
    temp_range INT,
    obs_score_total DECIMAL(10,5),
    NumDays DECIMAL(10,2),
    weighted_obsscore DECIMAL(10,5)
);


INSERT INTO #tempTable (temp_range, obs_score_total, NumDays)
SELECT FLOOR(Weather.max_temp / 5) * 5 AS temp_range, SUM(o.ObsScore) AS obs_score_total,
    dbo.GetTempStats('WILLIMANTIC WINDHAM AIRPORT  CT US', FLOOR(Weather.max_temp / 5) * 5) AS NumDays
FROM Observations o
INNER JOIN Weather
ON o.nearest_station = Weather.station
WHERE o.observed_on = Weather.obs_date
AND o.scientific_name LIKE '%' + @ScientificName +'%'
AND YEAR(CONVERT(DATE, observed_on, 101)) BETWEEN 2018 AND 2022
GROUP BY FLOOR(Weather.max_temp / 5) * 5
ORDER BY temp_range;

UPDATE #tempTable SET 
    weighted_obsscore = obs_score_total / CAST(NumDays AS DECIMAL(10,5))
WHERE temp_range BETWEEN 0 AND 100;

SELECT * FROM #temptable
ORDER BY temp_range

DROP TABLE #tempTable;

END
GO
