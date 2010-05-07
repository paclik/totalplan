class CreateItems < ActiveRecord::Migration
  def self.up
    create_table "items",:force => true, :primary_key => :id, :options => "auto_increment = 200900001"  do |t|
        t.column "id",:integer 
        #id items
        t.column "intransport_id", :integer,              :default => 1
        #index do tabuulky preprav na sklad ... ...
        t.column "outtransport_id",:integer,              :default => 1
        #index do tabuulky preprav k zakaznikovi ...
        t.column "store_id",       :integer,              :default => 1
        #index do tabulky skladu kam bylo zboží navezeno a čeká na odvoz
        t.column "productid",      :string, :limit => 20
        #Jedinečné číslo výrobku od výrobce (např 73662917400)
        t.column "amb",      :string, :limit => 20
        # AMB order id
        t.column "sap",      :string, :limit => 20
        # SAP order id
        t.column "atl",      :string, :limit => 20
        # ATL order id
        t.column "mill",     :string, :limit => 25
        # jméno válcovny 
        t.column "customer",     :string, :limit => 40
        # jméno zákazníka pro ktereho je plech určen
        t.column "customerorder",     :string, :limit => 25
        # číslo objednavky od zakaznika
        t.column "partnumber",     :string, :limit => 25
        # cislo výrobku pro který je plech urcen (zrejme) 
        t.column "grade",        :string, :limit => 12
        #Jakost, třída - (grade,quality) {SCGA 440}
        t.column "pieces",         :integer,:limit => 3
        # celkový počet elementů (např tyčí), number of elements (e.g. rods) {40}
        t.column "meltage",        :string, :limit => 10
        # číslo tavby
        t.column "netweight",         :integer
        # celková hmotnost cistá (bez obalu) v kg
        t.column "grossweight",         :integer
        # celková hmotnost (s obalem) v kg
        t.column "thickness",         :float
        # tlustka materiálu v mm př 1,2 mm
        t.column "width",         :integer
        # sirka materialu v mm př 1200 mm
        t.column "design",         :string, :limit => 10
        #Tvar a průměr,(shape and diametr) {U 120}
        t.column "length",         :float,  :limit => 6
        #Délka v m, (length in m) {15,00} 
        t.column "length2",        :float,  :limit => 6
        #Délka v m, (length in m) {15.05} Length2 se udává pokud jsou v baliku ruzne delky materialu pak <length,legth2> je interval <nejkratsi,nejdelsi> 
        t.column "storno",         :boolean
        t.column "issued_who",     :string, :limit => 50
        t.column "issued_when",    :datetime
        t.column "change_who",     :string, :limit => 50
        t.column "change_when",    :datetime
        t.timestamps
    end
    add_index "items", ["productid"], :name => "productid_index"
      
    
  end

  def self.down
    drop_table :items
  end
end
