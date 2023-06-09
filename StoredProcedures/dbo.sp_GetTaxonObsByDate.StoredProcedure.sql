USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTaxonObsByDate]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 	CREATE PROCEDURE [dbo].[sp_GetTaxonObsByDate]

    @TaxonName VARCHAR(255)
 
 AS
BEGIN
 
 
 SELECT
    CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2)) as month_day,
    COUNT(*) as num_observations
    FROM
        Observations o
    WHERE
        YEAR(CONVERT(DATE, o.observed_on, 101)) BETWEEN 2018 AND 2022
		AND o.iconic_taxon_name LIKE '%' + @TaxonName + '%'
    GROUP BY
        CONCAT(RIGHT('00' + CONVERT(VARCHAR(2), MONTH(o.observed_on)), 2), '/', RIGHT('00' + CONVERT(VARCHAR(2), DAY(o.observed_on)), 2))
	ORDER BY
		month_day



END
GO
