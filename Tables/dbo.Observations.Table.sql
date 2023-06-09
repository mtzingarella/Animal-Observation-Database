USE [iNaturalist]
GO
/****** Object:  Table [dbo].[Observations]    Script Date: 5/10/2023 3:32:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Observations](
	[id] [int] NOT NULL,
	[observed_on] [varchar](500) NULL,
	[iNat_user_id] [varchar](500) NULL,
	[iNat_user_login] [varchar](500) NULL,
	[real_name] [varchar](500) NULL,
	[created_at] [varchar](500) NULL,
	[updated_at] [varchar](500) NULL,
	[quality_grade] [varchar](500) NULL,
	[license] [varchar](500) NULL,
	[iNat_url] [varchar](500) NULL,
	[num_identification_agreements] [varchar](500) NULL,
	[num_identification_disagreements] [varchar](500) NULL,
	[captive_cultivated] [varchar](500) NULL,
	[place_guess] [varchar](500) NULL,
	[latitude] [varchar](500) NULL,
	[longitude] [varchar](500) NULL,
	[coordinates_obscured] [varchar](500) NULL,
	[species_guess] [varchar](500) NULL,
	[scientific_name] [varchar](500) NULL,
	[common_name] [varchar](500) NULL,
	[iconic_taxon_name] [varchar](500) NULL,
	[taxon_id] [varchar](500) NULL,
	[img_url] [varchar](500) NULL,
	[day_of_week] [tinyint] NULL,
	[nearest_station] [varchar](50) NULL,
	[ObsScore] [decimal](5, 4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
