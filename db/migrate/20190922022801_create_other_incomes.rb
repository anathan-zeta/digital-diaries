class CreateOtherIncomes < ActiveRecord::Migration[6.0]
	def change
		create_table :other_incomes do |t|
			t.string :name, :null => false
			t.integer :user_id, :null => false
			t.float :amount, :null => false, :default => 0.0
			t.string :status, :null => false, :default => "inactive"
			t.timestamps
			t.index ["user_id"], name: "index_on_user_id"
		end
	end
end