class BudgetExpenseCategory < ActiveRecord::Base
	belongs_to :budget_expense
	has_many :budget_expense_transactions
	has_many :transactions
end