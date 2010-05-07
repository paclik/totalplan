class CreateStates < ActiveRecord::Migration
  def self.up
    create_table "states", :force => true do |t|
      t.column "code",     :string,  :limit => 5,  :default => "", :null => false
      t.column "name",     :string,  :limit => 50
      t.column "block",    :boolean
      t.column "code_nov", :string,  :limit => 5,  :default => "", :null => false
      t.timestamps
    end
    execute "INSERT INTO states (id,code,name,block,code_nov) VALUES  (1,'ALB','Albania',0,'Al'),
       (2,'AND','Andorra',0,'AND'),
       (3,'AUT','Austria',0,'A'),
       (4,'BEL','Belgium',0,'B'),
       (5,'BGR','Bulgaria',0,'BG'),
       (6,'BIH','Bosnia and Herzegovina',0,'BIH'),
       (7,'BLR','Belarus',0,'BY'),
       (8,'BRD','Bundes Republik Deutschland',0,'BRD'),
       (9,'CHE','Switzerland',0,'CH'),
       (10,'CZE','Czech republic',0,'CZ'),
       (11,'DEU','Germany',1,'DEU'),
       (12,'DNK','Denmark',0,'DK'),
       (13,'ESP','Spain',0,'E'),
       (14,'EST','Estonia',0,'EST'),
       (15,'FIN','Finland',0,'SF'),
       (16,'FRA','France',0,'F'),
       (17,'GBR','United Kingdom',0,'GB'),
       (18,'GEO','Georgia (Gruzie)',0,'GEO'),
       (19,'GIB','Gibraltar',0,'GIB'),
       (20,'GRC','Greece',0,'GR'),
       (21,'GRL','Greenland (Grónsko)',0,'GRL'),
       (22,'HRV','Croatia',0,'HR'),
       (23,'HUN','Hungary',0,'H'),
       (24,'IRL','Ireland',0,'IRL'),
       (25,'ISL','Iceland',0,'ICL'),
       (26,'ISR','Israel',0,'ISR'),
       (27,'ITA','Italy',0,'I'),
       (28,'LIE','Liechtenstein',0,'LIE'),
       (29,'LTU','Lithuania (Litva)',0,'LT'),
       (30,'LUX','Luxembourg',0,'LUX');"
        
       execute "INSERT INTO states(id,code,name,block,code_nov) VALUES  (31,'LVA','Latvia (Lotyšsko)',0,'LOT'),
       (32,'MCO','Monaco',0,'MCO'),
       (33,'MDA','Moldova, Republic of',0,'MDA'),
       (34,'MKD','Macedonia, FYROM',0,'MAC'),
       (35,'MLT','Malta',0,'Ma'),
       (36,'MSR','Montserrat',0,'MSR'),
       (37,'NLD','Netherlands',0,'Nl'),
       (38,'NOR','Norway',0,'NOR'),
       (39,'POL','Poland',0,'PL'),
       (40,'PRT','Portugal',0,'P'),
       (41,'PSE','Palestinian Territory, Occupied',0,'PSE'),
       (42,'ROU','Romania',0,'RO'),
       (43,'RUS','Russian Federation',0,'RUS'),
       (44,'SCG','Serbia and Montenegro',0,'YU'),
       (45,'SMR','San Marino',0,'SMR'),
       (46,'SVK','Slovakia',0,'SK'),
       (47,'SVN','Slovenia',0,'SLO'),
       (48,'SWE','Sweden',0,'S'),
       (49,'SYR','Syrian Arab Republic',0,'SYR'),
       (50,'TUR','Turkey',0,'TR'),
       (51,'UKR','Ukraine',0,'UA'),
       (52,'VAT','Vatican - Holy See (Vatican City State)',0,'VAT'),
       (53,'---','unidentified',0,'ZZ');"
  end

  def self.down
    drop_table :states
  end
end
