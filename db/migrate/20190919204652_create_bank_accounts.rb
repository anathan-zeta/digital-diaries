class CreateBankAccounts < ActiveRecord::Migration[5.2]
	def change
		create_table :bank_accounts do |t|
			t.string :name, :null => false
			t.integer :user_id, :null => false
			t.string :bank_account_type, :null => false
			t.string :bank, :null => false
			t.float :balance, :null => false, :default => 0.0
			t.float :minimum_balance, :null => false, :default => 0.0
			t.datetime :active_since, :null => false
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["user_id"], name: "index_on_user_id"
		end
	end
end