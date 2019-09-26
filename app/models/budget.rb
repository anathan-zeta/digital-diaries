class Budget < ActiveRecord::Base
	belongs_to :user
	has_many :budget_incomes
	has_many :budget_expenses
	has_many :budget_buckets
	has_many :transactions
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
	def expense_plan_on_track?
		budget.budget_incomes.sum(:final_amount) >= budget.budget_expenses.sum(:final_allotment_amount)
	end
	def expense_on_track?
		budget_income=budget.budget_incomes.sum(:final_amount) >= budget.budget_expenses.sum(:spent_amount)
	end
end