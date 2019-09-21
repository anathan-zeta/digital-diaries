class BudgetExpenseCategories < ActiveRecord::Base
	belongs_to :budget_expense
	has_many :budget_expense_transactions
end