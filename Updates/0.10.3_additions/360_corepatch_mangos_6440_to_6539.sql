-- 6456
DELETE FROM `command` WHERE `name` IN ('instance unbind','instance listbinds','instance stats','instance savedata');
INSERT INTO `command` (`name`,`security`,`help`) VALUES
('instance unbind',3,'Syntax: .instance unbind all\r\n  All of the selected player\'s binds will be cleared.'),
('instance listbinds',3,'Syntax: .instance listbinds\r\n  Lists the binds of the selected player.'),
('instance stats',3,'Syntax: .instance stats\r\n  Shows statistics about instances.'),
('instance savedata',3,'Syntax: .instance savedata\r\n  Save the InstanceData for the current player\'s map to the DB.');

-- 6492
ALTER TABLE spell_chain
  ADD COLUMN req_spell mediumint(9) NOT NULL default '0';

  DELETE FROM `spell_chain` WHERE `spell_id` IN (20217,25898,25890,27145,25782,25916,27141,1038,25895,25899,27169,25894,25918,27143,16689,16810,16811,16812,16813,17329,27009);
  INSERT INTO `spell_chain` (spell_id,prev_spell,first_spell,rank,req_spell) VALUES
  /* Greater Blessing of Kings */
  (20217,0,20217,1,0),
  (25898,0,25898,1,20217),
  /* Greater Blessing of Light */
  (25890,0,25890,1,19979),
  (27145,25890,25890,2,27144),
  /* Greater Blessing of Might */
  (25782,0,25782,1,19838),
  (25916,25782,25782,2,25291),
  (27141,25916,25782,3,27140),
  /* Greater Blessing of Salvation */
  (1038,0,1038,1,0),
  (25895,0,25895,1,1038),
  /* Greater Blessing of Sanctuary */
  (25899,0,25899,1,20914),
  (27169,25899,25899,2,27168),
  /* Greater Blessing of Wisdom */
  (25894,0,25894,1,19854),
  (25918,25894,25894,2,25290),
  (27143,25918,25894,3,27142),
  /* Nature's Grasp */
  (16689,0,16689,1,339),
  (16810,16689,16689,2,1062),
  (16811,16810,16689,3,5195),
  (16812,16811,16689,4,5196),
  (16813,16812,16689,5,9852),
  (17329,16813,16689,6,9853),
  (27009,17329,16689,7,26989);

-- 6496
--
-- Table structure for table `spell_pet_auras`
--

DROP TABLE IF EXISTS `spell_pet_auras`;
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint(8) unsigned NOT NULL default '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY  (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spell_pet_auras`
--

LOCK TABLES `spell_pet_auras` WRITE;
/*!40000 ALTER TABLE `spell_pet_auras` DISABLE KEYS */;
INSERT INTO `spell_pet_auras` VALUES
(19028, 0, 25228),
(19578, 0, 19579),
(20895, 0, 24529),
(28757, 0, 28758),
(35029, 0, 35060),
(35030, 0, 35061),
(35691, 0, 35696),
(35692, 0, 35696),
(35693, 0, 35696),
(23785, 416, 23759),
(23822, 416, 23826),
(23823, 416, 23827),
(23824, 416, 23828),
(23825, 416, 23829),
(23785, 417, 23762),
(23822, 417, 23837),
(23823, 417, 23838),
(23824, 417, 23839),
(23825, 417, 23840),
(23785, 1860, 23760),
(23822, 1860, 23841),
(23823, 1860, 23842),
(23824, 1860, 23843),
(23825, 1860, 23844),
(23785, 1863, 23761),
(23822, 1863, 23833),
(23823, 1863, 23834),
(23824, 1863, 23835),
(23825, 1863, 23836),
(23785, 17252, 35702),
(23822, 17252, 35703),
(23823, 17252, 35704),
(23824, 17252, 35705),
(23825, 17252, 35706);

/*!40000 ALTER TABLE `spell_pet_auras` ENABLE KEYS */;
UNLOCK TABLES;

-- 6506
DELETE FROM spell_proc_event WHERE entry IN (34138,42370,43728,46098);

INSERT INTO spell_proc_event VALUES
(34138,0,0,0,11,0x0000000000000080,0x08000000,0),
(42370,0,0,0,11,0x0000000000000080,0x08000000,0),
(43728,0,0,0,11,0x0000000000000080,0x08000000,0),
(46098,0,0,0,11,0x0000000000000080,0x08000000,0);

-- 6509
DELETE IGNORE FROM `command` WHERE `name` = 'learn all_recipes';
INSERT IGNORE INTO `command` (`name`,`security`,`help`) VALUES
('learn all_recipes',2,'Syntax: .learn all_recipes [$profession]\r\rLearns all recipes of specified profession and sets skill level to max.\rExample: .learn all_recipes enchanting');

-- 6509
DELETE FROM mangos_string WHERE entry IN (592);
INSERT INTO mangos_string VALUES
(592,'You have learned all spells in craft: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- 6513
DELETE IGNORE FROM `command` WHERE `name` = 'cast dist';
INSERT IGNORE INTO `command` (`name`,`security`,`help`) VALUES
('cast dist',3,'Syntax: .cast dist #spellid [#dist [triggered]]\r\n  You will cast spell to pint at distance #dist. If \'trigered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.');

-- 6515
DELETE FROM spell_proc_event WHERE entry IN(45355,45040);
INSERT INTO spell_proc_event VALUES
(45040,0,0,0,0,0x0000000000000000,0x00080001,0),
(45355,0,0,0,0,0x0000000000000000,0x00080001,0);

-- 6521
DELETE FROM spell_proc_event WHERE entry IN(41260);
INSERT INTO `spell_proc_event` VALUES
(41260,0,0,0,0,0x0000000000000000,0x00000004,0);

-- 6523
DELETE FROM `spell_proc_event` WHERE `entry` IN (11185,12487,12488,19572,19573,28716,28744);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `Category`, `SkillID`, `SpellFamilyName`, `SpellFamilyMask`, `procFlags`, `ppmRate`)
 VALUES
  (11185, 0, 0, 0, 3, 0x0000000000000080, 0x00020000, 0),
  (12487, 0, 0, 0, 3, 0x0000000000000080, 0x00020000, 0),
  (12488, 0, 0, 0, 3, 0x0000000000000080, 0x00020000, 0),
  (19572, 0, 0, 0, 9, 0x0000000000800000, 0x08000000, 0),
  (19573, 0, 0, 0, 9, 0x0000000000800000, 0x08000000, 0),
  (28716, 0, 0, 0, 7, 0x0000000000000010, 0x08000000, 0),
  (28744, 0, 0, 0, 7, 0x0000000000000040, 0x08000000, 0);

-- 6528
DELETE FROM spell_affect WHERE entry IN (43743);
INSERT INTO spell_affect VALUES
(43743,1,0x0000000008000400);

ALTER TABLE spell_proc_event
  ADD COLUMN cooldown int(10) unsigned NOT NULL default '0';

  DELETE FROM spell_proc_event WHERE entry IN (324,325,905,945,974,8134,10431,10432,16620,18137,
  19308,19309,19310,19311,19312,21185,23552,24398,24932,25469,25472,25477,29441,29444,29445,29446,
  29447,30881,30883,30884,30885,30886,32593,32594,32734,32837,33736,33746,33757,33759,34355,34935,
  34938,34939,34827,35077,35080,35083,35086,37173,37189,37197,37227,37655,38334,39027,39958,40899,
  41260,41262,42135,42136,43737,45054,45057,45354,45481,45482,45483,45484,46569);

  INSERT INTO spell_proc_event (entry, SchoolMask, Category, SkillID, SpellFamilyName, SpellFamilyMask, procFlags, ppmRate, cooldown) VALUES
  (324,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (325,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (905,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (945,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (974,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (8134,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (10431,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (10432,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (16620,0,0,0,0,0x0000000000000000,0x00100402,0,30),
  (18137,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (19308,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (19309,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (19310,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (19311,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (19312,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (21185,0,0,0,0,0x0000000000000000,0x00000004,0,10),
  (23552,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (24398,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (24932,0,0,0,0,0x0000000000000000,0x00001000,0,6),
  (25469,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (25472,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (25477,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (29441,0,0,0,0,0x0000000000000000,0x01000000,0,1),
  (29444,0,0,0,0,0x0000000000000000,0x01000000,0,1),
  (29445,0,0,0,0,0x0000000000000000,0x01000000,0,1),
  (29446,0,0,0,0,0x0000000000000000,0x01000000,0,1),
  (29447,0,0,0,0,0x0000000000000000,0x01000000,0,1),
  (30881,0,0,0,0,0x0000000000000000,0x00008000,0,5),
  (30883,0,0,0,0,0x0000000000000000,0x00008000,0,5),
  (30884,0,0,0,0,0x0000000000000000,0x00008000,0,5),
  (30885,0,0,0,0,0x0000000000000000,0x00008000,0,5),
  (30886,0,0,0,0,0x0000000000000000,0x00008000,0,5),
  (32593,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (32594,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (32734,0,0,0,0,0x0000000000000000,0x00000002,0,3),
  (32837,0,0,0,0,0x0000000000000000,0x00004000,0,45),
  (33736,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (33746,0,0,0,0,0x0000000000000000,0x00000004,0,10),
  (33757,0,0,0,0,0x0000000000000000,0x00000001,0,3),
  (33759,0,0,0,0,0x0000000000000000,0x00000004,0,10),
  (34355,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (34935,0,0,0,0,0x0000000000000000,0x00000002,0,8),
  (34938,0,0,0,0,0x0000000000000000,0x00000002,0,8),
  (34939,0,0,0,0,0x0000000000000000,0x00000002,0,8),
  (34827,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (35077,0,0,0,0,0x0000000000000000,0x00008000,0,60),
  (35080,0,0,0,0,0x0000000000000000,0x00000001,0,60),
  (35083,0,0,0,0,0x0000000000000000,0x00020000,0,60),
  (35086,0,0,0,0,0x0000000000000000,0x08020000,0,60),
  (37173,0,0,0,8,0x000001062CBC0598,0x000A0001,0,30),
  (37189,0,0,0,10,0x0000000000006000,0x10000000,0,60),
  (37197,0,0,0,0,0x0000000000000000,0x00004000,0,45),
  (37227,0,0,0,11,0x00000000000001C0,0x10000000,0,60),
  (37655,0,0,0,0,0x0000000000000000,0x00004000,0,60),
  (38334,0,0,0,0,0x0000000000000000,0x00004000,0,60),
  (39027,0,0,0,0,0x0000000000000000,0x00100402,0,3),
  (39958,0,0,0,0,0x0000000000000000,0x00000001,0.7,40),
  (40899,0,0,0,0,0x0000000000000000,0x00000001,0,3),
  (41260,0,0,0,0,0x0000000000000000,0x00000004,0,10),
  (41262,0,0,0,0,0x0000000000000000,0x00000004,0,10),
  (42135,0,0,0,7,0x0000044000000000,0x00100402,0,90),
  (42136,0,0,0,7,0x0000044000000000,0x00100402,0,90),
  (43737,0,0,0,7,0x0000044000000000,0x00000001,0,10),
  (45054,0,0,0,0,0x0000000000000000,0x00020000,0,15),
  (45057,0,0,0,0,0x0000000000000000,0x00000002,0,30),
  (45354,0,0,0,0,0x0000000000000000,0x00000001,0,45),
  (45481,0,0,0,0,0x0000000000000000,0x08020000,0,45),
  (45482,0,0,0,0,0x0000000000000000,0x00080001,0,45),
  (45483,0,0,0,0,0x0000000000000000,0x00080001,0,45),
  (45484,0,0,0,0,0x0000000000000000,0x08000000,0,45),
  (46569,0,0,0,0,0x0000000000000000,0x00004000,0,45);

  DELETE FROM spell_proc_event WHERE entry IN (43741);
  INSERT INTO spell_proc_event (entry, SchoolMask, Category, SkillID, SpellFamilyName, SpellFamilyMask, procFlags, ppmRate, cooldown) VALUES
  (43741,0,0,0,10,0x0000000080000000,0x00004000,0,0);

-- 6538
DELETE FROM spell_proc_event WHERE entry IN(34774);
INSERT INTO `spell_proc_event` VALUES
(34774,0,0,0,0,0x0000000000000000,0x00080001,1.5,20);
