-- Compatibility for E&D

INSERT INTO UnitPromotions
			(Type, 											Description, 												Help, 													CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_DECISIONS_FRANCEARMEE', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_HELP',			1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_FRANCEARMEE_DESC'),
			('PROMOTION_DECISIONS_OTTOMANGUNPOWDER', 		'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_DESC', 		'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_OTTOMANGUNPOWDER_DESC'),
			('PROMOTION_DECISIONS_MOROCCOBLACKGUAR', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC', 		'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_MOROCCOBLACKGUAR_DESC'),
			('PROMOTION_DECISIONS_GREECEPHALANX', 			'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_GREECEPHALANX_DESC'),			
			('PROMOTION_DECISIONS_HUNSRECURVEBOW', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC', 			'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_HELP',		1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_HUNSRECURVEBOW_DESC');			
			
UPDATE UnitPromotions
	SET GreatGeneralModifier = 25
	WHERE Type = 'PROMOTION_DECISIONS_FRANCEARMEE';
	
UPDATE UnitPromotions
	SET CityAttack = 50
	WHERE Type = 'PROMOTION_DECISIONS_OTTOMANGUNPOWDER';
	
UPDATE UnitPromotions
	SET FriendlyLandsModifier = 25
	WHERE Type = 'PROMOTION_DECISIONS_MOROCCOBLACKGUAR';
	
UPDATE UnitPromotions
	SET AdjacentMod = 25
	WHERE Type = 'PROMOTION_DECISIONS_GREECEPHALANX';
	
UPDATE UnitPromotions
	SET RangedAttackModifier = 20
	WHERE Type = 'PROMOTION_DECISIONS_HUNSRECURVEBOW';

