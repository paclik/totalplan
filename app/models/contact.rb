class Contact < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
  validates_numericality_of :height, :weight, :age
end
