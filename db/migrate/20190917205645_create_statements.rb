class CreateStatements < ActiveRecord::Migration[5.2]
	def change
		create_table :statements do |t|
			t.integer :card_id, :null => false
			t.string :statement_month_year, :null => false
			t.string :statement_generation_date, :null => false
			t.string :statement_due_date, :null => false
			t.string :payment_date
			t.float :previous_balance, :null => false, :default => 0.0
			t.float :current_expense, :null => false, :default => 0.0
			t.float :total_due, :null => false, :default => 0.0
			t.float :minimum_due, :null => false, :default => 0.0
			t.float :credit_limit, :null => false, :default => 0.0
			t.float :available_credit_limit, :null => false, :default => 0.0
			t.float :total_payment_done, :null => false, :default => 0.0
			t.string :payment_status, :null => false, :default => "not_paid"
			t.index ["card_id"], name: "index_on_card_id"
		end
	end
end