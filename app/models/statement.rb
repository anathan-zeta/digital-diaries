class Statement < ActiveRecord::Base
	belongs_to :card
	def fetch_last_statement
		true
	end
end