class BudgetExpenseTransactions < ActiveRecord::Base
	belongs_to :budget_expense_category
	belongs_to :budget_bucket
end