class Play < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  validate :piece1_or_piece2 

  title_regex = /\A[a-zA-Z\d\s\-_@#&\/\$]*\z/
  validates :piece1, format: { with: title_regex }
  validates :piece2, format: { with: title_regex }

	default_scope { order(priority: :asc, created_at: :asc) }	

  scope :opener, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener')}
  scope :opener_left, -> { opener.where('hash_mark = ?', 'Left')}
  scope :opener_right, -> { opener.where('hash_mark = ?', 'Right')}

	after_create :set_priority

	def fullname
  	fullname = "#{piece1} #{piece2}"
  end

  #Sets the priority to 1,000 after create (needed to avoid nil for production/to have most recently created at bottom of list)
	def set_priority
		self.update_attribute(:priority, 1000)
	end

	#Counts the number of times play is shown in the install's scripts
	def play_count
		scripts = Script.where(event_id: self.event_id).select("sdata")
		s_string = ""
		scripts.each do |script|
			tring = script.sdata.to_s
			s_string << tring
		end

		def count_em(string, substring)
  		string.scan(/(?=#{substring})/).count
		end

		play_count = count_em(s_string, self.fullname)
	end	
  
  private
    def piece1_or_piece2
      if piece1.blank? && piece2.blank?
        errors[:base] << "You must enter at least a formation or play name."
      end
    end
end
