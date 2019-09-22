class Budget < ActiveRecord::Base
	belongs_to :user
	has_many :budget_incomes
	has_many :budget_expenses
	has_many :budget_buckets
	def new_income(amount)
		self.actual_income += amount
	end
	def remove_income(amount)
		self.actual_income -= amount
	end
	def new_expense(amount)
		self.actual_expense += amount
	end
	def remove_expense(amount)
		self.actual_expense -= amount
	end
	def new_planned_income(amount)
		self.planned_income += amount
	end
	def remove_planned_income(amount)
		self.planned_income -= amount
	end
	def new_planned_expense(amount)
		self.planned_expense += amount
	end
	def remove_planned_expense(amount)
		self.planned_expense -= amount
	end
end