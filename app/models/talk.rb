class Talk < ActiveRecord::Base
	belongs_to :contact
	belongs_to :script
	validates_presence_of :contact_id
	
  cattr_reader :per_page
  @@per_page = 30

	
	def contact_name
			contact.last_name if contact
	end
	
		
	def contact_name=(name)
		self.contact = Contact.find_by_last_name(name) unless name.blank?
	end
	

end
