USE [iNaturalist]
GO

/****** Object:  StoredProcedure [dbo].[sp_ChangeObsScores]    Script Date: 5/10/2023 3:10:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ChangeObsScores]
AS
BEGIN


--Altering this procedure by changing the 'SET' line then executing will update all ObsScores using the new method

UPDATE Observations
SET ObsScore = 
CASE 
WHEN uoc.num_users < 3 THEN 0 
ELSE ROUND(CAST(1.0 / CAST(uoc.num_users AS decimal(10, 4)) AS decimal(10, 4)), 4)
END
FROM Observations o
INNER JOIN Unique_Obs_Counts uoc ON CONVERT(date, o.observed_on, 101) = uoc.obs_date




END
GO

