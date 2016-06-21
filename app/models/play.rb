class Play < ActiveRecord::Base

	belongs_to :event
	belongs_to :user

	default_scope { order("priority ASC") }	

	after_create :set_priority

	def fullname
  	fullname = "#{piece1} #{piece2}"
  end

  #Supposed to set priority after created - doesn't work in production
  #first, try adding priority to strong params
  #try update_column(:priority, 1)
	def set_priority
		last_play = Play.where(event_id: self.event_id).last
		if last_play.priority.nil?
			self.update_attribute(:priority, 1)
		else
			my_priority = last_play.priority + 1
			self.update_attribute(:priority, my_priority) 
		end
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

end
