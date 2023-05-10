USE [iNaturalist]
GO
/****** Object:  Table [dbo].[BadDates]    Script Date: 5/10/2023 3:32:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadDates](
	[Month_Day] [varchar](20) NULL,
	[Observations] [int] NULL,
	[Too_Low] [varchar](1) NULL
) ON [PRIMARY]
GO
