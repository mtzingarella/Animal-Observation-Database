USE [iNaturalist]
GO
/****** Object:  Table [dbo].[TempStats]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempStats](
	[Temp] [int] NULL,
	[NumDays] [int] NULL,
	[Station] [varchar](500) NULL
) ON [PRIMARY]
GO
