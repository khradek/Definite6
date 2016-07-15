class Play < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  validate :piece1_or_piece2
  #validates_uniqueness_of :event_id, :scope => [:piece1, :piece2]

	default_scope { order(priority: :asc, created_at: :asc) }	

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
  
  #Determines if plays are duplicated in install
  def duplicate_play
    plays = Play.where(event_id: self.event_id)
    m_plays = plays.where('piece1 = ? and piece2 = ?', self.piece1, self.piece2)
    m_plays.length
  end

  private
    def piece1_or_piece2
      if piece1.blank? && piece2.blank?
        errors[:base] << "You must enter at least a formation or play name."
      end
    end
end
