class CreateBudgetExpenseCategories < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_expense_categories do |t|
			t.string :name, :null => false
			t.integer :budget_expense_id, :null => false
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["budget_expense_id"], name: "index_on_budget_expense_id"
		end
	end
end