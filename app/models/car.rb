class Car < ActiveRecord::Base
	
	validates :brand, presence:true
	
	validates :model, presence: true

	validates :year, presence: true

	validates :km, presence: true

	validates :value, presence: true 

	def usados?
		km > 0
	end
end
