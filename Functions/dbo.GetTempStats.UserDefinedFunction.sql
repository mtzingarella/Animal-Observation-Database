USE [iNaturalist]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTempStats]    Script Date: 5/10/2023 3:35:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTempStats]
(
    @StationName VARCHAR(500),
    @Temp INT
)
RETURNS INT
AS
BEGIN
    DECLARE @NumDays INT
    
    SELECT @NumDays = numdays
    FROM TempStats
    WHERE station = @StationName
      AND temp = FLOOR(@Temp / 5.0) * 5
    
    RETURN @NumDays
END
GO
