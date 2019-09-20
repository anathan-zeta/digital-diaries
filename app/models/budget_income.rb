class BudgetIncome < ActiveRecord::Base
	belongs_to :budget
	def final_amount(amount)
		self.final_amount = amount
		self.budget.actual_income += amount
	end
end