class CreateTransactions < ActiveRecord::Migration[6.0]
	def change
		create_table :transactions do |t|
			t.string :name, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.datetime :date, :null => false
			t.string :transaction_type, :null => false
			t.string :status, :null => false, :default => "inactive"
			t.integer :budget_id
			t.integer :budget_bucket_id
			t.integer :budget_expense_id
			t.integer :budget_expense_category_id
			t.timestamps
			t.references :source, polymorphic: true
			t.index ["budget_bucket_id"], name: "index_budget_bucket_id"
			t.index ["budget_id"], name: "index_on_budget_id"
			t.index ["budget_expense_id"], name: "index_on_budget_expense_id"
			t.index ["budget_expense_category_id"], name: "index_on_budget_expense_category_id"
		end
	end
end