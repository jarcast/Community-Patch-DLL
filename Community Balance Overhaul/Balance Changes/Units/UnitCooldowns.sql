
-- Cooldowns

UPDATE Units SET PurchaseCooldown =     1  WHERE Cost <=  100;
UPDATE Units SET PurchaseCooldown =     1  WHERE Cost >  100 AND Cost <=  200;
UPDATE Units SET PurchaseCooldown =     1  WHERE Cost >  200 AND Cost <=  300;
UPDATE Units SET PurchaseCooldown =     1  WHERE Cost >  300 AND Cost <=  400;
UPDATE Units SET PurchaseCooldown =     1  WHERE Cost >  400 AND Cost <=  500;
UPDATE Units SET PurchaseCooldown =		1  WHERE Cost >=  500;

UPDATE Units
SET PurchaseCooldown = '0'
WHERE Type = 'UNIT_FRENCH_FOREIGNLEGION';

UPDATE Units
SET PurchaseCooldown = '0'
WHERE Type = 'UNIT_GERMAN_LANDSKNECHT';

UPDATE Units
SET PurchaseCooldown = '0'
WHERE Type = 'UNIT_FCOMPANY';

UPDATE Units
SET PurchaseCooldown = '0'
WHERE Type = 'UNIT_GUERILLA';

UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_ARTIST';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_SCIENTIST';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_MERCHANT';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_ENGINEER';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_GREAT_GENERAL';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_MONGOLIAN_KHAN';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_PROPHET';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_GREAT_ADMIRAL';
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_WRITER'; 
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_MUSICIAN'; 
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_VENETIAN_MERCHANT'; 

UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_SS_STASIS_CHAMBER'; 
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_SS_ENGINE'; 
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_SS_COCKPIT'; 
UPDATE Units SET GlobalFaithPurchaseCooldown =		5  WHERE Type = 'UNIT_SS_BOOSTER'; 

UPDATE Units SET HurryCostModifier =		25  WHERE Type = 'UNIT_SS_STASIS_CHAMBER'; 
UPDATE Units SET HurryCostModifier =		25  WHERE Type = 'UNIT_SS_ENGINE'; 
UPDATE Units SET HurryCostModifier =		25  WHERE Type = 'UNIT_SS_COCKPIT'; 
UPDATE Units SET HurryCostModifier =		25  WHERE Type = 'UNIT_SS_BOOSTER'; 

UPDATE Units SET PurchaseCooldown =		15  WHERE Type = 'UNIT_ATOMIC_BOMB'; 
UPDATE Units SET PurchaseCooldown =		15  WHERE Type = 'UNIT_NUCLEAR_MISSILE'; 