class BudgetBucket < ActiveRecord::Base
	
	has_many :budget_incomes
	has_many :budget_expense_transactions
	has_many :transactions
	belongs_to :budget

	def add_income(amount)
		self.amount += amount
	end

	def balance
		self.budget_incomes.sum(:final_amount) - (self.transactions.where(status: "active", transaction_type: "debit").sum(:amount) - self.transactions.where(status: "active", transaction_type: "credit").sum(:amount))
	end

	def income
		self.budget_incomes.sum(:final_amount)
	end

	def expense
		self.transactions.where(status: "active", transaction_type: "debit").sum(:amount) - self.transactions.where(status: "active", transaction_type: "credit").sum(:amount)
	end
end