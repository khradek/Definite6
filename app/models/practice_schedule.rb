class PracticeSchedule < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s-_@#&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  validates :start_time, :presence => true

  belongs_to :event
  belongs_to :user

  after_create :psmake_event, :set_initial_schedule
  before_update :psupdate_event
  after_destroy :psdelete_event

  #Creates an event in the calendar for the practice schedule   
  def psmake_event
    Event.create :user_id => self.user_id, :practice_tag => self.id, :installps_event_id => self.event_id, :title => self.title, :start_time => self.start_time, :end_time => self.start_time, :event_type => "Practice Schedule"
  end

  #Updates the calendar event when the practice schedule is updated
  def psupdate_event
    cal_event = Event.find_by(practice_tag: self.id)
    if cal_event.title != self.title || cal_event.start_time != self.start_time
      cal_event.update :title => self.title, :start_time => self.start_time, :end_time => self.start_time
    end      
  end

  #Deletes the calendar event when the practice schedule is deleted
  def psdelete_event
    cal_event = Event.find_by(practice_tag: self.id)
    cal_event.destroy if cal_event
  end


  #Initial practice schedule
  def set_initial_schedule
    default_practice = DefaultPractice.find_by(user_id: self.user_id)
    self.update :p_data => default_practice.up_data
    self.update :p_format => default_practice.up_format
    self.update :p_class => default_practice.up_class
  end  

end
