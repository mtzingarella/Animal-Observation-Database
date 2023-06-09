USE [iNaturalist]
GO
/****** Object:  Table [dbo].[Weather]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weather](
	[station] [varchar](500) NULL,
	[latitude] [varchar](500) NULL,
	[longitude] [varchar](500) NULL,
	[obs_date] [varchar](50) NULL,
	[rain] [varchar](50) NULL,
	[max_temp] [tinyint] NULL,
	[min_temp] [smallint] NULL
) ON [PRIMARY]
GO
