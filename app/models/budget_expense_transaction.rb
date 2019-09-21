class BudgetExpenseTransactions < ActiveRecord::Base
	belongs_to :budget_expense_categories
	belongs_to :budget_buckets
end