class TalksAddColumnDuration < ActiveRecord::Migration
  def self.up
  	add_column :talks, :start_time, :datetime
  	add_column :talks, :end_time, :datetime
  end

  def self.down
  	remove_column :talks, :start_time
  	remove_column :talks, :end_time
  end
end
