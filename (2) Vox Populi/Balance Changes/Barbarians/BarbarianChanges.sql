-- Spawning and Release
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) VALUES ('IMPROVEMENT_BARBARIAN_CAMP', 'TERRAIN_SNOW');
UPDATE Defines SET Value = '85' WHERE Name = 'BARBARIAN_CAMP_FIRST_TURN_PERCENT_OF_TARGET_TO_ADD'; -- 8.5% of eligible tiles will spawn a camp on the initial spawn turn
UPDATE Defines SET Value = '2' WHERE Name = 'BARBARIAN_INITIAL_SPAWN_TURN'; -- Barbarian camps start spawning on this turn
UPDATE Defines SET Value = '2' WHERE Name = 'AI_TACTICAL_BARBARIAN_RELEASE_VARIATION'; -- Barbarian release turn is modified by +/- this number, then scaled with game speed

-- Barbarian Healing
UPDATE Defines SET Value = '10' WHERE Name = 'BALANCE_BARBARIAN_HEAL_RATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 1 );
UPDATE Defines SET Value = '15' WHERE Name = 'BALANCE_BARBARIAN_HEAL_RATE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='BARBARIAN_HEAL' AND Value= 2 );

-- Barbarian Promotions
INSERT INTO UnitPromotions
	(Type, Description, Help, Sound, OrderPriority, PortraitIndex, BarbarianOnly, IconAtlas, PediaType, CannotBeChosen, PediaEntry, AllowsEmbarkation, HillsDoubleMove)
VALUES
	('PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER', 'TXT_KEY_PROMOTION_MARSH_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_MARSH_WALKER', 0, 0),
	('PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER', 'TXT_KEY_PROMOTION_WHITE_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 44, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_WHITE_WALKER', 0, 0),
	('PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER', 'TXT_KEY_PROMOTION_WOODS_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 56, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_WOODS_WALKER', 0, 0),
	('PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER', 'TXT_KEY_PROMOTION_DESERT_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 1, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_DESERT_WALKER', 0, 0),
	('PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER', 'TXT_KEY_PROMOTION_COAST_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 22, 1, 'PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_COAST_WALKER', 1, 0),
	('PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER', 'TXT_KEY_PROMOTION_HILL_WALKER_HELP', 'AS2D_IF_LEVELUP', 99, 0, 1, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_BARBARIAN', 1, 'TXT_KEY_PROMOTION_HILL_WALKER', 0, 1);

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_FOREST';

UPDATE Features
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WOODS_WALKER'
WHERE Type = 'FEATURE_JUNGLE';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_DESERT_WALKER'
WHERE Type = 'TERRAIN_DESERT';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_HILL_WALKER'
WHERE Type = 'TERRAIN_HILL';

UPDATE Terrains
SET SpawnLocationUnitFreePromotion = 'PROMOTION_WHITE_WALKER'
WHERE Type = 'TERRAIN_SNOW';

UPDATE Terrains
SET AdjacentSpawnLocationUnitFreePromotion = 'PROMOTION_COAST_WALKER'
WHERE Type = 'TERRAIN_COAST';

INSERT INTO UnitPromotions_Features
	(PromotionType, FeatureType, DoubleMove)
VALUES
	('PROMOTION_MARSH_WALKER', 'FEATURE_MARSH', 1),
	('PROMOTION_MARSH_WALKER', 'FEATURE_FLOOD_PLAINS', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_FOREST', 1),
	('PROMOTION_WOODS_WALKER', 'FEATURE_JUNGLE', 1);

INSERT INTO UnitPromotions_Terrains
	(PromotionType, TerrainType, DoubleMove)
VALUES
	('PROMOTION_WHITE_WALKER', 'TERRAIN_SNOW', 1),
	('PROMOTION_DESERT_WALKER', 'TERRAIN_DESERT', 1);

INSERT INTO UnitPromotions_UnitCombats
	(PromotionType, UnitCombatType)
VALUES
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_MARSH_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WHITE_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_WOODS_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_COAST_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_DESERT_WALKER', 'UNITCOMBAT_HELICOPTER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_RECON'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARCHER'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MOUNTED'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_MELEE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_SIEGE'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_GUN'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_ARMOR'),
	('PROMOTION_HILL_WALKER', 'UNITCOMBAT_HELICOPTER');

DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_BARBARIAN';
INSERT INTO Civilization_UnitClassOverrides
	(CivilizationType, UnitClassType, UnitType)
VALUES
	-- Barbarian UU replacements
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_WARRIOR', 'UNIT_BARBARIAN_WARRIOR'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ARCHER', 'UNIT_BARBARIAN_ARCHER'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SPEARMAN', 'UNIT_BARBARIAN_SPEARMAN'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SWORDSMAN', 'UNIT_BARBARIAN_SWORDSMAN'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_HORSEMAN', 'UNIT_BARBARIAN_HORSEMAN'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CHARIOT_ARCHER', 'UNIT_BARBARIAN_AXMAN'),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_GALLEY', 'UNIT_GALLEY'),

	-- Barbarians cannot spawn the unit classes below!
	-- Civilians
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SETTLER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_PIONEER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_COLONIST', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_WORKER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_WORKBOAT', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CARAVAN', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CARGO_SHIP', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_GREAT_GENERAL', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_GREAT_ADMIRAL', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ARTIST', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_WRITER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MUSICIAN', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SCIENTIST', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MERCHANT', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ENGINEER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ARCHAEOLOGIST', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_PROPHET', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MISSIONARY', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_INQUISITOR', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SS_COCKPIT', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SS_STASIS_CHAMBER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SS_ENGINE', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SS_BOOSTER', NULL),

	-- Slingers, since they have a unique Archer
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_VP_SLINGER', NULL),

	-- Scouting Line
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_PATHFINDER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_SCOUT', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_EXPLORER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_COMMANDO', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_PARATROOPER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MARINE', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_XCOM_SQUAD', NULL),

	-- Siege Line
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CATAPULT', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_TREBUCHET', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CANNON', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_FIELD_GUN', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ARTILLERY', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ROCKET_ARTILLERY', NULL),

	-- Anti-Air Units
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ANTI_AIRCRAFT_GUN', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_MOBILE_SAM', NULL),

	-- Air Units & Missiles
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_TRIPLANE', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_WWI_BOMBER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_FIGHTER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_BOMBER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_JET_FIGHTER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_STEALTH_BOMBER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_GUIDED_MISSILE', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ATOMIC_BOMB', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_NUCLEAR_MISSILE', NULL),

	-- Misc.
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_CARRIER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_HORSE_ARCHER', NULL),
	('CIVILIZATION_BARBARIAN', 'UNITCLASS_ASSYRIAN_SIEGE_TOWER', NULL);