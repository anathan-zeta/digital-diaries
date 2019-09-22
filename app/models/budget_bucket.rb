class BudgetBucket < ActiveRecord::Base
	has_many :cards
	has_many :bank_accounts
	has_many :other_incomes
	has_many :budget_incomes
	has_many :budget_expense_transactions
	belongs_to :budget

	def add_income(amount)
		self.amount += amount
	end
end