class AddBudgetBucketIdToBudgetBucketTransactions < ActiveRecord::Migration[6.0]
	def change 
		add_column :budget_expense_transactions, :budget_bucket_id, :integer, :null => false
		add_index :budget_expense_transactions,  [:budget_bucket_id], name: :index_on_budget_bucket_id
	end
end