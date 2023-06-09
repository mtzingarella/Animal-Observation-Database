USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetObsByYear]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetObsByYear] 

AS
BEGIN

SELECT YEAR(o.observed_on) AS The_Year, COUNT(*) AS Num_Observations
FROM Observations o
WHERE YEAR(o.observed_on) < 2023
GROUP BY YEAR(o.observed_on)
ORDER BY YEAR(o.observed_on)


END




GO
