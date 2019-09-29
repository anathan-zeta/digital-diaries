class OtherIncome < ActiveRecord::Base
	belongs_to :user
	has_many :budget_buckets, as: :source
	has_many :transactions, as: :source
end