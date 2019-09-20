class Source < ActiveRecord::Base
	belongs_to :bank_account
	def flush_balance=(bal)
		self.bank_account = 
		final=self.balance + bal
		write_attribute(:balance, final)
	end
end