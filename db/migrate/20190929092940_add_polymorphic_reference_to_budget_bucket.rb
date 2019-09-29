class AddPolymorphicReferenceToBudgetBucket
	def change
		add_reference :budget_buckets, :source, polymorphic: true, index: true
	end
end

