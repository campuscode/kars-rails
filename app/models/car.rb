class Car < ActiveRecord::Base
	scope :usados, -> { where ("km > 0") }
	scope :novos,  -> { where ("km == 0 and value < 100000") }
	scope :luxos,   -> { where ("km == 0 and value >= 100000") }
	
	validates :brand, :model, :year, :km, :value, presence: true 

	def usados?
		km > 0
	end
end
