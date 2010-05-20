class Contact < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  validates_numericality_of :height, :weight, :age
  validates_numericality_of :age, :greater_than => 14, :less_than => 132
end
