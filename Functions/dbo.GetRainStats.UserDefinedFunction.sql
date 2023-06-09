USE [iNaturalist]
GO
/****** Object:  UserDefinedFunction [dbo].[GetRainStats]    Script Date: 5/10/2023 3:35:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetRainStats] (@station varchar(500), @condition varchar(20))
RETURNS int
AS
BEGIN
    DECLARE @result int
    
    IF (@condition = 'raining')
    BEGIN
        SELECT @result = NumDays_Raining
        FROM RainStats
        WHERE Station = @station
    END
    ELSE IF (@condition = 'not raining')
    BEGIN
        SELECT @result = NumDays_NotRaining
        FROM RainStats
        WHERE Station = @station
    END
    ELSE
    BEGIN
        SET @result = -1
    END
    
    RETURN @result
END
GO
