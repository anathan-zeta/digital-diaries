class BudgetBucket < ActiveRecord::Base
	belongs_to :card
	belongs_to :bank_account
	belongs_to :other_income
	has_many :budget_incomes
	has_many :budget_expense_transactions
	belongs_to :budget

	def add_income(amount)
		self.amount += amount
	end
end