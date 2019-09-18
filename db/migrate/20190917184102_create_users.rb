class CreateUsers < ActiveRecord::Migration[5.2]
	def change
		create_table :users do |t|
			t.string :first_name, :null => false
			t.string :last_name, :null => false
			t.string :display_name, :null => false
			t.string :uid, :null => false
			t.string :email, :null => false
			t.string :phone, :null => false
			t.string :access_key, :null => false
			t.string :password, :null => false
			t.string :status, :null => false, :default => "inactive"
			t.index ["uid"], name: "index_on_uid", unique: true
			t.index ["email"], name: "index_on_email", unique: true
			t.index ["phone"], name: "index_on_phone", unique: true
			t.index ["access_key"], name: "index_on_access_key", unique: true
		end
	end
end