class Play < ActiveRecord::Base

	belongs_to :event
	belongs_to :user

	default_scope { order("priority ASC") }	

	def fullname
  	fullname = "#{piece1} #{piece2}"
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
