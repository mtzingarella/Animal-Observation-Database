USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTotalObservations]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetTotalObservations]
	
	@ScientificName VARCHAR(500)

AS
BEGIN

	SELECT COUNT(*)
	FROM Observations o
	WHERE o.scientific_name LIKE '%' + @ScientificName + '%'
	AND YEAR(CONVERT(date,o.observed_on,101)) BETWEEN 2018 AND 2022



END
GO
