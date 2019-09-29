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

	def planned_income_expense_diff
		self.budget_incomes.sum(:final_amount) - self.budget_expenses.sum(:planned_allotment_amount)
	end

	def income_amount
		self.budget_incomes.sum(:final_amount)
	end

	def expense_amount
		self.transactions.where(transaction_type: "debit", status: "active").sum(:amount) - (self.transactions.where(transaction_type: "credit", status: "status").sum(:amount) + self.transactions.where(transaction_type: "reversed", status: "active").sum(:amount))
	end

	def income_expense_diff
		self.income_amount - self.expense_amount
	end

	def expense_allotment_amount
		self.budget_expenses.sum(:final_allotment_amount)
	end
end