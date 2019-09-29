class CreateBudgetBuckets < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_buckets do |t|
			t.string :name, :null => false
			t.integer :budget_id, :null => false
			t.string :bucket_type, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.timestamps
			t.index ["budget_id"], name: "index_on_budget_id"
		end
	end
end