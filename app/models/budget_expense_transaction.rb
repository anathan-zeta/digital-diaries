class BudgetExpenseTransactions < ActiveRecord::Base
	belongs_to :budget_expense_categories
end