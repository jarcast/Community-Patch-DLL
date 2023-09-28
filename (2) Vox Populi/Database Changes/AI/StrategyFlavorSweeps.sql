-- There are so many changes to diplomacy flavors it's easier to sweep
DELETE FROM AICityStrategy_Flavors WHERE FlavorType = 'FLAVOR_DIPLOMACY';
DELETE FROM AIEconomicStrategy_Player_Flavors WHERE FlavorType = 'FLAVOR_DIPLOMACY';
DELETE FROM AIEconomicStrategy_City_Flavors WHERE FlavorType = 'FLAVOR_DIPLOMACY';
DELETE FROM AIMilitaryStrategy_Player_Flavors WHERE FlavorType = 'FLAVOR_DIPLOMACY';
DELETE FROM AIMilitaryStrategy_City_Flavors WHERE FlavorType = 'FLAVOR_DIPLOMACY';

INSERT INTO AICityStrategy_Flavors
	(AICityStrategyType, FlavorType, Flavor)
VALUES
	('AICITYSTRATEGY_CAPITAL_UNDER_THREAT', 'FLAVOR_DIPLOMACY', -40),
	('AICITYSTRATEGY_CAPITAL_NEED_SETTLER', 'FLAVOR_DIPLOMACY', -30),
	('AICITYSTRATEGY_NEED_DIPLOMATS', 'FLAVOR_DIPLOMACY', 20),
	('AICITYSTRATEGY_NEED_DIPLOMATS_CRITICAL', 'FLAVOR_DIPLOMACY', 40),
	('AICITYSTRATEGY_LARGE_CITY', 'FLAVOR_DIPLOMACY', 11),
	('AICITYSTRATEGY_MEDIUM_CITY', 'FLAVOR_DIPLOMACY', 6),
	('AICITYSTRATEGY_SMALL_CITY', 'FLAVOR_DIPLOMACY', -30),
	('AICITYSTRATEGY_TINY_CITY', 'FLAVOR_DIPLOMACY', -300);

INSERT INTO AIEconomicStrategy_Player_Flavors
	(AIEconomicStrategyType, FlavorType, Flavor)
VALUES
	('ECONOMICAISTRATEGY_ISLAND_START', 'FLAVOR_DIPLOMACY', -10),
	('ECONOMICAISTRATEGY_TOO_MANY_UNITS', 'FLAVOR_DIPLOMACY', -10),
	('ECONOMICAISTRATEGY_NEED_HAPPINESS', 'FLAVOR_DIPLOMACY', 6),
	('ECONOMICAISTRATEGY_NEED_HAPPINESS_CRITICAL', 'FLAVOR_DIPLOMACY', 11),
	('ECONOMICAISTRATEGY_NEED_DIPLOMATS', 'FLAVOR_DIPLOMACY', 20),
	('ECONOMICAISTRATEGY_NEED_DIPLOMATS_CRITICAL', 'FLAVOR_DIPLOMACY', 60),
	('ECONOMICAISTRATEGY_GS_DIPLOMACY', 'FLAVOR_DIPLOMACY', 26),
	('ECONOMICAISTRATEGY_GS_CULTURE', 'FLAVOR_DIPLOMACY', 22),
	('ECONOMICAISTRATEGY_GS_CONQUEST', 'FLAVOR_DIPLOMACY', 11),
	('ECONOMICAISTRATEGY_GS_SPACESHIP', 'FLAVOR_DIPLOMACY', 16),
	('ECONOMICAISTRATEGY_GS_SPACESHIP_HOMESTRETCH', 'FLAVOR_DIPLOMACY', -50);

INSERT INTO AIEconomicStrategy_City_Flavors
	(AIEconomicStrategyType, FlavorType, Flavor)
VALUES
	('ECONOMICAISTRATEGY_ISLAND_START', 'FLAVOR_DIPLOMACY', -10),
	('ECONOMICAISTRATEGY_TOO_MANY_UNITS', 'FLAVOR_DIPLOMACY', -15),
	('ECONOMICAISTRATEGY_NEED_HAPPINESS', 'FLAVOR_DIPLOMACY', 6),
	('ECONOMICAISTRATEGY_NEED_HAPPINESS_CRITICAL', 'FLAVOR_DIPLOMACY', 11),
	('ECONOMICAISTRATEGY_NEED_DIPLOMATS', 'FLAVOR_DIPLOMACY', 20),
	('ECONOMICAISTRATEGY_NEED_DIPLOMATS_CRITICAL', 'FLAVOR_DIPLOMACY', 60),
	('ECONOMICAISTRATEGY_GS_DIPLOMACY', 'FLAVOR_DIPLOMACY', 30),
	('ECONOMICAISTRATEGY_GS_CULTURE', 'FLAVOR_DIPLOMACY', 22),
	('ECONOMICAISTRATEGY_GS_CONQUEST', 'FLAVOR_DIPLOMACY', 11),
	('ECONOMICAISTRATEGY_GS_SPACESHIP', 'FLAVOR_DIPLOMACY', 16),
	('ECONOMICAISTRATEGY_GS_SPACESHIP_HOMESTRETCH', 'FLAVOR_DIPLOMACY', -50);

INSERT INTO AIMilitaryStrategy_Player_Flavors
	(AIMilitaryStrategyType, FlavorType, Flavor)
VALUES
	('MILITARYAISTRATEGY_AT_WAR', 'FLAVOR_DIPLOMACY', -25),
	('MILITARYAISTRATEGY_WINNING_WARS', 'FLAVOR_DIPLOMACY', -10),
	('MILITARYAISTRATEGY_LOSING_WARS', 'FLAVOR_DIPLOMACY', -20),
	('MILITARYAISTRATEGY_EMPIRE_DEFENSE', 'FLAVOR_DIPLOMACY', -15),
	('MILITARYAISTRATEGY_EMPIRE_DEFENSE_CRITICAL', 'FLAVOR_DIPLOMACY', -35),
	('MILITARYAISTRATEGY_WAR_MOBILIZATION', 'FLAVOR_DIPLOMACY', -15),
	('MILITARYAISTRATEGY_ERADICATE_BARBARIANS', 'FLAVOR_DIPLOMACY', -10);

INSERT INTO AIMilitaryStrategy_City_Flavors
	(AIMilitaryStrategyType, FlavorType, Flavor)
VALUES
	('MILITARYAISTRATEGY_AT_WAR', 'FLAVOR_DIPLOMACY', -40),
	('MILITARYAISTRATEGY_WINNING_WARS', 'FLAVOR_DIPLOMACY', -30),
	('MILITARYAISTRATEGY_LOSING_WARS', 'FLAVOR_DIPLOMACY', -30),
	('MILITARYAISTRATEGY_EMPIRE_DEFENSE', 'FLAVOR_DIPLOMACY', -25),
	('MILITARYAISTRATEGY_EMPIRE_DEFENSE_CRITICAL', 'FLAVOR_DIPLOMACY', -50),
	('MILITARYAISTRATEGY_WAR_MOBILIZATION', 'FLAVOR_DIPLOMACY', -20),
	('MILITARYAISTRATEGY_ERADICATE_BARBARIANS', 'FLAVOR_DIPLOMACY', -20);
