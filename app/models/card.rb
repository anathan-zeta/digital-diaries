class Card < ActiveRecord::Base
	belongs_to :user
	has_many :budget_buckets, as: :source
	has_many :statements
	has_many :transactions, as: :source

	module CARD_TYPE
	    CREDIT = 'credit'
	    DEBIT = 'debit'
	    FOOD_CARD = 'food_card'
	    FOREX = 'forex'
 	end

	def active?
		self.status == "active" ? true : false
	end

	def statement_date=(date)
		if date.between?(0,5)
			write_attribute(:statement_date, date)
		end
	end

	def purchase_target_per_month
		if self.renew_fees_waiver < self.ytd_usage
			value = 0 
		else
			months=(DateTime.strptime(self.next_renew_date, "%Y-%m-%d") - DateTime.now).to_i/30
			value = (self.renew_fees_waiver-self.ytd_usage)/months
		end
		value
	end

	def purchase_target
		if self.renew_fees_waiver < self.ytd_usage
			value = 0
		else
			self.renew_fees_waiver-self.ytd_usage
		end
	end

	def extend_next_renew_date
		extended_next_renew_date = (DateTime.strptime(self.next_renew_date, "%Y-%m-%d %H:%M:%S") + 365).strftime("%Y-%m-%d %H:%M:%S")
		write_attribute(:next_renew_date, extended_next_renew_date)
	end

	def deactivate
		write_attribute(:ytd_usage, ytd)
		self.status = "inactive"
		self.save!
	end

	def activate
		self.status = "active"
		self.save!
	end

	def target?
		self.renew_fees > 0 && self.renew_fees_waiver > 0
	end

	def mandatory_renewal_fees?
		self.renew_fees > 0 && self.renew_fees_waiver == 0
	end

	def renewal_fees?
		self.renew_fees > 0
	end

	def update_ytd(usage)
		ytd = self.ytd_usage+usage
		write_attribute(:ytd_usage, ytd)
	end

	def reversal_ytd(usage)
		ytd = self.ytd_usage-usage
		write_attribute(:ytd_usage, ytd)
	end

	def reset_ytd
		write_attribute(:ytd_usage, 0)
	end

	def current_statement_duration
		current_day = DateTime.now.day
		if current_day > self.statement_date
			start_date = DateTime.strptime('2001-02-03 00:00:00', '%Y-%m-%d %H:%M:%S')
		end
	end

end