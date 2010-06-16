class TalksAddColumnScriptId < ActiveRecord::Migration
 def self.up
 	 add_column :talks, :script_id, :integer
  end

  def self.down
     remove_column :talks, :script_id
   end
end
