class BudgetExpense < ActiveRecord::Base
	belongs_to :budget
	has_many :budget_expense_categories
	has_many :transactions
end