/****** Script for SelectTopNRows command from SSMS  ******/

-- ###################################################################################
  -- Last 7 Days Daily Option data.
  CREATE INDEX NIX_ticker_tickerId_AndOthers ON ticker(tickerId) INCLUDE (symbol, industryId, sectorId); 
  CREATE Index NIX_OptionsHistorical_createdDate_includes ON OptionsHistorical(createdDate) 
  INCLUDE (expirationDate, strike, premium, volume, oi, price, tickerId, optionTradeWithSideId);

  SELECT oh.createdDate, oh.expirationDate, oh.strike, oh.premium, oh.volume, oh.oi, tk.symbol, s.name sectorName, inds.name industryName, oh.price, otws.callPUt, otws.side
	FROM OptionsHistorical oh INNER JOIN ticker AS tk ON oh.tickerId = tk.tickerId
	INNER JOIN optionTradeWithSide AS otws ON otws.Id = oh.optionTradeWithSideId
	INNER JOIN sector AS s ON s.Id = tk.sectorId 
	INNER JOIN Industry AS inds ON inds.id = tk.industryId
	WHERE CreatedDate >= DATEADD(dd,-30, GETDATE());
-- #######################################################################################

 --Last 7 Days Ticker performance (Bullish vs Bearish Trades).
 DROP INDEX NIX_ticker_tickerId_AndOthers ON ticker;
 DROP INDEX NIX_OptionsHistorical_createdDate_includes ON OptionsHistorical;

  CREATE INDEX NIX_ticker_tickerId_AndOthers ON ticker(tickerId) INCLUDE (symbol, volatilityWeek, sectorId, IndustryId); 
  CREATE Index NIX_OptionsHistorical_createdDate_includes ON OptionsHistorical(createdDate) 
		INCLUDE (volume, oi, price, tickerId, optionTradeWithSideId);
 --CREATE INDEX NIX_sectorId_AndOther ON sector(Id) INCLUDE(name);
 --CREATE INDEX NIX_industry_Id_AndOther ON industry(Id) INCLUDE(name);

	Select oh.createdDate, tk.symbol, otws.CallPut, inds.name IndustryName, s.name SectorName, tk.volatilityWeek, oh.price, oh.oi, oh.volume
	FROM OptionsHistorical oh INNER JOIN ticker AS tk ON oh.tickerId = tk.tickerId 
		  INNER JOIN optionTradeWithSide AS otws ON otws.Id = oh.optionTradeWithSideId
		  INNER JOIN sector AS s ON s.Id = tk.SectorId
		  INNER JOIN industry AS inds ON inds.Id = tk.IndustryId
	WHERE CreatedDate >= DATEADD(dd,-30, GETDATE());

-- #########################Sector Performance##############################################################
  --Last 7 Days Sector Performance (Bullish vs Bearish Trades).
  DROP INDEX NIX_ticker_tickerId_AndOthers ON ticker;
  DROP INDEX NIX_OptionsHistorical_createdDate_includes ON OptionsHistorical;

  CREATE INDEX NIX_ticker_tickerId_AndOthers ON ticker(tickerId) INCLUDE (symbol, volatilityWeek, sectorId, IndustryId, SharesOutstanding, mktCap, insiderOwn ); 
  CREATE Index NIX_OptionsHistorical_createdDate_includes ON OptionsHistorical(createdDate) 
		INCLUDE (volume, oi, price, tickerId, optionTradeWithSideId);
  Select oh.createdDate,  s.name SectorName, tk.symbol, inds.name IndustryName, tk.volatilityWeek, oh.price, oh.oi, oh.volume, tk.SharesOutstanding, tk.mktCap, tk.insiderOwn
	FROM OptionsHistorical oh INNER JOIN ticker AS tk ON oh.tickerId = tk.tickerId 
		  INNER JOIN optionTradeWithSide AS otws ON otws.Id = oh.optionTradeWithSideId
		  INNER JOIN sector AS s ON s.Id = tk.SectorId
		  INNER JOIN industry AS inds ON inds.Id = tk.IndustryId
	WHERE CreatedDate >= DATEADD(dd,-30, GETDATE());
-- #######################################################################################
		 --Last 7 Days Industry Performance (Bullish vs Bearish Trades).		 		
		 Select oh.createdDate, s.name SectorName,  tk.symbol, oh.price, otws.callPUt, otws.side from OptionsHistorical oh INNER JOIN ticker AS tk ON oh.Id = tk.tickerId
		  INNER JOIN optionTradeWithSide AS otws ON otws.Id = oh.Id INNER JOIN sector as s ON s.Id = tk.tickerId;
-- #######################################################################################
  -- ID is the primary key beacuse it has only unique value and identifies the rocord. 
  ALTER Table Industry ADD Primary Key(Id);
  ALTER TABLE OptionsHistorical ADD Primary Key (Id);
  ALTER TABLE OptionTradeColor ADD Primary Key(Id);
  ALTER TABLE OptionTradeType ADD Primary Key(Id);
  ALTER TABLE optionTradeWithSide ADD Primary Key (Id);
  ALTER TABLE quotes ADD Primary Key (Id);
  ALTER TABLE sector ADD Primary Key (Id);
  ALTER TABLE stockETF ADD Primary Key(Id);
  ALTER TABLE ticker ADD Primary Key(tickerId);


  