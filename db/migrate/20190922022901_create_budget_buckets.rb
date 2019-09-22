class CreateBudgetBuckets < ActiveRecord::Migration[6.0]
	def change
		create_table :budget_buckets do |t|
			t.string :name, :null => false
			t.integer :budget_id, :null => false
			t.integer :bank_account_id
			t.integer :card_id
			t.integer :other_income_id
			t.string :bucket_type, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.timestamps
			t.index ["bank_account_id"], name: "index_on_bank_account_id"
			t.index ["card_id"], name: "index_on_card_id"
			t.index ["other_income_id"], name: "index_on_other_income_id"
			t.index ["budget_id"], name: "index_on_budget_id"
		end
	end
end