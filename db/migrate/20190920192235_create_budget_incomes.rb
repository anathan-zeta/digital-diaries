class CreateBudgetIncomes < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_incomes do |t|
			t.string :name, :null => false
			t.integer :budget_id, :null => false
			t.integer :budget_bucket_id, :null => false
			t.float :planned_amount, :null => false, :default => 0.0
			t.float :final_amount, :null => false, :default => 0.0
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["budget_id"], name: "index_on_budget_id"
			t.index ["budget_bucket_id"], name: "index_on_budget_bucket_id"
		end
	end
end