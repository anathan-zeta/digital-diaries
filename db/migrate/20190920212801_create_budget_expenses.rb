class CreateBudgetExpenses < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_expenses do |t|
			t.string :name, :null => false
			t.integer :budget_id, :null => false
			t.float :planned_allotment_amount, :null => false, :default => 0.0
			t.float :final_allotment_amount, :null => false, :default => 0.0
			t.float :spent_amount, :null => false, :default => 0.0
			t.float :balance, :null => false, :default => 0.0
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["budget_id"], name: "index_on_budget_id"
		end
	end
end