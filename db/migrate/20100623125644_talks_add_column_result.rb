class TalksAddColumnResult < ActiveRecord::Migration
  def self.up
  	add_column :talks, :result, :text
  end

  def self.down
  	remove_column :talks, :result
  end
end
