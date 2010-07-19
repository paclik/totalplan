class ContactAddColumnState < ActiveRecord::Migration
  def self.up
  	add_column :contacts, :state, :text
  end

  def self.down
    	remove_column :contacts, :state
  end
end
