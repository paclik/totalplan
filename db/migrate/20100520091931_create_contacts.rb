class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :mob_phone
      t.string :land_line
      t.string :email
      t.decimal :height
      t.decimal :weight
      t.decimal :age
      t.integer :body_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
