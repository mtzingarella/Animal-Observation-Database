USE [iNaturalist]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetObsByDayOfWeek]    Script Date: 5/10/2023 3:29:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetObsByDayOfWeek] 

AS
BEGIN

SELECT o.Day_of_Week, 
       CASE o.Day_of_Week 
            WHEN 1 THEN 'Sun' 
            WHEN 2 THEN 'Mon' 
            WHEN 3 THEN 'Tue' 
            WHEN 4 THEN 'Wed' 
            WHEN 5 THEN 'Thu' 
            WHEN 6 THEN 'Fri' 
            WHEN 7 THEN 'Sat' 
        END AS Day_String,
       COUNT(*) AS Observations_Made
FROM Observations o
GROUP BY o.Day_of_Week 
ORDER BY o.Day_of_Week ASC

END




GO
