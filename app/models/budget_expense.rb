class BudgetExpense < ActiveRecord::Base
	belongs_to :budget
	has_many :budget_expense_categories
	has_many :transactions

	def balance
		self.planned_allotment_amount - (self.transactions.where(status: "active", transaction_type: "debit").sum(:amount) - self.transactions.where(status: "active", transaction_type: "credit").sum(:amount))
	end
end