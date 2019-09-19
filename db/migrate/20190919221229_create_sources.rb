class CreateSources < ActiveRecord::Migration[6.0]
	def change 
		create_table :sources do |t|
			t.string :name, :null => false
			t.integer :bank_account_id, :null => false
			t.string :purpose, :null => false
			t.float :balance, :null => false, :default => 0.0
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["bank_account_id"], name: "index_on_bank_account_id"
		end
	end
end