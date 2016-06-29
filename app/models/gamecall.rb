class Gamecall < ActiveRecord::Base

  validates :title, :start_time, :end_time, :presence => true

  belongs_to :event
  belongs_to :user
  
  after_create :gcmake_event
  before_update :gcupdate_event
  after_destroy :gcdelete_event

  #Creates an event in the calendar for the game call sheet
  def gcmake_event
    Event.create :user_id => self.user_id, :gamecall_tag => self.id, :title => self.title, :start_time => self.start_time, :end_time => self.end_time, :event_type => "Gamecall"
  end

  #Updates the calendar event when the game call sheet is updated
  def gcupdate_event
    cal_event = Event.find_by(gamecall_tag: self.id)
    if cal_event.title != self.title || cal_event.start_time != self.start_time || cal_event.end_time != self.end_time
      cal_event.update :title => self.title, :start_time => self.start_time, :end_time => self.end_time 
    end      
  end

  #Deletes the calendar event when the game call sheet is deleted
  def gcdelete_event
    cal_event = Event.find_by(gamecall_tag: self.id)
    cal_event.destroy if cal_event
  end

end
