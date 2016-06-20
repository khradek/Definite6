class Event < ActiveRecord::Base
	validates :start_time, presence: { message: "Cannot be blank" }
	validates	:end_time, :presence => true

	has_many :scripts, dependent: :destroy
	has_many :plays, dependent: :destroy
	belongs_to :user

	after_update :update_script
	after_destroy :delete_script

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

	#Provides the actual script's event ID - used for the link in the script update modal
	def linked_event
		linked_script = Script.find_by(id: self.script_tag)
		linked_event = linked_script.event_id
	end


	#Adds 10 seconds to the end time of Install, Script, and Game Call Sheet so the event stretches to the end date in the calendar
	before_save :add_time
	private
	def add_time
		if self.event_type == "Install" || self.event_type == "Script" || self.event_type == "Game Call Sheet"
			self.end_time = self.end_time + 10.seconds
		end
	end
end
