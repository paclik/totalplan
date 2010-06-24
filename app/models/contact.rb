class Contact < ActiveRecord::Base
  belongs_to :body_type
  has_one :talk
  accepts_nested_attributes_for :talk
  validates_presence_of :last_name
  #validates_numericality_of :height, :weight, :age
	def validate 
		#errors.add("chyba -","Vyplnit bud mobil nebo pevna") if mob_phone.blank? && land_line.blank? 
		#errors.add("chyba -","Vyplnit bud mobil nebo pevna") if mob_phone.blank? && land_line.blank? 
	end 
	def full_name
		#contact.last_name if contact
		
	end	
   	
end
