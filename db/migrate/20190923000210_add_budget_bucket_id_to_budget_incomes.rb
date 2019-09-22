class AddBudgetBucketIdToBudgetIncomes < ActiveRecord::Migration[6.0]
	def change
		add_column :budget_incomes, :budget_bucket_id, :integer, :null => false
		add_index :budget_incomes, [:budget_bucket_id], name: :index_on_budget_bucket_id
	end
end