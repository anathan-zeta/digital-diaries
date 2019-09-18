class Card < ActiveRecord::Base
	has_many :statements
	belongs_to :users

	def active?
		self.status == "active" ? true : false
	end

	def statement_date=(date)
		if date.present? && date < 31
			self.statement_date = date
		end
	end

	def purchase_target_per_month
		if self.renew_fees_waiver < self.ytd_usage
			value = 0 
		else
			months=(DateTime.strptime(self.next_renew_date, "%Y-%m-%d %H:%M:%S") - DateTime.now).to_i/30
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
		self.status = "inactive"
		self.save!
	end

	def activate
		self.status = "active"
		self.save!
	end

end