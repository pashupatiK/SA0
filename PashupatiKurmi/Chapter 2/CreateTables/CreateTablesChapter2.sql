USE [StockAnalysis]
GO
/****** Object:  Table [dbo].[Industry]    Script Date: 1/4/2023 3:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry](
	[IndustryID] [int] NOT NULL,
	[Industry] [varchar](255) NOT NULL,
	[LastPercentChange] [real] NULL,
	[MarketCap] [real] NULL,
	[OneYearChange] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[IndustryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionsHistorical]    Script Date: 1/4/2023 3:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionsHistorical](
	[OptionsHistoricalid] [int] NOT NULL,
	[Sector] [varchar](255) NOT NULL,
	[Industry] [varchar](255) NULL,
	[Stock] [varchar](255) NULL,
	[Ticker] [char](3) NOT NULL,
	[LastPercentChange] [real] NULL,
	[MarketCap] [real] NULL,
	[OneYearChange] [real] NULL,
	[FiftyTwoWHigh] [money] NULL,
	[FiftyTwoWLow] [money] NULL,
	[CurrentHigh] [money] NULL,
	[CurrentLow] [money] NULL,
	[StrickPrice] [money] NULL,
	[Breakeve] [money] NULL,
	[ToBreakeven] [money] NULL,
	[PercentageChange] [real] NULL,
	[Change] [money] NULL,
	[AskPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionsHistoricalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionsHistoricalThridNF]    Script Date: 1/4/2023 3:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionsHistoricalThridNF](
	[OptionsHistoricalid] [int] NOT NULL,
	[Ticker] [char](3) NULL,
	[SectorID] [int] NULL,
	[IndustryID] [int] NULL,
	[StrickPrice] [money] NULL,
	[Breakeve] [money] NULL,
	[ToBreakeven] [money] NULL,
	[PercentageChange] [real] NULL,
	[Change] [money] NULL,
	[AskPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionsHistoricalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [OptionTreding]
) ON [OptionTreding]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 1/4/2023 3:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[SectorID] [int] NOT NULL,
	[Sector] [varchar](255) NOT NULL,
	[LastPercentChange] [real] NULL,
	[MarketCap] [real] NULL,
	[OneYearChange] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[SectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticker]    Script Date: 1/4/2023 3:59:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticker](
	[Ticker] [char](3) NOT NULL,
	[Stock] [varchar](50) NOT NULL,
	[FiftyTwoWHigh] [money] NULL,
	[FiftyTwoWLow] [money] NULL,
	[CurrentHigh] [money] NULL,
	[CurrentLow] [money] NULL,
	[Closed] [money] NULL,
	[NetChange] [real] NULL,
	[Div] [money] NULL,
	[Vol] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticker] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OptionsHistoricalThridNF]  WITH CHECK ADD FOREIGN KEY([IndustryID])
REFERENCES [dbo].[Industry] ([IndustryID])
GO
ALTER TABLE [dbo].[OptionsHistoricalThridNF]  WITH CHECK ADD FOREIGN KEY([SectorID])
REFERENCES [dbo].[Sector] ([SectorID])
GO
ALTER TABLE [dbo].[OptionsHistoricalThridNF]  WITH CHECK ADD FOREIGN KEY([Ticker])
REFERENCES [dbo].[Ticker] ([Ticker])
GO
