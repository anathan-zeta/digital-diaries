class CreateBudgetExpenseTransactions < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_expense_transactions do |t|
			t.string :name, :null => false
			t.integer :budget_expense_category_id, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.datetime :transaction_date, :null => false
			t.timestamps
			t.index ["budget_expense_category_id"], name: "index_on_budget_expense_category_id"
		end
	end
end