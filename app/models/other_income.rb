class OtherIncome < ActiveRecord::Base
	belongs_to :user
	has_many :budget_buckets
end