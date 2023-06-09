USE [iNaturalist]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[ImageID] [int] NULL,
	[ImageName] [varchar](50) NULL,
	[MimeType] [varchar](50) NULL,
	[ImageBits] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
