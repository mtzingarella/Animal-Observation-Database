USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSpeciesImage]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSpeciesImage]

@ScientificName VARCHAR(200)

AS
BEGIN

SELECT TOP 1 TRIM(o.img_url) as img_url
FROM Observations o
WHERE o.scientific_name LIKE '%' + @ScientificName + '%'
ORDER BY CONVERT(date,o.observed_on,101) DESC


END
GO
