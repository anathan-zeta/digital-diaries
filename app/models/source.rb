class Source < ActiveRecord::Base
	belongs_to :bank_account

	def income(amount)
		self.balance += amount
		self.bank_account.income(amount)
	end

	def expense(amount)
		self.balance -= amount
		self.bank_account.expense(amount)
	end

end
