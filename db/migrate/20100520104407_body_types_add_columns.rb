class BodyTypesAddColumns < ActiveRecord::Migration
  def self.up
     add_column :body_types, :type_expl_cz, :string, :default => ""
     add_column :body_types, :type_expl_en, :string, :default => ""

  end

  def self.down
     remove_column :body_types, :type_expl_cz
     remove_column :body_types, :type_expl_en

  end
end
