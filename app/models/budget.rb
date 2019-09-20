class Budget < ActiveRecord::Base
	belongs_to :user
	has_many :budget_incomes
	def new_income(amount)
		self.actual_income += amount
	end
	def remove_income(amount)
		self.actual_income -= amount
	end
end