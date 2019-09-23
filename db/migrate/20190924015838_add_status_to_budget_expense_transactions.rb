class AddStatusToBudgetExpenseTransactions < ActiveRecord::Migration[6.0]
	def change
		add_column :budget_expense_transactions, :status, :string, :null => false, :default => "inactive"
	end
end