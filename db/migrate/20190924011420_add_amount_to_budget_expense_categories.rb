class AddAmountToBudgetExpenseCategories < ActiveRecord::Migration[6.0]
	def change
		add_column :budget_expense_categories, :amount, :float, :null => false, :default =>0.0
	end
end