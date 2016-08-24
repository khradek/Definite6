class SavedFormation < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s\-_@#&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  
	belongs_to :user
	
	default_scope { order("priority ASC") }

	after_create :set_priority

	#Sets the priority to 1,000 after create (needed to avoid nil for production/to have most recently created at bottom of list)
	def set_priority
		self.update_attribute(:priority, 1000)
	end
	
end
