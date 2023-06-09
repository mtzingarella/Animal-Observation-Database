USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpeciesObsByDate]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 	CREATE PROCEDURE [dbo].[sp_GetSpeciesObsByDate]
    @ScientificName VARCHAR(255)
 
 AS
BEGIN
 
 
 SELECT
        CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) as month_day,
		COUNT(*) as num_observations
    FROM
        Observations o
    WHERE
        YEAR(CONVERT(DATE, o.observed_on, 101)) BETWEEN 2018 AND 2022
		AND
		Scientific_name LIKE '%'+ @ScientificName + '%'
    GROUP BY
        CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2))
	ORDER BY
		month_day



END
GO
