USE [iNaturalist]
GO
/****** Object:  Table [dbo].[RainStats]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RainStats](
	[NumDays_Raining] [int] NULL,
	[NumDays_NotRaining] [int] NULL,
	[Station] [varchar](500) NULL
) ON [PRIMARY]
GO
