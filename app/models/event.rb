class Event < ActiveRecord::Base
	validates :start_time, presence: { message: "Cannot be blank" }
	validates	:end_time, :presence => true
  validates :title, :presence => true

	has_many :scripts, dependent: :destroy
  has_many :gamecalls, dependent: :destroy
	has_many :plays, dependent: :destroy
	belongs_to :user

  before_validation :strip_whitespace, :end_time_check
	after_update :update_script, :update_gamecall
	after_destroy :delete_script, :delete_gamecall
  before_save :add_time


  #------Script------
	#Updates actual script when calendar event is updated
	def update_script
		if self.event_type == "Script"
			update_script = Script.find_by(id: self.script_tag)
			if update_script.title != self.title || update_script.start_time != self.start_time || update_script.end_time != self.end_time  
				update_script.update :title => self.title, :start_time => self.start_time, :end_time => self.end_time
			end	
		end
	end

	#Deletes the actual script when the calendar event is deleted
	def delete_script
		update_script = Script.find_by(id: self.script_tag)
		update_script.destroy if update_script
	end
  #------End script------


  #------Game Call Sheet------
  #Updates actual game call sheet when calendar event is updated
  def update_gamecall
    if self.event_type == "Gamecall"
      update_gamecall = Gamecall.find_by(id: self.gamecall_tag)
      if update_gamecall.title != self.title || update_gamecall.start_time != self.start_time || update_gamecall.end_time != self.end_time  
        update_gamecall.update :title => self.title, :start_time => self.start_time, :end_time => self.end_time
      end 
    end
  end

  #Deletes the actual game call sheet when the calendar event is deleted
  def delete_gamecall
    update_gamecall = Gamecall.find_by(id: self.gamecall_tag)
    update_gamecall.destroy if update_gamecall
  end
  #------End Game Call Sheet------

  private
  
  #Adds 10 seconds to the end time of Install, Script, and Game Call Sheet so the event stretches to the end date in the calendar
	def add_time
		if self.event_type == "Install" || self.event_type == "Script" || self.event_type == "Gamecall"
			self.end_time = self.end_time + 10.seconds
		end
	end

  #Removes whitespace from event title
  def strip_whitespace
    self.title = self.title.strip
  end

  #Ensures script and game call sheet event's end date is not after the start date (to avoid calendar event from stretching to multiple days)
  def end_time_check
    if self.event_type == "Script" || self.event_type == "Gamecall"
      if end_time > start_time
        self.end_time = start_time
      end
    end
  end
  
end
