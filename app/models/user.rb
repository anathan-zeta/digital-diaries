class User < ActiveRecord::Base
	has_many :cards
	has_many :bank_accounts
	has_many :budgets
	has_many :other_incomes
end