class BankAccount < ActiveRecord::Base
	belongs_to :users, optional: true
	has_many :sources
end