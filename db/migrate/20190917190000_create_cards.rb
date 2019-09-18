class CreateCards < ActiveRecord::Migration[5.2]
	def change
		create_table :cards do |t|
			t.string :name, :null=>false
			t.string :card_type, :null=>false
			t.string :card_subtype
			t.string :bank, :null=>false
			t.integer :user_id, :null => false
			t.integer :number, :null=>false, :default => 9999
			t.integer :limit, :null=>false, :default=>0
			t.integer :exp_date, :null=>false, :default=>1299
			t.string :next_renew_date, :null=>false, :default=>""
			t.float :joining_fees, :null=>false, :default=>0
			t.float :renew_fees, :null=>false, :default=>0
			t.float :renew_fees_waiver, :null=>false, :default=>0
			t.float :ytd_usage, :null=>false, :default=>0
			t.integer :statement_date, :null=>false, :default=>1
			t.integer :payment_date, :null=>false, :default=>1
			t.string :status, :null=>false, :default=>"inactive"
			t.timestamps
			t.index ["user_id"], name: "index_on_user_id"
		end
	end
end