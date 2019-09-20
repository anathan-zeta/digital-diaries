class CreateBudgets < ActiveRecord::Migration[6.0]
	def change
		create_table :budgets do |t|
			t.string :name, :null => false
			t.integer :user_id, :null => false
			t.datetime :start_date, :null => false
			t.datetime :end_date, :null => false
			t.float :planned_income, :null => false, :default => 0.0
			t.float :actual_income, :null => false, :default => 0.0
			t.float :planned_expense, :null => false, :default => 0.0
			t.float :actual_expense, :null => false, :default => 0.0
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["user_id"], name: "index_on_user_id"
		end
	end
end