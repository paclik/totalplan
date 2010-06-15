class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.integer :contact_id
      t.datetime :call_when_time
      t.boolean :finished
      t.boolean :poradna
      t.date :poradna_when
      t.boolean :informace_zajem
      t.text :poznamka

      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
