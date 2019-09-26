class Transaction < ActiveRecord::Base
	belongs_to :bank_account, optional: true
	belongs_to :card, optional: true
	belongs_to :other_income, optional: true
	belongs_to :budget, optional: true
	belongs_to :budget_income, optional: true
	belongs_to :budget_expense, optional: true
	belongs_to :budget_expense_category, optional: true
	belongs_to :budget_bucket, optional: true
end
