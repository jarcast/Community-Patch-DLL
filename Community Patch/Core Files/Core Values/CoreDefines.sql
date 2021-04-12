-- Combat Stuff
UPDATE Defines SET Value = '5' WHERE Name = 'AI_TACTICAL_MAP_TEMP_ZONE_TURNS'; -- Number of turns AI waits while recruiting before disbanding an operation
UPDATE Defines SET Value = '10' WHERE Name = 'AI_OPERATIONAL_MAX_RECRUIT_TURNS_ENEMY_TERRITORY'; -- ...in enemy territory
UPDATE Defines SET Value = '70' WHERE Name = 'AI_OPERATIONAL_PERCENT_HEALTH_FOR_OPERATION';
UPDATE Defines SET Value = '40' WHERE Name = 'AI_TACTICAL_MAP_DOMINANCE_PERCENTAGE';
UPDATE Defines SET Value = '5' WHERE Name = 'AI_HOMELAND_GREAT_PERSON_TURNS_TO_WAIT';

INSERT INTO Defines (Name, Value) SELECT 'BALANCE_BASIC_ATTACK_ARMY_SIZE', '6' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_ARMY_NAVY_START_SIZE', '3' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '-50' WHERE Name = 'AIR_SWEEP_INTERCEPTION_DAMAGE_MOD' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );

UPDATE Defines SET Value = '5' WHERE Name = 'BONUS_PER_ADJACENT_FRIEND' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '-40' WHERE Name = 'CITY_RANGED_ATTACK_STRENGTH_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );

-- AI combat tuning knobs

-- this controls how much damage an attack needs to inflict to be considered worthwhile
-- default value 100. higher -> more aggressive
INSERT INTO Defines (Name, Value) SELECT 'COMBAT_AI_OFFENSE_DAMAGEWEIGHT', '100';

-- this controls whether ending the turn on a certain plot is acceptable (defense and offense)
-- default value 100. higher -> more timid
INSERT INTO Defines (Name, Value) SELECT 'COMBAT_AI_OFFENSE_DANGERWEIGHT', '100';

-- this controls whether a 'bad' offensive move should still be considered
-- default value 20. higher -> more reckless
INSERT INTO Defines (Name, Value) SELECT 'COMBAT_AI_OFFENSE_SCORE_BIAS', '20';

-- this controls whether a 'bad' defensive move should still be considered
-- default value 200. higher -> more desperate
INSERT INTO Defines (Name, Value) SELECT 'COMBAT_AI_DEFENSE_SCORE_BIAS', '200';


-- Whoward AI/Game Config Defines
-- Number of rings a new city starts with
INSERT INTO Defines (Name, Value) SELECT 'CITY_STARTING_RINGS', '1';

-- Number of melee units per AA unit before the AI considers that they have enough, default value is 4
INSERT INTO Defines(Name, Value) SELECT 'AI_CONFIG_MILITARY_MELEE_PER_AA', '2';

-- Number of water tiles per ship for (small?) bodies of water, the default is 5, but 7 or 8 would be sufficient
INSERT INTO Defines(Name, Value) SELECT 'AI_CONFIG_MILITARY_TILES_PER_SHIP', '6';

-- Minimum war duration for AI players
INSERT INTO Defines(Name, Value) SELECT 'WAR_MAJOR_MINIMUM_TURNS', '10';
INSERT INTO Defines(Name, Value) SELECT 'WAR_MINOR_MINIMUM_TURNS', '1';


-- Whoward Warmonger Adjustments
-- Decay rate
UPDATE Defines SET Value = '-2' WHERE Name = 'WARMONGER_THREAT_PER_TURN_DECAY';

-- Weight of warmonger triggers
UPDATE Defines SET Value = '5' WHERE Name = 'WARMONGER_THREAT_MINOR_ATTACKED_WEIGHT';
UPDATE Defines SET Value = '10' WHERE Name = 'WARMONGER_THREAT_MAJOR_ATTACKED_WEIGHT';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_USED_NUKE_WEIGHT', '20';

UPDATE Defines SET Value = '100' WHERE Name = 'WARMONGER_THREAT_CITY_VALUE_MULTIPLIER'; -- > 100: each city is worth more ... < 100: each city is worth less (multiplicative)
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_CAPITAL_CITY_PERCENT', '150'; -- how much more the capital is worth (multiplicative)

-- Thresholds for warmonger threat levels (must have this much opinion penalty)
UPDATE Defines SET Value = '20' WHERE Name = 'WARMONGER_THREAT_MINOR_THRESHOLD';
UPDATE Defines SET Value = '80' WHERE Name = 'WARMONGER_THREAT_MAJOR_THRESHOLD';
UPDATE Defines SET Value = '140' WHERE Name = 'WARMONGER_THREAT_SEVERE_THRESHOLD';
UPDATE Defines SET Value = '200' WHERE Name = 'WARMONGER_THREAT_CRITICAL_THRESHOLD';
UPDATE Defines SET Value = '25' WHERE Name = 'WARMONGER_THREAT_SEVERE_PERCENT_THRESHOLD'; -- if you have conquered (killed, vassalized or captured capital) this % of major civs, threat is set to severe regardless of score. city-states count as half a major.
UPDATE Defines SET Value = '33' WHERE Name = 'WARMONGER_THREAT_CRITICAL_PERCENT_THRESHOLD'; -- if you have conquered (killed, vassalized or captured capital) this % of major civs, threat is set to critical regardless of score. city-states count as half a major.

-- Multiplicative modifiers which increase or decrease warmonger penalty per turn decay rate
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_IMMENSE', '50';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_POWERFUL', '75';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_STRONG', '100';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_AVERAGE', '150';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_POOR', '200';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_WEAK', '250';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_STRENGTH_DECAY_PATHETIC', '300';

-- Multiplicative modifier for when the bystander is on the same team as the defender, has a coop war with the defender against the attacker, or has a Defensive Pact with the defender
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_SHARED_FATE_PERCENT', '200';

-- Multiplicative modifier to the bonus for liberating a city owned by this player's team (added on top of SHARED_FATE_PERCENT)
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_LIBERATED_TEAM_BONUS_PERCENT', '200';

-- Multiplicative modifier for when the bystander doesn't know the defender, but does know the attacker
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_KNOWS_ATTACKER_PERCENT', '50';

-- Multiplicative modifier for when the bystander is in a coop war with the attacker against the defender (huge reduction!)
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_COOP_WAR_PERCENT', '10';

-- Additive modifiers which increase or decrease warmonger penalty based on how strong the attacker and defender are, compared to the bystander
-- Not applied if SHARED_FATE_PERCENT is applicable; values are inverted when liberating a city
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_IMMENSE', '100';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_POWERFUL', '75';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_STRONG', '50';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_AVERAGE', '33';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_POOR', '0';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_WEAK', '-25';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_ATTACKER_STRENGTH_PATHETIC', '-50';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_DEFENDER_STRENGTH_IMMENSE', '-75';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_DEFENDER_STRENGTH_POWERFUL', '-50';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_DEFENDER_STRENGTH_STRONG', '-25';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_DEFENDER_STRENGTH_AVERAGE', '0';

-- Additive modifiers for warmonger penalty based on various other conditions
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_MODIFIER_LARGE', '75';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_MODIFIER_MEDIUM', '50';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_MODIFIER_SMALL', '25';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_MODIFIER_NEGATIVE_SMALL', '-25';
INSERT INTO Defines(Name, Value) SELECT 'WARMONGER_THREAT_MODIFIER_NEGATIVE_MEDIUM', '-50';

-- Warmonger Percent by Era
UPDATE Eras Set WarmongerPercent = '50' WHERE Type = 'ERA_ANCIENT';
UPDATE Eras Set WarmongerPercent = '60' WHERE Type = 'ERA_CLASSICAL';
UPDATE Eras Set WarmongerPercent = '70' WHERE Type = 'ERA_MEDIEVAL';
UPDATE Eras Set WarmongerPercent = '80' WHERE Type = 'ERA_RENAISSANCE';
UPDATE Eras Set WarmongerPercent = '90' WHERE Type = 'ERA_INDUSTRIAL';
UPDATE Eras Set WarmongerPercent = '100' WHERE Type = 'ERA_MODERN';
UPDATE Eras Set WarmongerPercent = '110' WHERE Type = 'ERA_POSTMODERN';
UPDATE Eras Set WarmongerPercent = '120' WHERE Type = 'ERA_FUTURE';


-- For CBO
INSERT INTO Defines (Name, Value) SELECT 'RELIGION_MIN_FAITH_SECOND_PROPHET', '600';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CORE_PRODUCTION_DESERT_IMPROVEMENT', '0'; -- Hardcode for desert resources
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_MARRIAGE_GP_RATE', '15'; -- Austria new UA (CBP)
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_FOLLOWER_GROWTH_BONUS', '0'; -- India Growth (CBP)
INSERT INTO Defines (Name, Value) SELECT 'GWAM_THRESHOLD_DECREASE', '0'; -- Great People Rate Mod
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_BUILDING_INVESTMENT_BASELINE', '-50'; -- Building Investments Base Rate
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_UNIT_INVESTMENT_BASELINE', '-50'; -- Unit Investments Base Rate
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_HAPPINESS_THRESHOLD_PERCENTILE', '50'; -- Happiness
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_HAPPINESS_LUXURY_BASE', '1'; -- Luxury Happiness
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CORE_MUSICIAN_BLAST_HAPPINESS', '1'; -- Tourism Blast Happiness
INSERT INTO Defines (Name, Value) SELECT 'UNHAPPY_THRESHOLD', '25'; -- Unhappiness Threshold

-- Revolt Timer
UPDATE Defines SET Value = '10' WHERE Name = 'REVOLT_COUNTER_MIN';

-- Religion Score value reduced
UPDATE Defines SET Value = '5' WHERE Name = 'SCORE_BELIEF_MULTIPLIER';
UPDATE Defines SET Value = '3' WHERE Name = 'SCORE_RELIGION_CITIES_MULTIPLIER';

-- Religion Spread Rework
UPDATE Defines SET Value = '9' WHERE Name = 'RELIGION_ADJACENT_CITY_DISTANCE';

-- Ideology Unlock via Policies
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_MOD_POLICY_BRANCHES_NEEDED_IDEOLOGY', '3';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_MOD_POLICIES_NEEDED_IDEOLOGY', '18';

-- Monopoly Defines for CBP
INSERT INTO Defines (Name, Value) SELECT 'GLOBAL_RESOURCE_MONOPOLY_THRESHOLD', '50';
INSERT INTO Defines (Name, Value) SELECT 'STRATEGIC_RESOURCE_MONOPOLY_THRESHOLD', '25';

-- Spy Stuff
UPDATE Defines SET Value =  '200' WHERE Name = 'ESPIONAGE_GATHERING_INTEL_COST_PERCENT';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_SPY_SABOTAGE_RATE', '18' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_SPY_RESPAWN_TIMER', '12' WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '5' WHERE Name = 'ESPIONAGE_COUP_MULTIPLY_CONSTANT' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );

-- Wonder Stuff
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CORE_WORLD_WONDER_SAME_ERA_COST_MODIFIER', '25';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CORE_WORLD_WONDER_PREVIOUS_ERA_COST_MODIFIER', '15';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CORE_WORLD_WONDER_EARLIER_ERA_COST_MODIFIER', '10';

-- Trade Stuff
INSERT INTO Defines (Name, Value) SELECT 'OPEN_BORDERS_MODIFIER_TRADE_GOLD', '20'; -- Open Borders Trade Gold Value (halved if not mutual)
UPDATE Defines SET Value = '5' WHERE Name = 'EACH_GOLD_PER_TURN_VALUE_PERCENT'; -- Gold Per Turn Interest Rate for Trade Valuation

-- City-State Stuff
INSERT INTO Defines (Name, Value) SELECT 'QUEST_DISABLED_CP_QUESTS', '1'; -- New CBP Quests
INSERT INTO Defines (Name, Value) SELECT 'MOD_BALANCE_CORE_MINIMUM_RANKING_PTP', '0.6'; -- PTP Military Power Needed (float value)
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_INFLUENCE_BOOST_PROTECTION_MINOR', '15';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_MINOR_PROTECTION_MINIMUM_DURATION', '50';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS', '5';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CS_PLEDGE_TO_PROTECT_DEFENSE_BONUS_MAX', '25';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CS_ALLIANCE_DEFENSE_BONUS', '1';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_MAX_CS_ALLY_STRENGTH', '5'; -- Max number of CSs calc'd for bonus for Greek UA (CBP)
UPDATE Defines SET Value = '-3000' WHERE Name = 'MINOR_FRIENDSHIP_DROP_BULLY_GOLD_SUCCESS';
UPDATE Defines SET Value = '-6000' WHERE Name = 'MINOR_FRIENDSHIP_DROP_BULLY_WORKER_SUCCESS';

-- CS Buff to keep up with AI
UPDATE Defines SET Value = '80' WHERE Name = 'MINOR_CIV_GROWTH_PERCENT';
UPDATE Defines SET Value = '120' WHERE Name = 'MINOR_CIV_PRODUCTION_PERCENT';
UPDATE Defines SET Value = '120' WHERE Name = 'MINOR_CIV_GOLD_PERCENT';

-- Barbarian Stuff
UPDATE Defines SET Value = '60' WHERE Name = 'BARBARIAN_TECH_PERCENT';
UPDATE Defines SET Value = '4' WHERE Name = 'BARBARIAN_CAMP_MINIMUM_DISTANCE_ANOTHER_CAMP';

-- FOR JFD
INSERT INTO Defines (Name, Value) SELECT 'UNHAPPINESS_PER_POPULATION_FLOAT', '0.0';


-- Settler Stuff
UPDATE Defines SET Value = '4' WHERE Name = 'SETTLER_DISTANCE_DROPOFF_MODIFIER'; -- Start of settle plot devaluation (prefer close settling)
UPDATE Defines SET Value = '8' WHERE Name = 'SETTLER_EVALUATION_DISTANCE'; -- Max range for settling (time offset will be added)
UPDATE Defines SET Value = '6' WHERE Name = 'CITY_RING_1_MULTIPLIER'; -- there are 6 ring1 plots but don't overemphasize the very short term
UPDATE Defines SET Value = '6' WHERE Name = 'CITY_RING_2_MULTIPLIER'; -- there are 12 ring2 plots, workable soon
UPDATE Defines SET Value = '3' WHERE Name = 'CITY_RING_3_MULTIPLIER'; -- there are 18 ring3 plots, workable late and often conflicted
UPDATE Defines SET Value = '35' WHERE Name = 'BUILD_ON_RIVER_PERCENT';
UPDATE Defines SET Value = '40' WHERE Name = 'SETTLER_BUILD_ON_COAST_PERCENT';
UPDATE Defines SET Value = '-10' WHERE Name = 'BUILD_ON_RESOURCE_PERCENT';
UPDATE Defines SET Value = '3' WHERE Name = 'SETTLER_STRATEGIC_MULTIPLIER';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_EMPIRE_BORDERLAND_STRATEGIC_VALUE', '10';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_COAST_STRATEGIC_VALUE', '3';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_FRESH_WATER_STRATEGIC_VALUE', '5';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_CHOKEPOINT_STRATEGIC_VALUE', '10';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_BAD_TILES_STRATEGIC_VALUE', '-34';
UPDATE Defines SET Value = '12' WHERE Name = 'SETTLER_FOOD_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '12' WHERE Name = 'SETTLER_PRODUCTION_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '8' WHERE Name = 'SETTLER_GOLD_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '5' WHERE Name = 'SETTLER_SCIENCE_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE Defines SET Value = '4' WHERE Name = 'SETTLER_FAITH_MULTIPLIER' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );

-- Worker Stuff
UPDATE Defines SET Value = '1000' WHERE Name = 'BUILDER_TASKING_BASELINE_REPAIR';
UPDATE Defines SET Value = '750' WHERE Name = 'BUILDER_TASKING_BASELINE_BUILD_ROUTES';
UPDATE Defines SET Value = '300' WHERE Name = 'BUILDER_TASKING_BASELINE_BUILD_RESOURCE_IMPROVEMENTS';
UPDATE Defines SET Value = '100' WHERE Name = 'BUILDER_TASKING_BASELINE_BUILD_IMPROVEMENTS';
INSERT INTO Defines (Name, Value) SELECT 'BUILDER_TASKING_BASELINE_ADDS_FOOD', '200';
INSERT INTO Defines (Name, Value) SELECT 'BUILDER_TASKING_BASELINE_ADDS_GOLD', '40';
INSERT INTO Defines (Name, Value) SELECT 'BUILDER_TASKING_BASELINE_ADDS_FAITH', '150';
INSERT INTO Defines (Name, Value) SELECT 'BUILDER_TASKING_BASELINE_ADDS_PRODUCTION', '200';
INSERT INTO Defines (Name, Value) SELECT 'BUILDER_TASKING_BASELINE_ADDS_SCIENCE', '200';
UPDATE Defines SET Value = '200' WHERE Name = 'BUILDER_TASKING_BASELINE_ADDS_CULTURE';

-- Scout Stuff
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_SCOUT_XP_RANDOM_VALUE', '12';
INSERT INTO Defines (Name, Value) SELECT 'BALANCE_SCOUT_XP_BASE', '1';
INSERT INTO Defines (Name, Value) SELECT 'MAX_PLOTS_PER_EXPLORER', '20'; -- Recon unit calculations

-- Automations
INSERT INTO Defines (Name, Value) SELECT 'UNIT_AUTO_EXTRA_AUTOMATIONS_DISABLED', '0';


-- Tech Stuff
UPDATE Defines SET Value = '0.035' WHERE Name = 'AI_RESEARCH_WEIGHT_MOD_PER_TURN_LEFT';
UPDATE Defines SET Value = '0.2' WHERE Name = 'AI_RESEARCH_WEIGHT_BASE_MOD';
UPDATE Defines SET Value = '25' WHERE Name = 'TECH_PRIORITY_UNIQUE_ITEM'; -- emphasis on uniques - changed formula

-- Policy Stuff
UPDATE Defines SET Value = '90' WHERE Name = 'POLICY_WEIGHT_PERCENT_DROP_NEW_BRANCH';
UPDATE Defines SET Value = '45' WHERE Name = 'IDEOLOGY_SCORE_PER_FREE_TENET';
UPDATE Defines SET Value = '10' WHERE Name = 'IDEOLOGY_SCORE_HAPPINESS';

-- Religion Stuff
UPDATE Defines SET Value = '2' WHERE Name = 'RELIGION_MAX_MISSIONARIES';
UPDATE Defines SET Value = '20' WHERE Name = 'RELIGION_MISSIONARY_RANGE_IN_TURNS';

-- AI Grand Strategy
UPDATE Defines SET Value = '600' WHERE Name = 'AI_GS_SS_TECH_PROGRESS_MOD';
UPDATE Defines SET Value = '33' WHERE Name = 'AI_GRAND_STRATEGY_OTHER_PLAYERS_GS_MULTIPLIER';
UPDATE Defines SET Value = '150' WHERE Name = 'AI_GRAND_STRATEGY_GUESS_POSITIVE_THRESHOLD';
UPDATE Defines SET Value = '80' WHERE Name = 'AI_GRAND_STRATEGY_GUESS_LIKELY_THRESHOLD';

-- AI City Specialization
UPDATE Defines SET Value = '20' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_OPERATIONAL_UNITS_REQUESTED'; 
UPDATE Defines SET Value = '150' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_CIVS_AT_WAR_WITH'; 
UPDATE Defines SET Value = '250' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_WAR_MOBILIZATION'; 
UPDATE Defines SET Value = '250' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_EMPIRE_DEFENSE'; 
UPDATE Defines SET Value = '1250' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_EMPIRE_DEFENSE_CRITICAL'; 
UPDATE Defines SET Value = '250' WHERE Name = 'AI_CITY_SPECIALIZATION_PRODUCTION_WEIGHT_FLAVOR_WONDER';

-- AI City Strategy
UPDATE Defines SET Value = '10' WHERE Name = 'AI_CITIZEN_VALUE_SCIENCE';
UPDATE Defines SET Value = '12' WHERE Name = 'AI_CITIZEN_VALUE_FOOD';
UPDATE Defines SET Value = '14' WHERE Name = 'AI_CITIZEN_VALUE_PRODUCTION';
UPDATE Defines SET Value = '6' WHERE Name = 'AI_CITIZEN_VALUE_GOLD';
UPDATE Defines SET Value = '16' WHERE Name = 'AI_CITIZEN_VALUE_CULTURE';
UPDATE Defines SET Value = '8' WHERE Name = 'AI_CITIZEN_VALUE_FAITH';
UPDATE Defines SET Value = '5000' WHERE Name = 'AI_CITYSTRATEGY_OPERATION_UNIT_BASE_WEIGHT';
UPDATE Defines SET Value = '0.5' WHERE Name = 'AI_CITYSTRATEGY_YIELD_DEFICIENT_FOOD'; -- food is different because we include consumption.
UPDATE Defines SET Value = '1.0' WHERE Name = 'AI_CITYSTRATEGY_YIELD_DEFICIENT_PRODUCTION';
UPDATE Defines SET Value = '1.5' WHERE Name = 'AI_CITYSTRATEGY_YIELD_DEFICIENT_GOLD';
UPDATE Defines SET Value = '2.5' WHERE Name = 'AI_CITYSTRATEGY_YIELD_DEFICIENT_SCIENCE';
INSERT INTO Defines (Name, Value) SELECT 'AI_CITYSTRATEGY_YIELD_DEFICIENT_CULTURE', '2.5';
UPDATE Defines SET Value = '5' WHERE Name = 'AI_CITYSTRATEGY_WANT_TILE_IMPROVERS_MINIMUM_SIZE' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );
UPDATE AICityStrategies SET WeightThreshold = '1' WHERE Type = 'AICITYSTRATEGY_WANT_TILE_IMPROVERS' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE' AND Value= 1 );

-- AI purchase logic
UPDATE Defines SET Value = '500' WHERE Name = 'AI_GOLD_PRIORITY_UPGRADE_BASE';
UPDATE Defines SET Value = '100' WHERE Name = 'AI_GOLD_PRIORITY_UPGRADE_PER_FLAVOR_POINT';
UPDATE Defines SET Value = '150' WHERE Name = 'AI_GOLD_PRIORITY_MINIMUM_PLOT_BUY_VALUE';
INSERT OR IGNORE INTO Defines (Name, Value) SELECT 'AI_GOLD_TREASURY_BUFFER', '150';

-- Player Proximity Values
UPDATE Defines SET Value = '8' WHERE Name = 'PROXIMITY_NEIGHBORS_CLOSEST_CITY_REQUIREMENT';
UPDATE Defines SET Value = '16' WHERE Name = 'PROXIMITY_CLOSE_CLOSEST_CITY_POSSIBILITY';
UPDATE Defines SET Value = '24' WHERE Name = 'PROXIMITY_FAR_DISTANCE_MAX';
UPDATE Defines SET Value = '5' WHERE Name = 'AI_DIPLO_PLOT_RANGE_FROM_CITY_HOME_FRONT'; -- this is in plots


-- Diplomacy Values

-- War Damage Values
UPDATE Defines SET Value = '175' WHERE Name = 'WAR_DAMAGE_LEVEL_CITY_WEIGHT';
UPDATE Defines SET Value = '150' WHERE Name = 'WAR_DAMAGE_LEVEL_INVOLVED_CITY_POP_MULTIPLIER';
INSERT INTO Defines (Name, Value) SELECT 'WAR_DAMAGE_LEVEL_WORLD_WONDER_MULTIPLIER', '200';
INSERT INTO Defines (Name, Value) SELECT 'PILLAGED_TILE_BASE_WAR_VALUE', '40';
INSERT INTO Defines (Name, Value) SELECT 'STOLEN_TILE_BASE_WAR_VALUE', '80';

UPDATE Defines SET Value = '15' WHERE Name = 'WAR_DAMAGE_LEVEL_THRESHOLD_MINOR';
UPDATE Defines SET Value = '30' WHERE Name = 'WAR_DAMAGE_LEVEL_THRESHOLD_MAJOR';
UPDATE Defines SET Value = '50' WHERE Name = 'WAR_DAMAGE_LEVEL_THRESHOLD_SERIOUS';
UPDATE Defines SET Value = '70' WHERE Name = 'WAR_DAMAGE_LEVEL_THRESHOLD_CRIPPLED';

-- Aggressive Postures
UPDATE Defines SET Value = '3' WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_HIGH';
UPDATE Defines SET Value = '6' WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_MEDIUM';
UPDATE Defines SET Value = '9' WHERE Name = 'EXPANSION_CAPITAL_DISTANCE_AGGRESSIVE_POSTURE_LOW';

UPDATE Defines SET Value = '12' WHERE Name = 'PLOT_BUYING_POSTURE_INCREDIBLE_THRESHOLD';
UPDATE Defines SET Value = '9' WHERE Name = 'PLOT_BUYING_POSTURE_HIGH_THRESHOLD';
UPDATE Defines SET Value = '5' WHERE Name = 'PLOT_BUYING_POSTURE_MEDIUM_THRESHOLD';
UPDATE Defines SET Value = '3' WHERE Name = 'PLOT_BUYING_POSTURE_LOW_THRESHOLD';

UPDATE Defines SET Value = '800' WHERE Name = 'MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_INCREDIBLE';
UPDATE Defines SET Value = '500' WHERE Name = 'MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_HIGH';
UPDATE Defines SET Value = '300' WHERE Name = 'MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_MEDIUM';
UPDATE Defines SET Value = '100' WHERE Name = 'MILITARY_AGGRESSIVE_POSTURE_THRESHOLD_LOW';

-- Dispute Levels
UPDATE Defines SET Value = '8' WHERE Name = 'LAND_DISPUTE_FIERCE_THRESHOLD';
UPDATE Defines SET Value = '4' WHERE Name = 'LAND_DISPUTE_STRONG_THRESHOLD';
UPDATE Defines SET Value = '1' WHERE Name = 'LAND_DISPUTE_WEAK_THRESHOLD';
UPDATE Defines SET Value = '50' WHERE Name = 'LAND_DISPUTE_CRAMPED_MULTIPLIER';

UPDATE Defines SET Value = '30' WHERE Name = 'WONDER_DISPUTE_FIERCE_THRESHOLD';
UPDATE Defines SET Value = '15' WHERE Name = 'WONDER_DISPUTE_STRONG_THRESHOLD';
UPDATE Defines SET Value = '5' WHERE Name = 'WONDER_DISPUTE_WEAK_THRESHOLD';

UPDATE Defines SET Value = '1400' WHERE Name = 'MINOR_CIV_DISPUTE_FIERCE_THRESHOLD';
UPDATE Defines SET Value = '1000' WHERE Name = 'MINOR_CIV_DISPUTE_STRONG_THRESHOLD';
UPDATE Defines SET Value = '700' WHERE Name = 'MINOR_CIV_DISPUTE_WEAK_THRESHOLD';

UPDATE Defines SET Value = '25' WHERE Name = 'VICTORY_DISPUTE_GRAND_STRATEGY_MATCH_POSITIVE';
UPDATE Defines SET Value = '15' WHERE Name = 'VICTORY_DISPUTE_GRAND_STRATEGY_MATCH_LIKELY';
UPDATE Defines SET Value = '5' WHERE Name = 'VICTORY_DISPUTE_GRAND_STRATEGY_MATCH_UNSURE';

INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_FIERCE_THRESHOLD', '40';
INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_STRONG_THRESHOLD', '30';
INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_WEAK_THRESHOLD', '20';
INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_GRAND_STRATEGY_DIFFERENCE_POSITIVE', '20';
INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_GRAND_STRATEGY_DIFFERENCE_LIKELY', '15';
INSERT INTO Defines (Name, Value) SELECT 'VICTORY_BLOCK_GRAND_STRATEGY_DIFFERENCE_UNSURE', '5';

INSERT INTO Defines (Name, Value) SELECT 'TECH_BLOCK_FIERCE_THRESHOLD', '30';
INSERT INTO Defines (Name, Value) SELECT 'TECH_BLOCK_STRONG_THRESHOLD', '20';
INSERT INTO Defines (Name, Value) SELECT 'TECH_BLOCK_WEAK_THRESHOLD', '10';

INSERT INTO Defines (Name, Value) SELECT 'POLICY_BLOCK_FIERCE_THRESHOLD', '24';
INSERT INTO Defines (Name, Value) SELECT 'POLICY_BLOCK_STRONG_THRESHOLD', '16';
INSERT INTO Defines (Name, Value) SELECT 'POLICY_BLOCK_WEAK_THRESHOLD', '8';

-- Skill Rating Calculation
INSERT INTO Defines (Name, Value) SELECT 'MILITARY_RATING_HUMAN_BUFFER_VALUE', '-20';

-- Comparative Strength Thresholds
UPDATE Defines SET Value = '33' WHERE Name = 'MILITARY_STRENGTH_WEAK_THRESHOLD';
UPDATE Defines SET Value = '50' WHERE Name = 'MILITARY_STRENGTH_POOR_THRESHOLD';
UPDATE Defines SET Value = '75' WHERE Name = 'MILITARY_STRENGTH_AVERAGE_THRESHOLD';
UPDATE Defines SET Value = '125' WHERE Name = 'MILITARY_STRENGTH_STRONG_THRESHOLD';
UPDATE Defines SET Value = '200' WHERE Name = 'MILITARY_STRENGTH_POWERFUL_THRESHOLD';
UPDATE Defines SET Value = '300' WHERE Name = 'MILITARY_STRENGTH_IMMENSE_THRESHOLD';

UPDATE Defines SET Value = '33' WHERE Name = 'ECONOMIC_STRENGTH_WEAK_THRESHOLD';
UPDATE Defines SET Value = '50' WHERE Name = 'ECONOMIC_STRENGTH_POOR_THRESHOLD';
UPDATE Defines SET Value = '75' WHERE Name = 'ECONOMIC_STRENGTH_AVERAGE_THRESHOLD';
UPDATE Defines SET Value = '125' WHERE Name = 'ECONOMIC_STRENGTH_STRONG_THRESHOLD';
UPDATE Defines SET Value = '200' WHERE Name = 'ECONOMIC_STRENGTH_POWERFUL_THRESHOLD';
UPDATE Defines SET Value = '300' WHERE Name = 'ECONOMIC_STRENGTH_IMMENSE_THRESHOLD';

-- War Projection
UPDATE Defines SET Value = '60' WHERE Name = 'WAR_PROJECTION_THRESHOLD_VERY_GOOD';
UPDATE Defines SET Value = '30' WHERE Name = 'WAR_PROJECTION_THRESHOLD_GOOD';
UPDATE Defines SET Value = '-50' WHERE Name = 'WAR_PROJECTION_THRESHOLD_DESTRUCTION';
UPDATE Defines SET Value = '-30' WHERE Name = 'WAR_PROJECTION_THRESHOLD_DEFEAT';
UPDATE Defines SET Value = '0' WHERE Name = 'WAR_PROJECTION_THRESHOLD_STALEMATE';

-- Target Value
UPDATE Defines SET Value = '0' WHERE Name = 'TARGET_MINOR_BACKUP_PATHETIC';
UPDATE Defines SET Value = '0' WHERE Name = 'TARGET_MINOR_BACKUP_WEAK';
UPDATE Defines SET Value = '0' WHERE Name = 'TARGET_MINOR_BACKUP_POOR';
UPDATE Defines SET Value = '15' WHERE Name = 'TARGET_MINOR_BACKUP_AVERAGE';
UPDATE Defines SET Value = '25' WHERE Name = 'TARGET_MINOR_BACKUP_STRONG';
UPDATE Defines SET Value = '35' WHERE Name = 'TARGET_MINOR_BACKUP_POWERFUL';
UPDATE Defines SET Value = '50' WHERE Name = 'TARGET_MINOR_BACKUP_IMMENSE';
UPDATE Defines SET Value = '100' WHERE Name = 'TARGET_MINOR_BACKUP_NEIGHBORS';
UPDATE Defines SET Value = '50' WHERE Name = 'TARGET_MINOR_BACKUP_CLOSE';
UPDATE Defines SET Value = '0' WHERE Name = 'TARGET_MINOR_BACKUP_FAR';
UPDATE Defines SET Value = '0' WHERE Name = 'TARGET_MINOR_BACKUP_DISTANT';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_PATHETIC', '0';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_WEAK', '5';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_POOR', '10';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_AVERAGE', '15';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_STRONG', '25';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_POWERFUL', '35';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_IMMENSE', '50';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_NEIGHBORS', '200';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_CLOSE', '100';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_FAR', '50';
INSERT INTO Defines (Name, Value) SELECT 'TARGET_MAJOR_BACKUP_DISTANT', '0';

-- Diplo Agreements
INSERT INTO Defines (Name, Value) SELECT 'COOP_WAR_DESIRE_THRESHOLD', '40'; -- min. GetCoopWarDesireScore() value for the AI to agree

-- "Too early for agreement" turn buffers
UPDATE Defines SET Value = '50' WHERE Name = 'DOF_TURN_BUFFER';
INSERT INTO Defines (Name, Value) SELECT 'DOF_TURN_BUFFER_REDUCTION_PER_ERA', '-5';
INSERT INTO Defines (Name, Value) SELECT 'JUST_MET_TURN_BUFFER', '10';

-- Peace Desire
UPDATE Defines SET Value = '11' WHERE Name = 'REQUEST_PEACE_TURN_THRESHOLD';

-- Peace Values (caps at 100)
UPDATE Defines SET Value = '100' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_UN_SURRENDER';
UPDATE Defines SET Value = '90' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_CAPITULATION';
UPDATE Defines SET Value = '80' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_CESSION';
UPDATE Defines SET Value = '70' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_SURRENDER';
UPDATE Defines SET Value = '60' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_SUBMISSION';
UPDATE Defines SET Value = '40' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_BACKDOWN';
UPDATE Defines SET Value = '30' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_SETTLEMENT';
UPDATE Defines SET Value = '15' WHERE Name = 'PEACE_WILLINGNESS_OFFER_THRESHOLD_ARMISTICE';

UPDATE Defines SET Value = '100' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_UN_SURRENDER';
UPDATE Defines SET Value = '90' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_CAPITULATION';
UPDATE Defines SET Value = '80' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_CESSION';
UPDATE Defines SET Value = '70' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_SURRENDER';
UPDATE Defines SET Value = '60' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_SUBMISSION';
UPDATE Defines SET Value = '40' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_BACKDOWN';
UPDATE Defines SET Value = '30' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_SETTLEMENT';
UPDATE Defines SET Value = '15' WHERE Name = 'PEACE_WILLINGNESS_ACCEPT_THRESHOLD_ARMISTICE';