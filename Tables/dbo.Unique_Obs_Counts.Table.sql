USE [iNaturalist]
GO
/****** Object:  Table [dbo].[Unique_Obs_Counts]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unique_Obs_Counts](
	[obs_date] [date] NOT NULL,
	[num_users] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[obs_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
