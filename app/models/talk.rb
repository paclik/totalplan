class Talk < ActiveRecord::Base
	belongs_to :contact
	belongs_to :script
end
