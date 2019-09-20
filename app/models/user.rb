class User < ActiveRecord::Base
	has_many :cards
	has_many :bank_accounts
	has_many :budgets
end