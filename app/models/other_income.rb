class OtherIncome < ActiveRecord::Base
	belongs_to :user
	belongs_to :budget_bucket
end