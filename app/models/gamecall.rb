class Gamecall < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s-_@#&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  validates :start_time, :end_time, :presence => true

  belongs_to :event
  belongs_to :user
  
  after_create :gcmake_event
  after_create :use_default_gamecall, :set_sit_title, if: :standard_gc_template
  after_create :use_custom_gamecall, if: :custom_gc_template
  before_update :gcupdate_event
  after_destroy :gcdelete_event

  before_validation :gc_set_end_time

  def standard_gc_template
    gamecall_template == "Standard"
  end 

  def custom_gc_template
    gamecall_template == "Custom"
  end

  #Sets the initial end date to equal the start date
  def gc_set_end_time
    if end_time.nil?
      self.end_time = start_time
    end
  end

  #Creates an event in the calendar for the game call sheet
  def gcmake_event
    Event.create :user_id => self.user_id, :gamecall_tag => self.id, :installgc_event_id => self.event_id, :title => self.title, :start_time => self.start_time, :end_time => self.end_time, :event_type => "Gamecall"
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

  def set_sit_title
    self.update :sit_title1 => self.user.s_name1, :sit_title2 => self.user.s_name2, :sit_title3 => self.user.s_name3, :sit_title4 => self.user.s_name4, :sit_title5 => self.user.s_name5, :sit_title6 => self.user.s_name6, :sit_title7 => self.user.s_name7, :sit_title8 => self.user.s_name8, :sit_title9 => self.user.s_name9, :sit_title10 => self.user.s_name10, :sit_title11 => self.user.s_name11, :sit_title12 => self.user.s_name12, :sit_title13 => self.user.s_name13, :sit_title14 => self.user.s_name14, :sit_color1 => self.user.sit1_color, :sit_color2 => self.user.sit2_color, :sit_color3 => self.user.sit3_color, :sit_color4 => self.user.sit4_color, :sit_color5 => self.user.sit5_color, :sit_color6 => self.user.sit6_color, :sit_color7 => self.user.sit7_color, :sit_color8 => self.user.sit8_color, :sit_color9 => self.user.sit9_color, :sit_color10 => self.user.sit10_color, :sit_color11 => self.user.sit11_color, :sit_color12 => self.user.sit12_color, :sit_color13 => self.user.sit13_color, :sit_color14 => self.user.sit14_color     
  end


  def use_custom_gamecall
    default_gamecall = DefaultGamecall.find_by(user_id: self.user_id)
    event = Event.find_by(id: self.event_id)
    new_data = default_gamecall.gc_data1
    new_data2 = default_gamecall.gc_data2

    #----------Openers----------
    openers = event.plays.where('situation1 = ?', true)
    openersLeft = openers.where('hash_mark = ?', 'Left')
    openersRight = openers.where('hash_mark = ?', 'Right')

    #Openers Left Hash
    unless openersLeft[0].nil?  
      openl1 = openersLeft[0].fullname 
    end
    unless openersLeft[1].nil?  
      openl2 = openersLeft[1].fullname 
    end
    unless openersLeft[2].nil?  
      openl3 = openersLeft[2].fullname 
    end
    unless openersLeft[3].nil?  
      openl4 = openersLeft[3].fullname 
    end
    unless openersLeft[4].nil?  
      openl5 = openersLeft[4].fullname 
    end
    unless openersLeft[5].nil?  
      openl6 = openersLeft[5].fullname 
    end
    unless openersLeft[6].nil?  
      openl7 = openersLeft[6].fullname 
    end
    unless openersLeft[7].nil?  
      openl8 = openersLeft[7].fullname 
    end
    unless openersLeft[8].nil?  
      openl9 = openersLeft[8].fullname 
    end
    unless openersLeft[9].nil?  
      openl10 = openersLeft[9].fullname 
    end
    unless openersLeft[10].nil?  
      openl11 = openersLeft[10].fullname 
    end
    unless openersLeft[11].nil?  
      openl12 = openersLeft[11].fullname 
    end
    unless openersLeft[12].nil?  
      openl13 = openersLeft[12].fullname 
    end
    unless openersLeft[13].nil?  
      openl14 = openersLeft[13].fullname 
    end  
    unless openersLeft[14].nil?  
      openl15 = openersLeft[14].fullname 
    end  
    unless openersLeft[15].nil?  
      openl16 = openersLeft[15].fullname 
    end
    unless openersLeft[16].nil?  
      openl17 = openersLeft[16].fullname 
    end
    unless openersLeft[17].nil?  
      openl18 = openersLeft[17].fullname 
    end
    unless openersLeft[18].nil?  
      openl19 = openersLeft[18].fullname 
    end  
    unless openersLeft[19].nil?  
      openl20 = openersLeft[19].fullname 
    end 

    #Openers Right Hash
    unless openersRight[0].nil?  
      openr1 = openersRight[0].fullname 
    end
    unless openersRight[1].nil?  
      openr2 = openersRight[1].fullname 
    end
    unless openersRight[2].nil?  
      openr3 = openersRight[2].fullname 
    end
    unless openersRight[3].nil?  
      openr4 = openersRight[3].fullname 
    end
    unless openersRight[4].nil?  
      openr5 = openersRight[4].fullname 
    end
    unless openersRight[5].nil?  
      openr6 = openersRight[5].fullname 
    end
    unless openersRight[6].nil?  
      openr7 = openersRight[6].fullname 
    end
    unless openersRight[7].nil?  
      openr8 = openersRight[7].fullname 
    end
    unless openersRight[8].nil?  
      openr9 = openersRight[8].fullname 
    end
    unless openersRight[9].nil?  
      openr10 = openersRight[9].fullname 
    end
    unless openersRight[10].nil?  
      openr11 = openersRight[10].fullname 
    end
    unless openersRight[11].nil?  
      openr12 = openersRight[11].fullname 
    end
    unless openersRight[12].nil?  
      openr13 = openersRight[12].fullname 
    end
    unless openersRight[13].nil?  
      openr14 = openersRight[13].fullname 
    end  
    unless openersRight[14].nil?  
      openr15 = openersRight[14].fullname 
    end         
    unless openersRight[15].nil?  
      openr16 = openersRight[15].fullname 
    end
    unless openersRight[16].nil?  
      openr17 = openersRight[16].fullname 
    end
    unless openersRight[17].nil?  
      openr18 = openersRight[17].fullname 
    end
    unless openersRight[18].nil?  
      openr19 = openersRight[18].fullname 
    end  
    unless openersRight[19].nil?  
      openr20 = openersRight[19].fullname 
    end 

    if openl1.nil?
      new_data.gsub! /Sit 1 Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 1\b/, openl1 
    end 
    if openl2.nil?
      new_data.gsub! /Sit 1 Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 2\b/, openl2 
    end   
    if openl3.nil?
      new_data.gsub! /Sit 1 Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 3\b/, openl3 
    end 
    if openl4.nil?
      new_data.gsub! /Sit 1 Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 4\b/, openl4 
    end 
    if openl5.nil?
      new_data.gsub! /Sit 1 Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 5\b/, openl5 
    end 
    if openl6.nil?
      new_data.gsub! /Sit 1 Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 6\b/, openl6 
    end 
    if openl7.nil?
      new_data.gsub! /Sit 1 Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 7\b/, openl7 
    end                     
    if openl8.nil?
      new_data.gsub! /Sit 1 Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 8\b/, openl8
    end    
    if openl9.nil?
      new_data.gsub! /Sit 1 Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 9\b/, openl9 
    end    
    if openl10.nil?
      new_data.gsub! /Sit 1 Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 10\b/, openl10 
    end 
    if openl11.nil?
      new_data.gsub! /Sit 1 Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 11\b/, openl11 
    end 
    if openl12.nil?
      new_data.gsub! /Sit 1 Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 12\b/, openl12 
    end   
    if openl13.nil?
      new_data.gsub! /Sit 1 Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 13\b/, openl13 
    end 
    if openl14.nil?
      new_data.gsub! /Sit 1 Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 14\b/, openl14 
    end 
    if openl15.nil?
      new_data.gsub! /Sit 1 Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 15\b/, openl15 
    end 
    if openl16.nil?
      new_data.gsub! /Sit 1 Lt Play 16\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 16\b/, openl16 
    end 
    if openl17.nil?
      new_data.gsub! /Sit 1 Lt Play 17\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 17\b/, openl17 
    end   
    if openl18.nil?
      new_data.gsub! /Sit 1 Lt Play 18\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 18\b/, openl18 
    end 
    if openl19.nil?
      new_data.gsub! /Sit 1 Lt Play 19\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 19\b/, openl19 
    end 
    if openl20.nil?
      new_data.gsub! /Sit 1 Lt Play 20\b/, " "
    else
      new_data.gsub! /Sit 1 Lt Play 20\b/, openl20 
    end 

    if openr1.nil?
      new_data.gsub! /Sit 1 Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 1\b/, openr1 
    end 
    if openr2.nil?
      new_data.gsub! /Sit 1 Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 2\b/, openr2 
    end   
    if openr3.nil?
      new_data.gsub! /Sit 1 Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 3\b/, openr3 
    end 
    if openr4.nil?
      new_data.gsub! /Sit 1 Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 4\b/, openr4 
    end 
    if openr5.nil?
      new_data.gsub! /Sit 1 Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 5\b/, openr5 
    end 
    if openr6.nil?
      new_data.gsub! /Sit 1 Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 6\b/, openr6 
    end 
    if openr7.nil?
      new_data.gsub! /Sit 1 Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 7\b/, openr7 
    end                     
    if openr8.nil?
      new_data.gsub! /Sit 1 Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 8\b/, openr8
    end    
    if openr9.nil?
      new_data.gsub! /Sit 1 Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 9\b/, openr9 
    end    
    if openr10.nil?
      new_data.gsub! /Sit 1 Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 10\b/, openr10 
    end 
    if openr11.nil?
      new_data.gsub! /Sit 1 Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 11\b/, openr11 
    end 
    if openr12.nil?
      new_data.gsub! /Sit 1 Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 12\b/, openr12 
    end   
    if openr13.nil?
      new_data.gsub! /Sit 1 Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 13\b/, openr13 
    end 
    if openr14.nil?
      new_data.gsub! /Sit 1 Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 14\b/, openr14 
    end 
    if openr15.nil?
      new_data.gsub! /Sit 1 Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 15\b/, openr15 
    end
    if openr11.nil?
      new_data.gsub! /Sit 1 Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 11\b/, openr11 
    end 
    if openr12.nil?
      new_data.gsub! /Sit 1 Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 12\b/, openr12 
    end   
    if openr13.nil?
      new_data.gsub! /Sit 1 Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 13\b/, openr13 
    end 
    if openr14.nil?
      new_data.gsub! /Sit 1 Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 14\b/, openr14 
    end 
    if openr15.nil?
      new_data.gsub! /Sit 1 Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 15\b/, openr15 
    end    
    if openr16.nil?
      new_data.gsub! /Sit 1 Rt Play 16\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 16\b/, openr16 
    end 
    if openr17.nil?
      new_data.gsub! /Sit 1 Rt Play 17\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 17\b/, openr17 
    end   
    if openr18.nil?
      new_data.gsub! /Sit 1 Rt Play 18\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 18\b/, openr18 
    end 
    if openr19.nil?
      new_data.gsub! /Sit 1 Rt Play 19\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 19\b/, openr19 
    end 
    if openr20.nil?
      new_data.gsub! /Sit 1 Rt Play 20\b/, " "
    else
      new_data.gsub! /Sit 1 Rt Play 20\b/, openr20 
    end   

    if openl1.nil?
      new_data2.gsub! /Sit 1 Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 1\b/, openl1 
    end 
    if openl2.nil?
      new_data2.gsub! /Sit 1 Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 2\b/, openl2 
    end   
    if openl3.nil?
      new_data2.gsub! /Sit 1 Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 3\b/, openl3 
    end 
    if openl4.nil?
      new_data2.gsub! /Sit 1 Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 4\b/, openl4 
    end 
    if openl5.nil?
      new_data2.gsub! /Sit 1 Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 5\b/, openl5 
    end 
    if openl6.nil?
      new_data2.gsub! /Sit 1 Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 6\b/, openl6 
    end 
    if openl7.nil?
      new_data2.gsub! /Sit 1 Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 7\b/, openl7 
    end                     
    if openl8.nil?
      new_data2.gsub! /Sit 1 Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 8\b/, openl8
    end    
    if openl9.nil?
      new_data2.gsub! /Sit 1 Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 9\b/, openl9 
    end    
    if openl10.nil?
      new_data2.gsub! /Sit 1 Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 10\b/, openl10 
    end 
    if openl11.nil?
      new_data2.gsub! /Sit 1 Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 11\b/, openl11 
    end 
    if openl12.nil?
      new_data2.gsub! /Sit 1 Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 12\b/, openl12 
    end   
    if openl13.nil?
      new_data2.gsub! /Sit 1 Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 13\b/, openl13 
    end 
    if openl14.nil?
      new_data2.gsub! /Sit 1 Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 14\b/, openl14 
    end 
    if openl15.nil?
      new_data2.gsub! /Sit 1 Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 15\b/, openl15 
    end 
    if openl16.nil?
      new_data2.gsub! /Sit 1 Lt Play 16\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 16\b/, openl16 
    end 
    if openl17.nil?
      new_data2.gsub! /Sit 1 Lt Play 17\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 17\b/, openl17 
    end   
    if openl18.nil?
      new_data2.gsub! /Sit 1 Lt Play 18\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 18\b/, openl18 
    end 
    if openl19.nil?
      new_data2.gsub! /Sit 1 Lt Play 19\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 19\b/, openl19 
    end 
    if openl20.nil?
      new_data2.gsub! /Sit 1 Lt Play 20\b/, " "
    else
      new_data2.gsub! /Sit 1 Lt Play 20\b/, openl20 
    end 

    if openr1.nil?
      new_data2.gsub! /Sit 1 Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 1\b/, openr1 
    end 
    if openr2.nil?
      new_data2.gsub! /Sit 1 Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 2\b/, openr2 
    end   
    if openr3.nil?
      new_data2.gsub! /Sit 1 Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 3\b/, openr3 
    end 
    if openr4.nil?
      new_data2.gsub! /Sit 1 Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 4\b/, openr4 
    end 
    if openr5.nil?
      new_data2.gsub! /Sit 1 Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 5\b/, openr5 
    end 
    if openr6.nil?
      new_data2.gsub! /Sit 1 Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 6\b/, openr6 
    end 
    if openr7.nil?
      new_data2.gsub! /Sit 1 Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 7\b/, openr7 
    end                     
    if openr8.nil?
      new_data2.gsub! /Sit 1 Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 8\b/, openr8
    end    
    if openr9.nil?
      new_data2.gsub! /Sit 1 Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 9\b/, openr9 
    end    
    if openr10.nil?
      new_data2.gsub! /Sit 1 Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 10\b/, openr10 
    end 
    if openr11.nil?
      new_data2.gsub! /Sit 1 Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 11\b/, openr11 
    end 
    if openr12.nil?
      new_data2.gsub! /Sit 1 Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 12\b/, openr12 
    end   
    if openr13.nil?
      new_data2.gsub! /Sit 1 Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 13\b/, openr13 
    end 
    if openr14.nil?
      new_data2.gsub! /Sit 1 Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 14\b/, openr14 
    end 
    if openr15.nil?
      new_data2.gsub! /Sit 1 Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 15\b/, openr15 
    end
    if openr11.nil?
      new_data2.gsub! /Sit 1 Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 11\b/, openr11 
    end 
    if openr12.nil?
      new_data2.gsub! /Sit 1 Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 12\b/, openr12 
    end   
    if openr13.nil?
      new_data2.gsub! /Sit 1 Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 13\b/, openr13 
    end 
    if openr14.nil?
      new_data2.gsub! /Sit 1 Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 14\b/, openr14 
    end 
    if openr15.nil?
      new_data2.gsub! /Sit 1 Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 15\b/, openr15 
    end    
    if openr16.nil?
      new_data2.gsub! /Sit 1 Rt Play 16\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 16\b/, openr16 
    end 
    if openr17.nil?
      new_data2.gsub! /Sit 1 Rt Play 17\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 17\b/, openr17 
    end   
    if openr18.nil?
      new_data2.gsub! /Sit 1 Rt Play 18\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 18\b/, openr18 
    end 
    if openr19.nil?
      new_data2.gsub! /Sit 1 Rt Play 19\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 19\b/, openr19 
    end 
    if openr20.nil?
      new_data2.gsub! /Sit 1 Rt Play 20\b/, " "
    else
      new_data2.gsub! /Sit 1 Rt Play 20\b/, openr20 
    end       
    #----------End Openers---------- 

    #----------1st/2nd & 10----------
    firstTens = event.plays.where('situation2 = ?', true)
     
    runFirstTens = firstTens.where('play_type = ?', 'Run')
    runFirstTensLeft = runFirstTens.where('hash_mark = ?', 'Left')
    runFirstTensRight = runFirstTens.where('hash_mark = ?', 'Right')
     
    passFirstTens = firstTens.where('play_type = ?', 'Pass')
    passFirstTensLeft = passFirstTens.where('hash_mark = ?', 'Left')
    passFirstTensRight = passFirstTens.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runFirstTensLeft[0].nil?  
      rftl1 = runFirstTensLeft[0].fullname 
    end
    unless runFirstTensLeft[1].nil?  
      rftl2 = runFirstTensLeft[1].fullname 
    end
    unless runFirstTensLeft[2].nil?  
      rftl3 = runFirstTensLeft[2].fullname 
    end
    unless runFirstTensLeft[3].nil?  
      rftl4 = runFirstTensLeft[3].fullname 
    end
    unless runFirstTensLeft[4].nil?  
      rftl5 = runFirstTensLeft[4].fullname 
    end
    unless runFirstTensLeft[5].nil?  
      rftl6 = runFirstTensLeft[5].fullname 
    end
    unless runFirstTensLeft[6].nil?  
      rftl7 = runFirstTensLeft[6].fullname 
    end
    unless runFirstTensLeft[7].nil?  
      rftl8 = runFirstTensLeft[7].fullname 
    end
    unless runFirstTensLeft[8].nil?  
      rftl9 = runFirstTensLeft[8].fullname 
    end
    unless runFirstTensLeft[9].nil?  
      rftl10 = runFirstTensLeft[9].fullname 
    end
    unless runFirstTensLeft[10].nil?  
      rftl11 = runFirstTensLeft[10].fullname 
    end
    unless runFirstTensLeft[11].nil?  
      rftl12 = runFirstTensLeft[11].fullname 
    end
    unless runFirstTensLeft[12].nil?  
      rftl13 = runFirstTensLeft[12].fullname 
    end
    unless runFirstTensLeft[13].nil?  
      rftl14 = runFirstTensLeft[13].fullname 
    end    
    unless runFirstTensLeft[14].nil?  
      rftl15 = runFirstTensLeft[14].fullname 
    end 

    if rftl1.nil?
      new_data.gsub! /Sit 2 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 1\b/, rftl1 
    end 
    if rftl2.nil?
      new_data.gsub! /Sit 2 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 2\b/, rftl2 
    end   
    if rftl3.nil?
      new_data.gsub! /Sit 2 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 3\b/, rftl3 
    end 
    if rftl4.nil?
      new_data.gsub! /Sit 2 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 4\b/, rftl4 
    end 
    if rftl5.nil?
      new_data.gsub! /Sit 2 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 5\b/, rftl5 
    end 
    if rftl6.nil?
      new_data.gsub! /Sit 2 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 6\b/, rftl6 
    end 
    if rftl7.nil?
      new_data.gsub! /Sit 2 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 7\b/, rftl7 
    end                     
    if rftl8.nil?
      new_data.gsub! /Sit 2 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 8\b/, rftl8
    end    
    if rftl9.nil?
      new_data.gsub! /Sit 2 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 9\b/, rftl9 
    end    
    if rftl10.nil?
      new_data.gsub! /Sit 2 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 10\b/, rftl10 
    end 
    if rftl11.nil?
      new_data.gsub! /Sit 2 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 11\b/, rftl11 
    end 
    if rftl12.nil?
      new_data.gsub! /Sit 2 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 12\b/, rftl12 
    end   
    if rftl13.nil?
      new_data.gsub! /Sit 2 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 13\b/, rftl13 
    end 
    if rftl14.nil?
      new_data.gsub! /Sit 2 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 14\b/, rftl14 
    end 
    if rftl15.nil?
      new_data.gsub! /Sit 2 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 2 Run Lt Play 15\b/, rftl15 
    end

    if rftl1.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 1\b/, rftl1 
    end 
    if rftl2.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 2\b/, rftl2 
    end   
    if rftl3.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 3\b/, rftl3 
    end 
    if rftl4.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 4\b/, rftl4 
    end 
    if rftl5.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 5\b/, rftl5 
    end 
    if rftl6.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 6\b/, rftl6 
    end 
    if rftl7.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 7\b/, rftl7 
    end                     
    if rftl8.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 8\b/, rftl8
    end    
    if rftl9.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 9\b/, rftl9 
    end    
    if rftl10.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 10\b/, rftl10 
    end 
    if rftl11.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 11\b/, rftl11 
    end 
    if rftl12.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 12\b/, rftl12 
    end   
    if rftl13.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 13\b/, rftl13 
    end 
    if rftl14.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 14\b/, rftl14 
    end 
    if rftl15.nil?
      new_data2.gsub! /Sit 2 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Lt Play 15\b/, rftl15 
    end

    #Run Right Hash
    unless runFirstTensRight[0].nil?  
      rftr1 = runFirstTensRight[0].fullname 
    end
    unless runFirstTensRight[1].nil?  
      rftr2 = runFirstTensRight[1].fullname 
    end
    unless runFirstTensRight[2].nil?  
      rftr3 = runFirstTensRight[2].fullname 
    end
    unless runFirstTensRight[3].nil?  
      rftr4 = runFirstTensRight[3].fullname 
    end
    unless runFirstTensRight[4].nil?  
      rftr5 = runFirstTensRight[4].fullname 
    end
    unless runFirstTensRight[5].nil?  
      rftr6 = runFirstTensRight[5].fullname 
    end
    unless runFirstTensRight[6].nil?  
      rftr7 = runFirstTensRight[6].fullname 
    end
    unless runFirstTensRight[7].nil?  
      rftr8 = runFirstTensRight[7].fullname 
    end
    unless runFirstTensRight[8].nil?  
      rftr9 = runFirstTensRight[8].fullname 
    end
    unless runFirstTensRight[9].nil?  
      rftr10 = runFirstTensRight[9].fullname 
    end
    unless runFirstTensRight[10].nil?  
      rftr11 = runFirstTensRight[10].fullname 
    end
    unless runFirstTensRight[11].nil?  
      rftr12 = runFirstTensRight[11].fullname 
    end
    unless runFirstTensRight[12].nil?  
      rftr13 = runFirstTensRight[12].fullname 
    end
    unless runFirstTensRight[13].nil?  
      rftr14 = runFirstTensRight[13].fullname 
    end
    unless runFirstTensRight[14].nil?  
      rftr15 = runFirstTensRight[14].fullname 
    end        

    if rftr1.nil?
      new_data.gsub! /Sit 2 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 1\b/, rftr1 
    end 
    if rftr2.nil?
      new_data.gsub! /Sit 2 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 2\b/, rftr2 
    end   
    if rftr3.nil?
      new_data.gsub! /Sit 2 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 3\b/, rftr3 
    end 
    if rftr4.nil?
      new_data.gsub! /Sit 2 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 4\b/, rftr4 
    end 
    if rftr5.nil?
      new_data.gsub! /Sit 2 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 5\b/, rftr5 
    end 
    if rftr6.nil?
      new_data.gsub! /Sit 2 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 6\b/, rftr6 
    end 
    if rftr7.nil?
      new_data.gsub! /Sit 2 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 7\b/, rftr7 
    end                     
    if rftr8.nil?
      new_data.gsub! /Sit 2 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 8\b/, rftr8
    end    
    if rftr9.nil?
      new_data.gsub! /Sit 2 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 9\b/, rftr9 
    end    
    if rftr10.nil?
      new_data.gsub! /Sit 2 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 10\b/, rftr10 
    end 
    if rftr11.nil?
      new_data.gsub! /Sit 2 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 11\b/, rftr11 
    end 
    if rftr12.nil?
      new_data.gsub! /Sit 2 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 12\b/, rftr12 
    end   
    if rftr13.nil?
      new_data.gsub! /Sit 2 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 13\b/, rftr13 
    end 
    if rftr14.nil?
      new_data.gsub! /Sit 2 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 14\b/, rftr14 
    end 
    if rftr15.nil?
      new_data.gsub! /Sit 2 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 2 Run Rt Play 15\b/, rftr15 
    end

    if rftr1.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 1\b/, rftr1 
    end 
    if rftr2.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 2\b/, rftr2 
    end   
    if rftr3.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 3\b/, rftr3 
    end 
    if rftr4.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 4\b/, rftr4 
    end 
    if rftr5.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 5\b/, rftr5 
    end 
    if rftr6.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 6\b/, rftr6 
    end 
    if rftr7.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 7\b/, rftr7 
    end                     
    if rftr8.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 8\b/, rftr8
    end    
    if rftr9.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 9\b/, rftr9 
    end    
    if rftr10.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 10\b/, rftr10 
    end 
    if rftr11.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 11\b/, rftr11 
    end 
    if rftr12.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 12\b/, rftr12 
    end   
    if rftr13.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 13\b/, rftr13 
    end 
    if rftr14.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 14\b/, rftr14 
    end 
    if rftr15.nil?
      new_data2.gsub! /Sit 2 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 2 Run Rt Play 15\b/, rftr15 
    end

    #Pass Left Hash
    unless passFirstTensLeft[0].nil?  
      pftl1 = passFirstTensLeft[0].fullname 
    end
    unless passFirstTensLeft[1].nil?  
      pftl2 = passFirstTensLeft[1].fullname 
    end
    unless passFirstTensLeft[2].nil?  
      pftl3 = passFirstTensLeft[2].fullname 
    end
    unless passFirstTensLeft[3].nil?  
      pftl4 = passFirstTensLeft[3].fullname 
    end
    unless passFirstTensLeft[4].nil?  
      pftl5 = passFirstTensLeft[4].fullname 
    end
    unless passFirstTensLeft[5].nil?  
      pftl6 = passFirstTensLeft[5].fullname 
    end
    unless passFirstTensLeft[6].nil?  
      pftl7 = passFirstTensLeft[6].fullname 
    end
    unless passFirstTensLeft[7].nil?  
      pftl8 = passFirstTensLeft[7].fullname 
    end
    unless passFirstTensLeft[8].nil?  
      pftl9 = passFirstTensLeft[8].fullname 
    end
    unless passFirstTensLeft[9].nil?  
      pftl10 = passFirstTensLeft[9].fullname 
    end
    unless passFirstTensLeft[10].nil?  
      pftl11 = passFirstTensLeft[10].fullname 
    end
    unless passFirstTensLeft[11].nil?  
      pftl12 = passFirstTensLeft[11].fullname 
    end
    unless passFirstTensLeft[12].nil?  
      pftl13 = passFirstTensLeft[12].fullname 
    end
    unless passFirstTensLeft[13].nil?  
      pftl14 = passFirstTensLeft[13].fullname 
    end    
    unless passFirstTensLeft[14].nil?  
      pftl15 = passFirstTensLeft[14].fullname 
    end 

    if pftl1.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 1\b/, pftl1 
    end 
    if pftl2.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 2\b/, pftl2 
    end   
    if pftl3.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 3\b/, pftl3 
    end 
    if pftl4.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 4\b/, pftl4 
    end 
    if pftl5.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 5\b/, pftl5 
    end 
    if pftl6.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 6\b/, pftl6 
    end 
    if pftl7.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 7\b/, pftl7 
    end                     
    if pftl8.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 8\b/, pftl8
    end    
    if pftl9.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 9\b/, pftl9 
    end    
    if pftl10.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 10\b/, pftl10 
    end 
    if pftl11.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 11\b/, pftl11 
    end 
    if pftl12.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 12\b/, pftl12 
    end   
    if pftl13.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 13\b/, pftl13 
    end 
    if pftl14.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 14\b/, pftl14 
    end 
    if pftl15.nil?
      new_data.gsub! /Sit 2 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Lt Play 15\b/, pftl15 
    end

    if pftl1.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 1\b/, pftl1 
    end 
    if pftl2.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 2\b/, pftl2 
    end   
    if pftl3.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 3\b/, pftl3 
    end 
    if pftl4.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 4\b/, pftl4 
    end 
    if pftl5.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 5\b/, pftl5 
    end 
    if pftl6.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 6\b/, pftl6 
    end 
    if pftl7.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 7\b/, pftl7 
    end                     
    if pftl8.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 8\b/, pftl8
    end    
    if pftl9.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 9\b/, pftl9 
    end    
    if pftl10.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 10\b/, pftl10 
    end 
    if pftl11.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 11\b/, pftl11 
    end 
    if pftl12.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 12\b/, pftl12 
    end   
    if pftl13.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 13\b/, pftl13 
    end 
    if pftl14.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 14\b/, pftl14 
    end 
    if pftl15.nil?
      new_data2.gsub! /Sit 2 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Lt Play 15\b/, pftl15 
    end

    #Pass Right Hash
    unless passFirstTensRight[0].nil?  
      pftr1 = passFirstTensRight[0].fullname 
    end
    unless passFirstTensRight[1].nil?  
      pftr2 = passFirstTensRight[1].fullname 
    end
    unless passFirstTensRight[2].nil?  
      pftr3 = passFirstTensRight[2].fullname 
    end
    unless passFirstTensRight[3].nil?  
      pftr4 = passFirstTensRight[3].fullname 
    end
    unless passFirstTensRight[4].nil?  
      pftr5 = passFirstTensRight[4].fullname 
    end
    unless passFirstTensRight[5].nil?  
      pftr6 = passFirstTensRight[5].fullname 
    end
    unless passFirstTensRight[6].nil?  
      pftr7 = passFirstTensRight[6].fullname 
    end   
    unless passFirstTensRight[7].nil?  
      pftr8 = passFirstTensRight[7].fullname 
    end
    unless passFirstTensRight[8].nil?  
      pftr9 = passFirstTensRight[8].fullname 
    end    
    unless passFirstTensRight[9].nil?  
      pftr10 = passFirstTensRight[9].fullname 
    end
    unless passFirstTensRight[10].nil?  
      pftr11 = passFirstTensRight[10].fullname 
    end
    unless passFirstTensRight[11].nil?  
      pftr12 = passFirstTensRight[11].fullname 
    end
    unless passFirstTensRight[12].nil?  
      pftr13 = passFirstTensRight[12].fullname 
    end
    unless passFirstTensRight[13].nil?  
      pftr14 = passFirstTensRight[13].fullname 
    end
    unless passFirstTensRight[14].nil?  
      pftr15 = passFirstTensRight[14].fullname 
    end

    if pftr1.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 1\b/, pftr1 
    end 
    if pftr2.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 2\b/, pftr2 
    end   
    if pftr3.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 3\b/, pftr3 
    end 
    if pftr4.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 4\b/, pftr4 
    end 
    if pftr5.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 5\b/, pftr5 
    end 
    if pftr6.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 6\b/, pftr6 
    end 
    if pftr7.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 7\b/, pftr7 
    end                     
    if pftr8.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 8\b/, pftr8
    end    
    if pftr9.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 9\b/, pftr9 
    end    
    if pftr10.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 10\b/, pftr10 
    end 
    if pftr11.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 11\b/, pftr11 
    end 
    if pftr12.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 12\b/, pftr12 
    end   
    if pftr13.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 13\b/, pftr13 
    end 
    if pftr14.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 14\b/, pftr14 
    end 
    if pftr15.nil?
      new_data.gsub! /Sit 2 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 2 Pass Rt Play 15\b/, pftr15 
    end

    if pftr1.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 1\b/, pftr1 
    end 
    if pftr2.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 2\b/, pftr2 
    end   
    if pftr3.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 3\b/, pftr3 
    end 
    if pftr4.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 4\b/, pftr4 
    end 
    if pftr5.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 5\b/, pftr5 
    end 
    if pftr6.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 6\b/, pftr6 
    end 
    if pftr7.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 7\b/, pftr7 
    end                     
    if pftr8.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 8\b/, pftr8
    end    
    if pftr9.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 9\b/, pftr9 
    end    
    if pftr10.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 10\b/, pftr10 
    end 
    if pftr11.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 11\b/, pftr11 
    end 
    if pftr12.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 12\b/, pftr12 
    end   
    if pftr13.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 13\b/, pftr13 
    end 
    if pftr14.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 14\b/, pftr14 
    end 
    if pftr15.nil?
      new_data2.gsub! /Sit 2 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 2 Pass Rt Play 15\b/, pftr15 
    end    
    #----------End 1st/2nd & 10----------

    #----------2nd & Long----------
    secondLongs = event.plays.where('situation3 = ?', true)
     
    runSecondLongs = secondLongs.where('play_type = ?', 'Run')
    runSecondLongsLeft = runSecondLongs.where('hash_mark = ?', 'Left')
    runSecondLongsRight = runSecondLongs.where('hash_mark = ?', 'Right')
     
    passSecondLongs = secondLongs.where('play_type = ?', 'Pass')
    passSecondLongsLeft = passSecondLongs.where('hash_mark = ?', 'Left')
    passSecondLongsRight = passSecondLongs.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondLongsLeft[0].nil?  
      rsll1 = runSecondLongsLeft[0].fullname 
    end
    unless runSecondLongsLeft[1].nil?  
      rsll2 = runSecondLongsLeft[1].fullname 
    end
    unless runSecondLongsLeft[2].nil?  
      rsll3 = runSecondLongsLeft[2].fullname 
    end
    unless runSecondLongsLeft[3].nil?  
      rsll4 = runSecondLongsLeft[3].fullname 
    end
    unless runSecondLongsLeft[4].nil?  
      rsll5 = runSecondLongsLeft[4].fullname 
    end
    unless runSecondLongsLeft[5].nil?  
      rsll6 = runSecondLongsLeft[5].fullname 
    end
    unless runSecondLongsLeft[6].nil?  
      rsll7 = runSecondLongsLeft[6].fullname 
    end
    unless runSecondLongsLeft[7].nil?  
      rsll8 = runSecondLongsLeft[7].fullname 
    end
    unless runSecondLongsLeft[8].nil?  
      rsll9 = runSecondLongsLeft[8].fullname 
    end
    unless runSecondLongsLeft[9].nil?  
      rsll10 = runSecondLongsLeft[9].fullname 
    end
    unless runSecondLongsLeft[10].nil?  
      rsll11 = runSecondLongsLeft[10].fullname 
    end
    unless runSecondLongsLeft[11].nil?  
      rsll12 = runSecondLongsLeft[11].fullname 
    end
    unless runSecondLongsLeft[12].nil?  
      rsll13 = runSecondLongsLeft[12].fullname 
    end
    unless runSecondLongsLeft[13].nil?  
      rsll14 = runSecondLongsLeft[13].fullname 
    end
    unless runSecondLongsLeft[14].nil?  
      rsll15 = runSecondLongsLeft[14].fullname 
    end

    if rsll1.nil?
      new_data.gsub! /Sit 3 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 1\b/, rsll1 
    end 
    if rsll2.nil?
      new_data.gsub! /Sit 3 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 2\b/, rsll2 
    end   
    if rsll3.nil?
      new_data.gsub! /Sit 3 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 3\b/, rsll3 
    end 
    if rsll4.nil?
      new_data.gsub! /Sit 3 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 4\b/, rsll4 
    end 
    if rsll5.nil?
      new_data.gsub! /Sit 3 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 5\b/, rsll5 
    end 
    if rsll6.nil?
      new_data.gsub! /Sit 3 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 6\b/, rsll6 
    end 
    if rsll7.nil?
      new_data.gsub! /Sit 3 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 7\b/, rsll7 
    end                     
    if rsll8.nil?
      new_data.gsub! /Sit 3 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 8\b/, rsll8
    end    
    if rsll9.nil?
      new_data.gsub! /Sit 3 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 9\b/, rsll9 
    end    
    if rsll10.nil?
      new_data.gsub! /Sit 3 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 10\b/, rsll10 
    end 
    if rsll11.nil?
      new_data.gsub! /Sit 3 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 11\b/, rsll11 
    end 
    if rsll12.nil?
      new_data.gsub! /Sit 3 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 12\b/, rsll12 
    end   
    if rsll13.nil?
      new_data.gsub! /Sit 3 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 13\b/, rsll13 
    end 
    if rsll14.nil?
      new_data.gsub! /Sit 3 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 14\b/, rsll14 
    end 
    if rsll15.nil?
      new_data.gsub! /Sit 3 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 3 Run Lt Play 15\b/, rsll15 
    end

    if rsll1.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 1\b/, rsll1 
    end 
    if rsll2.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 2\b/, rsll2 
    end   
    if rsll3.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 3\b/, rsll3 
    end 
    if rsll4.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 4\b/, rsll4 
    end 
    if rsll5.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 5\b/, rsll5 
    end 
    if rsll6.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 6\b/, rsll6 
    end 
    if rsll7.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 7\b/, rsll7 
    end                     
    if rsll8.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 8\b/, rsll8
    end    
    if rsll9.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 9\b/, rsll9 
    end    
    if rsll10.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 10\b/, rsll10 
    end 
    if rsll11.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 11\b/, rsll11 
    end 
    if rsll12.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 12\b/, rsll12 
    end   
    if rsll13.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 13\b/, rsll13 
    end 
    if rsll14.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 14\b/, rsll14 
    end 
    if rsll15.nil?
      new_data2.gsub! /Sit 3 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Lt Play 15\b/, rsll15 
    end

    #Run Right Hash
    unless runSecondLongsRight[0].nil?  
      rslr1 = runSecondLongsRight[0].fullname 
    end
    unless runSecondLongsRight[1].nil?  
      rslr2 = runSecondLongsRight[1].fullname 
    end
    unless runSecondLongsRight[2].nil?  
      rslr3 = runSecondLongsRight[2].fullname 
    end
    unless runSecondLongsRight[3].nil?  
      rslr4 = runSecondLongsRight[3].fullname 
    end
    unless runSecondLongsRight[4].nil?  
      rslr5 = runSecondLongsRight[4].fullname 
    end
    unless runSecondLongsRight[5].nil?  
      rslr6 = runSecondLongsRight[5].fullname 
    end
    unless runSecondLongsRight[6].nil?  
      rslr7 = runSecondLongsRight[6].fullname 
    end
    unless runSecondLongsRight[7].nil?  
      rslr8 = runSecondLongsRight[7].fullname 
    end
    unless runSecondLongsRight[8].nil?  
      rslr9 = runSecondLongsRight[8].fullname 
    end
    unless runSecondLongsRight[9].nil?  
      rslr10 = runSecondLongsRight[9].fullname 
    end    
    unless runSecondLongsRight[10].nil?  
      rslr11 = runSecondLongsRight[10].fullname 
    end
    unless runSecondLongsRight[11].nil?  
      rslr12 = runSecondLongsRight[11].fullname 
    end 
    unless runSecondLongsRight[12].nil?  
      rslr13 = runSecondLongsRight[12].fullname 
    end 
    unless runSecondLongsRight[13].nil?  
      rslr14 = runSecondLongsRight[13].fullname 
    end 
    unless runSecondLongsRight[14].nil?  
      rslr15 = runSecondLongsRight[14].fullname 
    end 

    if rslr1.nil?
      new_data.gsub! /Sit 3 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 1\b/, rslr1 
    end 
    if rslr2.nil?
      new_data.gsub! /Sit 3 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 2\b/, rslr2 
    end   
    if rslr3.nil?
      new_data.gsub! /Sit 3 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 3\b/, rslr3 
    end 
    if rslr4.nil?
      new_data.gsub! /Sit 3 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 4\b/, rslr4 
    end 
    if rslr5.nil?
      new_data.gsub! /Sit 3 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 5\b/, rslr5 
    end 
    if rslr6.nil?
      new_data.gsub! /Sit 3 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 6\b/, rslr6 
    end 
    if rslr7.nil?
      new_data.gsub! /Sit 3 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 7\b/, rslr7 
    end                     
    if rslr8.nil?
      new_data.gsub! /Sit 3 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 8\b/, rslr8
    end    
    if rslr9.nil?
      new_data.gsub! /Sit 3 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 9\b/, rslr9 
    end    
    if rslr10.nil?
      new_data.gsub! /Sit 3 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 10\b/, rslr10 
    end 
    if rslr11.nil?
      new_data.gsub! /Sit 3 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 11\b/, rslr11 
    end 
    if rslr12.nil?
      new_data.gsub! /Sit 3 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 12\b/, rslr12 
    end   
    if rslr13.nil?
      new_data.gsub! /Sit 3 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 13\b/, rslr13 
    end 
    if rslr14.nil?
      new_data.gsub! /Sit 3 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 14\b/, rslr14 
    end 
    if rslr15.nil?
      new_data.gsub! /Sit 3 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 3 Run Rt Play 15\b/, rslr15 
    end

    if rslr1.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 1\b/, rslr1 
    end 
    if rslr2.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 2\b/, rslr2 
    end   
    if rslr3.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 3\b/, rslr3 
    end 
    if rslr4.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 4\b/, rslr4 
    end 
    if rslr5.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 5\b/, rslr5 
    end 
    if rslr6.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 6\b/, rslr6 
    end 
    if rslr7.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 7\b/, rslr7 
    end                     
    if rslr8.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 8\b/, rslr8
    end    
    if rslr9.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 9\b/, rslr9 
    end    
    if rslr10.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 10\b/, rslr10 
    end 
    if rslr11.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 11\b/, rslr11 
    end 
    if rslr12.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 12\b/, rslr12 
    end   
    if rslr13.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 13\b/, rslr13 
    end 
    if rslr14.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 14\b/, rslr14 
    end 
    if rslr15.nil?
      new_data2.gsub! /Sit 3 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 3 Run Rt Play 15\b/, rslr15 
    end

    #Pass Left Hash
    unless passSecondLongsLeft[0].nil?  
      psll1 = passSecondLongsLeft[0].fullname 
    end
    unless passSecondLongsLeft[1].nil?  
      psll2 = passSecondLongsLeft[1].fullname 
    end
    unless passSecondLongsLeft[2].nil?  
      psll3 = passSecondLongsLeft[2].fullname 
    end
    unless passSecondLongsLeft[3].nil?  
      psll4 = passSecondLongsLeft[3].fullname 
    end
    unless passSecondLongsLeft[4].nil?  
      psll5 = passSecondLongsLeft[4].fullname 
    end  
    unless passSecondLongsLeft[5].nil?  
      psll6 = passSecondLongsLeft[5].fullname 
    end
    unless passSecondLongsLeft[6].nil?  
      psll7 = passSecondLongsLeft[6].fullname 
    end
    unless passSecondLongsLeft[7].nil?  
      psll8 = passSecondLongsLeft[7].fullname 
    end
    unless passSecondLongsLeft[8].nil?  
      psll9 = passSecondLongsLeft[8].fullname 
    end
    unless passSecondLongsLeft[9].nil?  
      psll10 = passSecondLongsLeft[9].fullname 
    end
    unless passSecondLongsLeft[10].nil?  
      psll11 = passSecondLongsLeft[10].fullname 
    end  
    unless passSecondLongsLeft[11].nil?  
      psll12 = passSecondLongsLeft[11].fullname 
    end 
    unless passSecondLongsLeft[12].nil?  
      psll13 = passSecondLongsLeft[12].fullname 
    end 
    unless passSecondLongsLeft[13].nil?  
      psll14 = passSecondLongsLeft[13].fullname 
    end 
    unless passSecondLongsLeft[14].nil?  
      psll15 = passSecondLongsLeft[14].fullname 
    end

    if psll1.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 1\b/, psll1 
    end 
    if psll2.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 2\b/, psll2 
    end   
    if psll3.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 3\b/, psll3 
    end 
    if psll4.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 4\b/, psll4 
    end 
    if psll5.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 5\b/, psll5 
    end 
    if psll6.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 6\b/, psll6 
    end 
    if psll7.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 7\b/, psll7 
    end                     
    if psll8.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 8\b/, psll8
    end    
    if psll9.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 9\b/, psll9 
    end    
    if psll10.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 10\b/, psll10 
    end 
    if psll11.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 11\b/, psll11 
    end 
    if psll12.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 12\b/, psll12 
    end   
    if psll13.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 13\b/, psll13 
    end 
    if psll14.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 14\b/, psll14 
    end 
    if psll15.nil?
      new_data.gsub! /Sit 3 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Lt Play 15\b/, psll15 
    end

    if psll1.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 1\b/, psll1 
    end 
    if psll2.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 2\b/, psll2 
    end   
    if psll3.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 3\b/, psll3 
    end 
    if psll4.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 4\b/, psll4 
    end 
    if psll5.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 5\b/, psll5 
    end 
    if psll6.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 6\b/, psll6 
    end 
    if psll7.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 7\b/, psll7 
    end                     
    if psll8.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 8\b/, psll8
    end    
    if psll9.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 9\b/, psll9 
    end    
    if psll10.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 10\b/, psll10 
    end 
    if psll11.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 11\b/, psll11 
    end 
    if psll12.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 12\b/, psll12 
    end   
    if psll13.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 13\b/, psll13 
    end 
    if psll14.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 14\b/, psll14 
    end 
    if psll15.nil?
      new_data2.gsub! /Sit 3 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Lt Play 15\b/, psll15 
    end

    #Pass Right Hash
    unless passSecondLongsRight[0].nil?  
      pslr1 = passSecondLongsRight[0].fullname 
    end
    unless passSecondLongsRight[1].nil?  
      pslr2 = passSecondLongsRight[1].fullname 
    end
    unless passSecondLongsRight[2].nil?  
      pslr3 = passSecondLongsRight[2].fullname 
    end
    unless passSecondLongsRight[3].nil?  
      pslr4 = passSecondLongsRight[3].fullname 
    end
    unless passSecondLongsRight[4].nil?  
      pslr5 = passSecondLongsRight[4].fullname 
    end  
    unless passSecondLongsRight[5].nil?  
      pslr6 = passSecondLongsRight[5].fullname 
    end 
    unless passSecondLongsRight[6].nil?  
      pslr7 = passSecondLongsRight[6].fullname 
    end
    unless passSecondLongsRight[7].nil?  
      pslr8 = passSecondLongsRight[7].fullname 
    end
    unless passSecondLongsRight[8].nil?  
      pslr9 = passSecondLongsRight[8].fullname 
    end
    unless passSecondLongsRight[9].nil?  
      pslr10 = passSecondLongsRight[9].fullname 
    end
    unless passSecondLongsRight[10].nil?  
      pslr11 = passSecondLongsRight[10].fullname 
    end  
    unless passSecondLongsRight[11].nil?  
      pslr12 = passSecondLongsRight[11].fullname 
    end   
    unless passSecondLongsRight[12].nil?  
      pslr13 = passSecondLongsRight[12].fullname 
    end
    unless passSecondLongsRight[13].nil?  
      pslr14 = passSecondLongsRight[13].fullname 
    end  
    unless passSecondLongsRight[14].nil?  
      pslr15 = passSecondLongsRight[14].fullname 
    end 

    if pslr1.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 1\b/, pslr1 
    end 
    if pslr2.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 2\b/, pslr2 
    end   
    if pslr3.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 3\b/, pslr3 
    end 
    if pslr4.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 4\b/, pslr4 
    end 
    if pslr5.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 5\b/, pslr5 
    end 
    if pslr6.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 6\b/, pslr6 
    end 
    if pslr7.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 7\b/, pslr7 
    end                     
    if pslr8.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 8\b/, pslr8
    end    
    if pslr9.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 9\b/, pslr9 
    end    
    if pslr10.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 10\b/, pslr10 
    end 
    if pslr11.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 11\b/, pslr11 
    end 
    if pslr12.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 12\b/, pslr12 
    end   
    if pslr13.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 13\b/, pslr13 
    end 
    if pslr14.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 14\b/, pslr14 
    end 
    if pslr15.nil?
      new_data.gsub! /Sit 3 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 3 Pass Rt Play 15\b/, pslr15 
    end    

    if pslr1.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 1\b/, pslr1 
    end 
    if pslr2.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 2\b/, pslr2 
    end   
    if pslr3.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 3\b/, pslr3 
    end 
    if pslr4.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 4\b/, pslr4 
    end 
    if pslr5.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 5\b/, pslr5 
    end 
    if pslr6.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 6\b/, pslr6 
    end 
    if pslr7.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 7\b/, pslr7 
    end                     
    if pslr8.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 8\b/, pslr8
    end    
    if pslr9.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 9\b/, pslr9 
    end    
    if pslr10.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 10\b/, pslr10 
    end 
    if pslr11.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 11\b/, pslr11 
    end 
    if pslr12.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 12\b/, pslr12 
    end   
    if pslr13.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 13\b/, pslr13 
    end 
    if pslr14.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 14\b/, pslr14 
    end 
    if pslr15.nil?
      new_data2.gsub! /Sit 3 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 3 Pass Rt Play 15\b/, pslr15 
    end          
    #----------End 2nd & Long -----------

    #----------3rd & Long ----------
    thirdLongs = event.plays.where('situation6 = ?', true)
     
    runThirdLongs = thirdLongs.where('play_type = ?', 'Run')
    runThirdLongsLeft = runThirdLongs.where('hash_mark = ?', 'Left')
    runThirdLongsRight = runThirdLongs.where('hash_mark = ?', 'Right')
     
    passThirdLongs = thirdLongs.where('play_type = ?', 'Pass')
    passThirdLongsLeft = passThirdLongs.where('hash_mark = ?', 'Left')
    passThirdLongsRight = passThirdLongs.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdLongsLeft[0].nil?  
      rtll1 = runThirdLongsLeft[0].fullname 
    end
    unless runThirdLongsLeft[1].nil?  
      rtll2 = runThirdLongsLeft[1].fullname 
    end
    unless runThirdLongsLeft[2].nil?  
      rtll3 = runThirdLongsLeft[2].fullname 
    end
    unless runThirdLongsLeft[3].nil?  
      rtll4 = runThirdLongsLeft[3].fullname 
    end
    unless runThirdLongsLeft[4].nil?  
      rtll5 = runThirdLongsLeft[4].fullname 
    end
    unless runThirdLongsLeft[5].nil?  
      rtll6 = runThirdLongsLeft[5].fullname 
    end
    unless runThirdLongsLeft[6].nil?  
      rtll7 = runThirdLongsLeft[6].fullname 
    end
    unless runThirdLongsLeft[7].nil?  
      rtll8 = runThirdLongsLeft[7].fullname 
    end
    unless runThirdLongsLeft[8].nil?  
      rtll9 = runThirdLongsLeft[8].fullname 
    end
    unless runThirdLongsLeft[9].nil?  
      rtll10 = runThirdLongsLeft[9].fullname 
    end
    unless runThirdLongsLeft[10].nil?  
      rtll11 = runThirdLongsLeft[10].fullname 
    end
    unless runThirdLongsLeft[11].nil?  
      rtll12 = runThirdLongsLeft[11].fullname 
    end
    unless runThirdLongsLeft[12].nil?  
      rtll13 = runThirdLongsLeft[12].fullname 
    end
    unless runThirdLongsLeft[13].nil?  
      rtll14 = runThirdLongsLeft[13].fullname 
    end
    unless runThirdLongsLeft[14].nil?  
      rtll15 = runThirdLongsLeft[14].fullname 
    end

    if rtll1.nil?
      new_data.gsub! /Sit 4 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 1\b/, rtll1 
    end 
    if rtll2.nil?
      new_data.gsub! /Sit 4 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 2\b/, rtll2 
    end   
    if rtll3.nil?
      new_data.gsub! /Sit 4 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 3\b/, rtll3 
    end 
    if rtll4.nil?
      new_data.gsub! /Sit 4 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 4\b/, rtll4 
    end 
    if rtll5.nil?
      new_data.gsub! /Sit 4 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 5\b/, rtll5 
    end 
    if rtll6.nil?
      new_data.gsub! /Sit 4 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 6\b/, rtll6 
    end 
    if rtll7.nil?
      new_data.gsub! /Sit 4 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 7\b/, rtll7 
    end                     
    if rtll8.nil?
      new_data.gsub! /Sit 4 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 8\b/, rtll8
    end    
    if rtll9.nil?
      new_data.gsub! /Sit 4 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 9\b/, rtll9 
    end    
    if rtll10.nil?
      new_data.gsub! /Sit 4 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 10\b/, rtll10 
    end 
    if rtll11.nil?
      new_data.gsub! /Sit 4 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 11\b/, rtll11 
    end 
    if rtll12.nil?
      new_data.gsub! /Sit 4 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 12\b/, rtll12 
    end   
    if rtll13.nil?
      new_data.gsub! /Sit 4 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 13\b/, rtll13 
    end 
    if rtll14.nil?
      new_data.gsub! /Sit 4 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 14\b/, rtll14 
    end 
    if rtll15.nil?
      new_data.gsub! /Sit 4 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 4 Run Lt Play 15\b/, rtll15 
    end

   if rtll1.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 1\b/, rtll1 
    end 
    if rtll2.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 2\b/, rtll2 
    end   
    if rtll3.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 3\b/, rtll3 
    end 
    if rtll4.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 4\b/, rtll4 
    end 
    if rtll5.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 5\b/, rtll5 
    end 
    if rtll6.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 6\b/, rtll6 
    end 
    if rtll7.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 7\b/, rtll7 
    end                     
    if rtll8.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 8\b/, rtll8
    end    
    if rtll9.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 9\b/, rtll9 
    end    
    if rtll10.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 10\b/, rtll10 
    end 
    if rtll11.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 11\b/, rtll11 
    end 
    if rtll12.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 12\b/, rtll12 
    end   
    if rtll13.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 13\b/, rtll13 
    end 
    if rtll14.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 14\b/, rtll14 
    end 
    if rtll15.nil?
      new_data2.gsub! /Sit 4 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Lt Play 15\b/, rtll15 
    end

    #Run Right Hash
    unless runThirdLongsRight[0].nil?  
      rtlr1 = runThirdLongsRight[0].fullname 
    end
    unless runThirdLongsRight[1].nil?  
      rtlr2 = runThirdLongsRight[1].fullname 
    end
    unless runThirdLongsRight[2].nil?  
      rtlr3 = runThirdLongsRight[2].fullname 
    end
    unless runThirdLongsRight[3].nil?  
      rtlr4 = runThirdLongsRight[3].fullname 
    end
    unless runThirdLongsRight[4].nil?  
      rtlr5 = runThirdLongsRight[4].fullname 
    end
    unless runThirdLongsRight[5].nil?  
      rtlr6 = runThirdLongsRight[5].fullname 
    end
    unless runThirdLongsRight[6].nil?  
      rtlr7 = runThirdLongsRight[6].fullname 
    end
    unless runThirdLongsRight[7].nil?  
      rtlr8 = runThirdLongsRight[7].fullname 
    end
    unless runThirdLongsRight[8].nil?  
      rtlr9 = runThirdLongsRight[8].fullname 
    end
    unless runThirdLongsRight[9].nil?  
      rtlr10 = runThirdLongsRight[9].fullname 
    end
    unless runThirdLongsRight[10].nil?  
      rtlr11 = runThirdLongsRight[10].fullname 
    end
    unless runThirdLongsRight[11].nil?  
      rtlr12 = runThirdLongsRight[11].fullname 
    end
    unless runThirdLongsRight[12].nil?  
      rtlr13 = runThirdLongsRight[12].fullname 
    end
    unless runThirdLongsRight[13].nil?  
      rtlr14 = runThirdLongsRight[13].fullname 
    end
    unless runThirdLongsRight[14].nil?  
      rtlr15 = runThirdLongsRight[14].fullname 
    end

    if rtlr1.nil?
      new_data.gsub! /Sit 4 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 1\b/, rtlr1 
    end 
    if rtlr2.nil?
      new_data.gsub! /Sit 4 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 2\b/, rtlr2 
    end   
    if rtlr3.nil?
      new_data.gsub! /Sit 4 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 3\b/, rtlr3 
    end 
    if rtlr4.nil?
      new_data.gsub! /Sit 4 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 4\b/, rtlr4 
    end 
    if rtlr5.nil?
      new_data.gsub! /Sit 4 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 5\b/, rtlr5 
    end 
    if rtlr6.nil?
      new_data.gsub! /Sit 4 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 6\b/, rtlr6 
    end 
    if rtlr7.nil?
      new_data.gsub! /Sit 4 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 7\b/, rtlr7 
    end                     
    if rtlr8.nil?
      new_data.gsub! /Sit 4 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 8\b/, rtlr8
    end    
    if rtlr9.nil?
      new_data.gsub! /Sit 4 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 9\b/, rtlr9 
    end    
    if rtlr10.nil?
      new_data.gsub! /Sit 4 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 10\b/, rtlr10 
    end 
    if rtlr11.nil?
      new_data.gsub! /Sit 4 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 11\b/, rtlr11 
    end 
    if rtlr12.nil?
      new_data.gsub! /Sit 4 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 12\b/, rtlr12 
    end   
    if rtlr13.nil?
      new_data.gsub! /Sit 4 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 13\b/, rtlr13 
    end 
    if rtlr14.nil?
      new_data.gsub! /Sit 4 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 14\b/, rtlr14 
    end 
    if rtlr15.nil?
      new_data.gsub! /Sit 4 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 4 Run Rt Play 15\b/, rtlr15 
    end

    if rtlr1.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 1\b/, rtlr1 
    end 
    if rtlr2.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 2\b/, rtlr2 
    end   
    if rtlr3.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 3\b/, rtlr3 
    end 
    if rtlr4.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 4\b/, rtlr4 
    end 
    if rtlr5.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 5\b/, rtlr5 
    end 
    if rtlr6.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 6\b/, rtlr6 
    end 
    if rtlr7.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 7\b/, rtlr7 
    end                     
    if rtlr8.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 8\b/, rtlr8
    end    
    if rtlr9.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 9\b/, rtlr9 
    end    
    if rtlr10.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 10\b/, rtlr10 
    end 
    if rtlr11.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 11\b/, rtlr11 
    end 
    if rtlr12.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 12\b/, rtlr12 
    end   
    if rtlr13.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 13\b/, rtlr13 
    end 
    if rtlr14.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 14\b/, rtlr14 
    end 
    if rtlr15.nil?
      new_data2.gsub! /Sit 4 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 4 Run Rt Play 15\b/, rtlr15 
    end

    #Pass Left Hash
    unless passThirdLongsLeft[0].nil?  
      ptll1 = passThirdLongsLeft[0].fullname 
    end
    unless passThirdLongsLeft[1].nil?  
      ptll2 = passThirdLongsLeft[1].fullname 
    end
    unless passThirdLongsLeft[2].nil?  
      ptll3 = passThirdLongsLeft[2].fullname 
    end
    unless passThirdLongsLeft[3].nil?  
      ptll4 = passThirdLongsLeft[3].fullname 
    end
    unless passThirdLongsLeft[4].nil?  
      ptll5 = passThirdLongsLeft[4].fullname 
    end
    unless passThirdLongsLeft[5].nil?  
      ptll6 = passThirdLongsLeft[5].fullname 
    end
    unless passThirdLongsLeft[6].nil?  
      ptll7 = passThirdLongsLeft[6].fullname 
    end
    unless passThirdLongsLeft[7].nil?  
      ptll8 = passThirdLongsLeft[7].fullname 
    end   
    unless passThirdLongsLeft[8].nil?  
      ptll9 = passThirdLongsLeft[8].fullname 
    end
    unless passThirdLongsLeft[9].nil?  
      ptll10 = passThirdLongsLeft[9].fullname 
    end
    unless passThirdLongsLeft[10].nil?  
      ptll11 = passThirdLongsLeft[10].fullname 
    end
    unless passThirdLongsLeft[11].nil?  
      ptll12 = passThirdLongsLeft[11].fullname 
    end         
    unless passThirdLongsLeft[12].nil?  
      ptll13 = passThirdLongsLeft[12].fullname 
    end
    unless passThirdLongsLeft[13].nil?  
      ptll14 = passThirdLongsLeft[13].fullname 
    end
    unless passThirdLongsLeft[14].nil?  
      ptll15 = passThirdLongsLeft[14].fullname 
    end 

    if ptll1.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 1\b/, ptll1 
    end 
    if ptll2.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 2\b/, ptll2 
    end   
    if ptll3.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 3\b/, ptll3 
    end 
    if ptll4.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 4\b/, ptll4 
    end 
    if ptll5.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 5\b/, ptll5 
    end 
    if ptll6.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 6\b/, ptll6 
    end 
    if ptll7.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 7\b/, ptll7 
    end                     
    if ptll8.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 8\b/, ptll8
    end    
    if ptll9.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 9\b/, ptll9 
    end    
    if ptll10.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 10\b/, ptll10 
    end 
    if ptll11.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 11\b/, ptll11 
    end 
    if ptll12.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 12\b/, ptll12 
    end   
    if ptll13.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 13\b/, ptll13 
    end 
    if ptll14.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 14\b/, ptll14 
    end 
    if ptll15.nil?
      new_data.gsub! /Sit 4 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Lt Play 15\b/, ptll15 
    end

    if ptll1.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 1\b/, ptll1 
    end 
    if ptll2.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 2\b/, ptll2 
    end   
    if ptll3.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 3\b/, ptll3 
    end 
    if ptll4.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 4\b/, ptll4 
    end 
    if ptll5.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 5\b/, ptll5 
    end 
    if ptll6.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 6\b/, ptll6 
    end 
    if ptll7.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 7\b/, ptll7 
    end                     
    if ptll8.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 8\b/, ptll8
    end    
    if ptll9.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 9\b/, ptll9 
    end    
    if ptll10.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 10\b/, ptll10 
    end 
    if ptll11.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 11\b/, ptll11 
    end 
    if ptll12.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 12\b/, ptll12 
    end   
    if ptll13.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 13\b/, ptll13 
    end 
    if ptll14.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 14\b/, ptll14 
    end 
    if ptll15.nil?
      new_data2.gsub! /Sit 4 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Lt Play 15\b/, ptll15 
    end

    #Pass Right Hash
    unless passThirdLongsRight[0].nil?  
      ptlr1 = passThirdLongsRight[0].fullname 
    end
    unless passThirdLongsRight[1].nil?  
      ptlr2 = passThirdLongsRight[1].fullname 
    end
    unless passThirdLongsRight[2].nil?  
      ptlr3 = passThirdLongsRight[2].fullname 
    end
    unless passThirdLongsRight[3].nil?  
      ptlr4 = passThirdLongsRight[3].fullname 
    end
    unless passThirdLongsRight[4].nil?  
      ptlr5 = passThirdLongsRight[4].fullname 
    end
    unless passThirdLongsRight[5].nil?  
      ptlr6 = passThirdLongsRight[5].fullname 
    end
    unless passThirdLongsRight[6].nil?  
      ptlr7 = passThirdLongsRight[6].fullname 
    end
    unless passThirdLongsRight[7].nil?  
      ptlr8 = passThirdLongsRight[7].fullname 
    end     
    unless passThirdLongsRight[8].nil?  
      ptlr9 = passThirdLongsRight[8].fullname 
    end
    unless passThirdLongsRight[9].nil?  
      ptlr10 = passThirdLongsRight[9].fullname 
    end
    unless passThirdLongsRight[10].nil?  
      ptlr11 = passThirdLongsRight[10].fullname 
    end
    unless passThirdLongsRight[11].nil?  
      ptlr12 = passThirdLongsRight[11].fullname 
    end 
    unless passThirdLongsRight[12].nil?  
      ptlr13 = passThirdLongsRight[12].fullname 
    end
    unless passThirdLongsRight[13].nil?  
      ptlr14 = passThirdLongsRight[13].fullname 
    end
    unless passThirdLongsRight[14].nil?  
      ptlr15 = passThirdLongsRight[14].fullname 
    end 

    if ptlr1.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 1\b/, ptlr1 
    end 
    if ptlr2.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 2\b/, ptlr2 
    end   
    if ptlr3.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 3\b/, ptlr3 
    end 
    if ptlr4.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 4\b/, ptlr4 
    end 
    if ptlr5.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 5\b/, ptlr5 
    end 
    if ptlr6.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 6\b/, ptlr6 
    end 
    if ptlr7.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 7\b/, ptlr7 
    end                     
    if ptlr8.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 8\b/, ptlr8
    end    
    if ptlr9.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 9\b/, ptlr9 
    end    
    if ptlr10.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 10\b/, ptlr10 
    end 
    if ptlr11.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 11\b/, ptlr11 
    end 
    if ptlr12.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 12\b/, ptlr12 
    end   
    if ptlr13.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 13\b/, ptlr13 
    end 
    if ptlr14.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 14\b/, ptlr14 
    end 
    if ptlr15.nil?
      new_data.gsub! /Sit 4 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 4 Pass Rt Play 15\b/, ptlr15 
    end  

    if ptlr1.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 1\b/, ptlr1 
    end 
    if ptlr2.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 2\b/, ptlr2 
    end   
    if ptlr3.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 3\b/, ptlr3 
    end 
    if ptlr4.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 4\b/, ptlr4 
    end 
    if ptlr5.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 5\b/, ptlr5 
    end 
    if ptlr6.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 6\b/, ptlr6 
    end 
    if ptlr7.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 7\b/, ptlr7 
    end                     
    if ptlr8.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 8\b/, ptlr8
    end    
    if ptlr9.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 9\b/, ptlr9 
    end    
    if ptlr10.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 10\b/, ptlr10 
    end 
    if ptlr11.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 11\b/, ptlr11 
    end 
    if ptlr12.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 12\b/, ptlr12 
    end   
    if ptlr13.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 13\b/, ptlr13 
    end 
    if ptlr14.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 14\b/, ptlr14 
    end 
    if ptlr15.nil?
      new_data2.gsub! /Sit 4 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 4 Pass Rt Play 15\b/, ptlr15 
    end      
    #----------End 3rd & Long----------

    #----------2nd & Medium----------
    secondMediums = event.plays.where('situation4 = ?', true)
     
    runSecondMediums = secondMediums.where('play_type = ?', 'Run')
    runSecondMediumsLeft = runSecondMediums.where('hash_mark = ?', 'Left')
    runSecondMediumsRight = runSecondMediums.where('hash_mark = ?', 'Right')
     
    passSecondMediums = secondMediums.where('play_type = ?', 'Pass')
    passSecondMediumsLeft = passSecondMediums.where('hash_mark = ?', 'Left')
    passSecondMediumsRight = passSecondMediums.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondMediumsLeft[0].nil?  
      rsml1 = runSecondMediumsLeft[0].fullname 
    end
    unless runSecondMediumsLeft[1].nil?  
      rsml2 = runSecondMediumsLeft[1].fullname 
    end
    unless runSecondMediumsLeft[2].nil?  
      rsml3 = runSecondMediumsLeft[2].fullname 
    end
    unless runSecondMediumsLeft[3].nil?  
      rsml4 = runSecondMediumsLeft[3].fullname 
    end
    unless runSecondMediumsLeft[4].nil?  
      rsml5 = runSecondMediumsLeft[4].fullname
    end
    unless runSecondMediumsLeft[5].nil?  
      rsml6 = runSecondMediumsLeft[5].fullname 
    end
    unless runSecondMediumsLeft[6].nil?  
      rsml7 = runSecondMediumsLeft[6].fullname 
    end
    unless runSecondMediumsLeft[7].nil?  
      rsml8 = runSecondMediumsLeft[7].fullname 
    end
    unless runSecondMediumsLeft[8].nil?  
      rsml9 = runSecondMediumsLeft[8].fullname 
    end
    unless runSecondMediumsLeft[9].nil?  
      rsml10 = runSecondMediumsLeft[9].fullname
    end    
    unless runSecondMediumsLeft[10].nil?  
      rsml11 = runSecondMediumsLeft[10].fullname
    end 
    unless runSecondMediumsLeft[11].nil?  
      rsml12 = runSecondMediumsLeft[11].fullname 
    end
    unless runSecondMediumsLeft[12].nil?  
      rsml13 = runSecondMediumsLeft[12].fullname
    end    
    unless runSecondMediumsLeft[13].nil?  
      rsml14 = runSecondMediumsLeft[13].fullname
    end 
    unless runSecondMediumsLeft[14].nil?  
      rsml15 = runSecondMediumsLeft[14].fullname
    end 

    if rsml1.nil?
      new_data.gsub! /Sit 5 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 1\b/, rsml1 
    end 
    if rsml2.nil?
      new_data.gsub! /Sit 5 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 2\b/, rsml2 
    end   
    if rsml3.nil?
      new_data.gsub! /Sit 5 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 3\b/, rsml3 
    end 
    if rsml4.nil?
      new_data.gsub! /Sit 5 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 4\b/, rsml4 
    end 
    if rsml5.nil?
      new_data.gsub! /Sit 5 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 5\b/, rsml5 
    end 
    if rsml6.nil?
      new_data.gsub! /Sit 5 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 6\b/, rsml6 
    end 
    if rsml7.nil?
      new_data.gsub! /Sit 5 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 7\b/, rsml7 
    end                     
    if rsml8.nil?
      new_data.gsub! /Sit 5 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 8\b/, rsml8
    end    
    if rsml9.nil?
      new_data.gsub! /Sit 5 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 9\b/, rsml9 
    end    
    if rsml10.nil?
      new_data.gsub! /Sit 5 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 10\b/, rsml10 
    end 
    if rsml11.nil?
      new_data.gsub! /Sit 5 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 11\b/, rsml11 
    end 
    if rsml12.nil?
      new_data.gsub! /Sit 5 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 12\b/, rsml12 
    end   
    if rsml13.nil?
      new_data.gsub! /Sit 5 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 13\b/, rsml13 
    end 
    if rsml14.nil?
      new_data.gsub! /Sit 5 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 14\b/, rsml14 
    end 
    if rsml15.nil?
      new_data.gsub! /Sit 5 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 5 Run Lt Play 15\b/, rsml15 
    end 

    if rsml1.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 1\b/, rsml1 
    end 
    if rsml2.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 2\b/, rsml2 
    end   
    if rsml3.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 3\b/, rsml3 
    end 
    if rsml4.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 4\b/, rsml4 
    end 
    if rsml5.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 5\b/, rsml5 
    end 
    if rsml6.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 6\b/, rsml6 
    end 
    if rsml7.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 7\b/, rsml7 
    end                     
    if rsml8.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 8\b/, rsml8
    end    
    if rsml9.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 9\b/, rsml9 
    end    
    if rsml10.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 10\b/, rsml10 
    end 
    if rsml11.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 11\b/, rsml11 
    end 
    if rsml12.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 12\b/, rsml12 
    end   
    if rsml13.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 13\b/, rsml13 
    end 
    if rsml14.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 14\b/, rsml14 
    end 
    if rsml15.nil?
      new_data2.gsub! /Sit 5 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Lt Play 15\b/, rsml15 
    end 

    #Run Right Hash
    unless runSecondMediumsRight[0].nil?  
      rsmr1 = runSecondMediumsRight[0].fullname 
    end
    unless runSecondMediumsRight[1].nil?  
      rsmr2 = runSecondMediumsRight[1].fullname 
    end
    unless runSecondMediumsRight[2].nil?  
      rsmr3 = runSecondMediumsRight[2].fullname 
    end
    unless runSecondMediumsRight[3].nil?  
      rsmr4 = runSecondMediumsRight[3].fullname 
    end
    unless runSecondMediumsRight[4].nil?  
      rsmr5 = runSecondMediumsRight[4].fullname
    end
    unless runSecondMediumsRight[5].nil?  
      rsmr6 = runSecondMediumsRight[5].fullname 
    end
    unless runSecondMediumsRight[6].nil?  
      rsmr7 = runSecondMediumsRight[6].fullname 
    end
    unless runSecondMediumsRight[7].nil?  
      rsmr8 = runSecondMediumsRight[7].fullname 
    end
    unless runSecondMediumsRight[8].nil?  
      rsmr9 = runSecondMediumsRight[8].fullname 
    end
    unless runSecondMediumsRight[9].nil?  
      rsmr10 = runSecondMediumsRight[9].fullname
    end
    unless runSecondMediumsRight[10].nil?  
      rsmr11 = runSecondMediumsRight[10].fullname
    end
    unless runSecondMediumsRight[11].nil?  
      rsmr12 = runSecondMediumsRight[11].fullname 
    end
    unless runSecondMediumsRight[12].nil?  
      rsmr13 = runSecondMediumsRight[12].fullname 
    end
    unless runSecondMediumsRight[13].nil?  
      rsmr14 = runSecondMediumsRight[13].fullname
    end
    unless runSecondMediumsRight[14].nil?  
      rsmr15 = runSecondMediumsRight[14].fullname
    end

    if rsmr1.nil?
      new_data.gsub! /Sit 5 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 1\b/, rsmr1 
    end 
    if rsmr2.nil?
      new_data.gsub! /Sit 5 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 2\b/, rsmr2 
    end   
    if rsmr3.nil?
      new_data.gsub! /Sit 5 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 3\b/, rsmr3 
    end 
    if rsmr4.nil?
      new_data.gsub! /Sit 5 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 4\b/, rsmr4 
    end 
    if rsmr5.nil?
      new_data.gsub! /Sit 5 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 5\b/, rsmr5 
    end 
    if rsmr6.nil?
      new_data.gsub! /Sit 5 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 6\b/, rsmr6 
    end 
    if rsmr7.nil?
      new_data.gsub! /Sit 5 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 7\b/, rsmr7 
    end                     
    if rsmr8.nil?
      new_data.gsub! /Sit 5 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 8\b/, rsmr8
    end    
    if rsmr9.nil?
      new_data.gsub! /Sit 5 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 9\b/, rsmr9 
    end    
    if rsmr10.nil?
      new_data.gsub! /Sit 5 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 10\b/, rsmr10 
    end 
    if rsmr11.nil?
      new_data.gsub! /Sit 5 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 11\b/, rsmr11 
    end 
    if rsmr12.nil?
      new_data.gsub! /Sit 5 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 12\b/, rsmr12 
    end   
    if rsmr13.nil?
      new_data.gsub! /Sit 5 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 13\b/, rsmr13 
    end 
    if rsmr14.nil?
      new_data.gsub! /Sit 5 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 14\b/, rsmr14 
    end 
    if rsmr15.nil?
      new_data.gsub! /Sit 5 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 5 Run Rt Play 15\b/, rsmr15 
    end 

    if rsmr1.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 1\b/, rsmr1 
    end 
    if rsmr2.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 2\b/, rsmr2 
    end   
    if rsmr3.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 3\b/, rsmr3 
    end 
    if rsmr4.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 4\b/, rsmr4 
    end 
    if rsmr5.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 5\b/, rsmr5 
    end 
    if rsmr6.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 6\b/, rsmr6 
    end 
    if rsmr7.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 7\b/, rsmr7 
    end                     
    if rsmr8.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 8\b/, rsmr8
    end    
    if rsmr9.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 9\b/, rsmr9 
    end    
    if rsmr10.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 10\b/, rsmr10 
    end 
    if rsmr11.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 11\b/, rsmr11 
    end 
    if rsmr12.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 12\b/, rsmr12 
    end   
    if rsmr13.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 13\b/, rsmr13 
    end 
    if rsmr14.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 14\b/, rsmr14 
    end 
    if rsmr15.nil?
      new_data2.gsub! /Sit 5 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 5 Run Rt Play 15\b/, rsmr15 
    end 

    #Pass Left Hash
    unless passSecondMediumsLeft[0].nil?  
      psml1 = passSecondMediumsLeft[0].fullname 
    end
    unless passSecondMediumsLeft[1].nil?  
      psml2 = passSecondMediumsLeft[1].fullname 
    end
    unless passSecondMediumsLeft[2].nil?  
      psml3 = passSecondMediumsLeft[2].fullname 
    end
    unless passSecondMediumsLeft[3].nil?  
      psml4 = passSecondMediumsLeft[3].fullname 
    end
    unless passSecondMediumsLeft[4].nil?  
      psml5 = passSecondMediumsLeft[4].fullname
    end
    unless passSecondMediumsLeft[5].nil?  
      psml6 = passSecondMediumsLeft[5].fullname 
    end
    unless passSecondMediumsLeft[6].nil?  
      psml7 = passSecondMediumsLeft[6].fullname 
    end
    unless passSecondMediumsLeft[7].nil?  
      psml8 = passSecondMediumsLeft[7].fullname 
    end
    unless passSecondMediumsLeft[8].nil?  
      psml9 = passSecondMediumsLeft[8].fullname 
    end
    unless passSecondMediumsLeft[9].nil?  
      psml10 = passSecondMediumsLeft[9].fullname
    end
    unless passSecondMediumsLeft[10].nil?  
      psml11 = passSecondMediumsLeft[10].fullname 
    end
    unless passSecondMediumsLeft[11].nil?  
      psml12 = passSecondMediumsLeft[11].fullname 
    end
    unless passSecondMediumsLeft[12].nil?  
      psml13 = passSecondMediumsLeft[12].fullname 
    end
    unless passSecondMediumsLeft[13].nil?  
      psml14 = passSecondMediumsLeft[13].fullname
    end
    unless passSecondMediumsLeft[14].nil?  
      psml15 = passSecondMediumsLeft[14].fullname 
    end

    if psml1.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 1\b/, psml1 
    end 
    if psml2.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 2\b/, psml2 
    end   
    if psml3.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 3\b/, psml3 
    end 
    if psml4.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 4\b/, psml4 
    end 
    if psml5.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 5\b/, psml5 
    end 
    if psml6.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 6\b/, psml6 
    end 
    if psml7.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 7\b/, psml7 
    end                     
    if psml8.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 8\b/, psml8
    end    
    if psml9.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 9\b/, psml9 
    end    
    if psml10.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 10\b/, psml10 
    end 
    if psml11.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 11\b/, psml11 
    end 
    if psml12.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 12\b/, psml12 
    end   
    if psml13.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 13\b/, psml13 
    end 
    if psml14.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 14\b/, psml14 
    end 
    if psml15.nil?
      new_data.gsub! /Sit 5 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Lt Play 15\b/, psml15 
    end 

    if psml1.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 1\b/, psml1 
    end 
    if psml2.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 2\b/, psml2 
    end   
    if psml3.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 3\b/, psml3 
    end 
    if psml4.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 4\b/, psml4 
    end 
    if psml5.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 5\b/, psml5 
    end 
    if psml6.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 6\b/, psml6 
    end 
    if psml7.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 7\b/, psml7 
    end                     
    if psml8.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 8\b/, psml8
    end    
    if psml9.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 9\b/, psml9 
    end    
    if psml10.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 10\b/, psml10 
    end 
    if psml11.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 11\b/, psml11 
    end 
    if psml12.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 12\b/, psml12 
    end   
    if psml13.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 13\b/, psml13 
    end 
    if psml14.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 14\b/, psml14 
    end 
    if psml15.nil?
      new_data2.gsub! /Sit 5 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Lt Play 15\b/, psml15 
    end 

    #Pass Right Hash
    unless passSecondMediumsRight[0].nil?  
      psmr1 = passSecondMediumsRight[0].fullname 
    end
    unless passSecondMediumsRight[1].nil?  
      psmr2 = passSecondMediumsRight[1].fullname 
    end
    unless passSecondMediumsRight[2].nil?  
      psmr3 = passSecondMediumsRight[2].fullname 
    end
    unless passSecondMediumsRight[3].nil?  
      psmr4 = passSecondMediumsRight[3].fullname 
    end
    unless passSecondMediumsRight[4].nil?  
      psmr5 = passSecondMediumsRight[4].fullname
    end
    unless passSecondMediumsRight[5].nil?  
      psmr6 = passSecondMediumsRight[5].fullname 
    end
    unless passSecondMediumsRight[6].nil?  
      psmr7 = passSecondMediumsRight[6].fullname 
    end
    unless passSecondMediumsRight[7].nil?  
      psmr8 = passSecondMediumsRight[7].fullname 
    end
    unless passSecondMediumsRight[8].nil?  
      psmr9 = passSecondMediumsRight[8].fullname 
    end
    unless passSecondMediumsRight[9].nil?  
      psmr10 = passSecondMediumsRight[9].fullname
    end
    unless passSecondMediumsRight[10].nil?  
      psmr11 = passSecondMediumsRight[10].fullname 
    end
    unless passSecondMediumsRight[11].nil?  
      psmr12 = passSecondMediumsRight[11].fullname 
    end
    unless passSecondMediumsRight[12].nil?  
      psmr13 = passSecondMediumsRight[12].fullname 
    end
    unless passSecondMediumsRight[13].nil?  
      psmr14 = passSecondMediumsRight[13].fullname
    end
    unless passSecondMediumsRight[14].nil?  
      psmr15 = passSecondMediumsRight[14].fullname 
    end

    if psmr1.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 1\b/, psmr1 
    end 
    if psmr2.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 2\b/, psmr2 
    end   
    if psmr3.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 3\b/, psmr3 
    end 
    if psmr4.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 4\b/, psmr4 
    end 
    if psmr5.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 5\b/, psmr5 
    end 
    if psmr6.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 6\b/, psmr6 
    end 
    if psmr7.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 7\b/, psmr7 
    end                     
    if psmr8.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 8\b/, psmr8
    end    
    if psmr9.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 9\b/, psmr9 
    end    
    if psmr10.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 10\b/, psmr10 
    end 
    if psmr11.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 11\b/, psmr11 
    end 
    if psmr12.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 12\b/, psmr12 
    end   
    if psmr13.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 13\b/, psmr13 
    end 
    if psmr14.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 14\b/, psmr14 
    end 
    if psmr15.nil?
      new_data.gsub! /Sit 5 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 5 Pass Rt Play 15\b/, psmr15 
    end    

    if psmr1.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 1\b/, psmr1 
    end 
    if psmr2.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 2\b/, psmr2 
    end   
    if psmr3.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 3\b/, psmr3 
    end 
    if psmr4.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 4\b/, psmr4 
    end 
    if psmr5.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 5\b/, psmr5 
    end 
    if psmr6.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 6\b/, psmr6 
    end 
    if psmr7.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 7\b/, psmr7 
    end                     
    if psmr8.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 8\b/, psmr8
    end    
    if psmr9.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 9\b/, psmr9 
    end    
    if psmr10.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 10\b/, psmr10 
    end 
    if psmr11.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 11\b/, psmr11 
    end 
    if psmr12.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 12\b/, psmr12 
    end   
    if psmr13.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 13\b/, psmr13 
    end 
    if psmr14.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 14\b/, psmr14 
    end 
    if psmr15.nil?
      new_data2.gsub! /Sit 5 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 5 Pass Rt Play 15\b/, psmr15 
    end       
    #----------End 2nd & Medium--------

    #----------3rd & Medium----------
    thirdMediums = event.plays.where('situation7 = ?', true)
     
    runThirdMediums = thirdMediums.where('play_type = ?', 'Run')
    runThirdMediumsLeft = runThirdMediums.where('hash_mark = ?', 'Left')
    runThirdMediumsRight = runThirdMediums.where('hash_mark = ?', 'Right')
     
    passThirdMediums = thirdMediums.where('play_type = ?', 'Pass')
    passThirdMediumsLeft = passThirdMediums.where('hash_mark = ?', 'Left')
    passThirdMediumsRight = passThirdMediums.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdMediumsLeft[0].nil?  
      rtml1 = runThirdMediumsLeft[0].fullname 
    end
    unless runThirdMediumsLeft[1].nil?  
      rtml2 = runThirdMediumsLeft[1].fullname 
    end
    unless runThirdMediumsLeft[2].nil?  
      rtml3 = runThirdMediumsLeft[2].fullname 
    end
    unless runThirdMediumsLeft[3].nil?  
      rtml4 = runThirdMediumsLeft[3].fullname 
    end
    unless runThirdMediumsLeft[4].nil?  
      rtml5 = runThirdMediumsLeft[4].fullname
    end
    unless runThirdMediumsLeft[5].nil?  
      rtml6 = runThirdMediumsLeft[5].fullname 
    end
    unless runThirdMediumsLeft[6].nil?  
      rtml7 = runThirdMediumsLeft[6].fullname 
    end
    unless runThirdMediumsLeft[7].nil?  
      rtml8 = runThirdMediumsLeft[7].fullname 
    end
    unless runThirdMediumsLeft[8].nil?  
      rtml9 = runThirdMediumsLeft[8].fullname 
    end
    unless runThirdMediumsLeft[9].nil?  
      rtml10 = runThirdMediumsLeft[9].fullname
    end
    unless runThirdMediumsLeft[10].nil?  
      rtml11 = runThirdMediumsLeft[10].fullname 
    end
    unless runThirdMediumsLeft[11].nil?  
      rtml12 = runThirdMediumsLeft[11].fullname 
    end
    unless runThirdMediumsLeft[12].nil?  
      rtml13 = runThirdMediumsLeft[12].fullname 
    end
    unless runThirdMediumsLeft[13].nil?  
      rtml14 = runThirdMediumsLeft[13].fullname
    end
    unless runThirdMediumsLeft[14].nil?  
      rtml15 = runThirdMediumsLeft[14].fullname 
    end

    if rtml1.nil?
      new_data.gsub! /Sit 6 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 1\b/, rtml1 
    end 
    if rtml2.nil?
      new_data.gsub! /Sit 6 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 2\b/, rtml2 
    end   
    if rtml3.nil?
      new_data.gsub! /Sit 6 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 3\b/, rtml3 
    end 
    if rtml4.nil?
      new_data.gsub! /Sit 6 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 4\b/, rtml4 
    end 
    if rtml5.nil?
      new_data.gsub! /Sit 6 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 5\b/, rtml5 
    end 
    if rtml6.nil?
      new_data.gsub! /Sit 6 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 6\b/, rtml6 
    end 
    if rtml7.nil?
      new_data.gsub! /Sit 6 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 7\b/, rtml7 
    end                     
    if rtml8.nil?
      new_data.gsub! /Sit 6 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 8\b/, rtml8
    end    
    if rtml9.nil?
      new_data.gsub! /Sit 6 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 9\b/, rtml9 
    end    
    if rtml10.nil?
      new_data.gsub! /Sit 6 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 10\b/, rtml10 
    end 
    if rtml11.nil?
      new_data.gsub! /Sit 6 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 11\b/, rtml11 
    end 
    if rtml12.nil?
      new_data.gsub! /Sit 6 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 12\b/, rtml12 
    end   
    if rtml13.nil?
      new_data.gsub! /Sit 6 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 13\b/, rtml13 
    end 
    if rtml14.nil?
      new_data.gsub! /Sit 6 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 14\b/, rtml14 
    end 
    if rtml15.nil?
      new_data.gsub! /Sit 6 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 6 Run Lt Play 15\b/, rtml15 
    end 

    if rtml1.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 1\b/, rtml1 
    end 
    if rtml2.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 2\b/, rtml2 
    end   
    if rtml3.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 3\b/, rtml3 
    end 
    if rtml4.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 4\b/, rtml4 
    end 
    if rtml5.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 5\b/, rtml5 
    end 
    if rtml6.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 6\b/, rtml6 
    end 
    if rtml7.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 7\b/, rtml7 
    end                     
    if rtml8.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 8\b/, rtml8
    end    
    if rtml9.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 9\b/, rtml9 
    end    
    if rtml10.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 10\b/, rtml10 
    end 
    if rtml11.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 11\b/, rtml11 
    end 
    if rtml12.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 12\b/, rtml12 
    end   
    if rtml13.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 13\b/, rtml13 
    end 
    if rtml14.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 14\b/, rtml14 
    end 
    if rtml15.nil?
      new_data2.gsub! /Sit 6 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Lt Play 15\b/, rtml15 
    end 

    #Run Right Hash
    unless runThirdMediumsRight[0].nil?  
      rtmr1 = runThirdMediumsRight[0].fullname 
    end
    unless runThirdMediumsRight[1].nil?  
      rtmr2 = runThirdMediumsRight[1].fullname 
    end
    unless runThirdMediumsRight[2].nil?  
      rtmr3 = runThirdMediumsRight[2].fullname 
    end
    unless runThirdMediumsRight[3].nil?  
      rtmr4 = runThirdMediumsRight[3].fullname 
    end
    unless runThirdMediumsRight[4].nil?  
      rtmr5 = runThirdMediumsRight[4].fullname
    end
    unless runThirdMediumsRight[5].nil?  
      rtmr6 = runThirdMediumsRight[5].fullname 
    end
    unless runThirdMediumsRight[6].nil?  
      rtmr7 = runThirdMediumsRight[6].fullname 
    end
    unless runThirdMediumsRight[7].nil?  
      rtmr8 = runThirdMediumsRight[7].fullname 
    end
    unless runThirdMediumsRight[8].nil?  
      rtmr9 = runThirdMediumsRight[8].fullname 
    end
    unless runThirdMediumsRight[9].nil?  
      rtmr10 = runThirdMediumsRight[9].fullname
    end
    unless runThirdMediumsRight[10].nil?  
      rtmr11 = runThirdMediumsRight[10].fullname 
    end
    unless runThirdMediumsRight[11].nil?  
      rtmr12 = runThirdMediumsRight[11].fullname 
    end
    unless runThirdMediumsRight[12].nil?  
      rtmr13 = runThirdMediumsRight[12].fullname 
    end
    unless runThirdMediumsRight[13].nil?  
      rtmr14 = runThirdMediumsRight[13].fullname
    end
    unless runThirdMediumsRight[14].nil?  
      rtmr15 = runThirdMediumsRight[14].fullname 
    end

    if rtmr1.nil?
      new_data.gsub! /Sit 6 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 1\b/, rtmr1 
    end 
    if rtmr2.nil?
      new_data.gsub! /Sit 6 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 2\b/, rtmr2 
    end   
    if rtmr3.nil?
      new_data.gsub! /Sit 6 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 3\b/, rtmr3 
    end 
    if rtmr4.nil?
      new_data.gsub! /Sit 6 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 4\b/, rtmr4 
    end 
    if rtmr5.nil?
      new_data.gsub! /Sit 6 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 5\b/, rtmr5 
    end 
    if rtmr6.nil?
      new_data.gsub! /Sit 6 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 6\b/, rtmr6 
    end 
    if rtmr7.nil?
      new_data.gsub! /Sit 6 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 7\b/, rtmr7 
    end                     
    if rtmr8.nil?
      new_data.gsub! /Sit 6 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 8\b/, rtmr8
    end    
    if rtmr9.nil?
      new_data.gsub! /Sit 6 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 9\b/, rtmr9 
    end    
    if rtmr10.nil?
      new_data.gsub! /Sit 6 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 10\b/, rtmr10 
    end 
    if rtmr11.nil?
      new_data.gsub! /Sit 6 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 11\b/, rtmr11 
    end 
    if rtmr12.nil?
      new_data.gsub! /Sit 6 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 12\b/, rtmr12 
    end   
    if rtmr13.nil?
      new_data.gsub! /Sit 6 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 13\b/, rtmr13 
    end 
    if rtmr14.nil?
      new_data.gsub! /Sit 6 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 14\b/, rtmr14 
    end 
    if rtmr15.nil?
      new_data.gsub! /Sit 6 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 6 Run Rt Play 15\b/, rtmr15 
    end     

    if rtmr1.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 1\b/, rtmr1 
    end 
    if rtmr2.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 2\b/, rtmr2 
    end   
    if rtmr3.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 3\b/, rtmr3 
    end 
    if rtmr4.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 4\b/, rtmr4 
    end 
    if rtmr5.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 5\b/, rtmr5 
    end 
    if rtmr6.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 6\b/, rtmr6 
    end 
    if rtmr7.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 7\b/, rtmr7 
    end                     
    if rtmr8.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 8\b/, rtmr8
    end    
    if rtmr9.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 9\b/, rtmr9 
    end    
    if rtmr10.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 10\b/, rtmr10 
    end 
    if rtmr11.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 11\b/, rtmr11 
    end 
    if rtmr12.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 12\b/, rtmr12 
    end   
    if rtmr13.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 13\b/, rtmr13 
    end 
    if rtmr14.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 14\b/, rtmr14 
    end 
    if rtmr15.nil?
      new_data2.gsub! /Sit 6 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 6 Run Rt Play 15\b/, rtmr15 
    end 

    #Pass Left Hash
    unless passThirdMediumsLeft[0].nil?  
      ptml1 = passThirdMediumsLeft[0].fullname 
    end
    unless passThirdMediumsLeft[1].nil?  
      ptml2 = passThirdMediumsLeft[1].fullname 
    end
    unless passThirdMediumsLeft[2].nil?  
      ptml3 = passThirdMediumsLeft[2].fullname 
    end
    unless passThirdMediumsLeft[3].nil?  
      ptml4 = passThirdMediumsLeft[3].fullname 
    end
    unless passThirdMediumsLeft[4].nil?  
      ptml5 = passThirdMediumsLeft[4].fullname
    end
    unless passThirdMediumsLeft[5].nil?  
      ptml6 = passThirdMediumsLeft[5].fullname 
    end
    unless passThirdMediumsLeft[6].nil?  
      ptml7 = passThirdMediumsLeft[6].fullname 
    end
    unless passThirdMediumsLeft[7].nil?  
      ptml8 = passThirdMediumsLeft[7].fullname 
    end
    unless passThirdMediumsLeft[8].nil?  
      ptml9 = passThirdMediumsLeft[8].fullname 
    end
    unless passThirdMediumsLeft[9].nil?  
      ptml10 = passThirdMediumsLeft[9].fullname
    end
    unless passThirdMediumsLeft[10].nil?  
      ptml11 = passThirdMediumsLeft[10].fullname 
    end
    unless passThirdMediumsLeft[11].nil?  
      ptml12 = passThirdMediumsLeft[11].fullname 
    end
    unless passThirdMediumsLeft[12].nil?  
      ptml13 = passThirdMediumsLeft[12].fullname 
    end
    unless passThirdMediumsLeft[13].nil?  
      ptml14 = passThirdMediumsLeft[13].fullname
    end
    unless passThirdMediumsLeft[14].nil?  
      ptml15 = passThirdMediumsLeft[14].fullname 
    end

    if ptml1.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 1\b/, ptml1 
    end 
    if ptml2.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 2\b/, ptml2 
    end   
    if ptml3.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 3\b/, ptml3 
    end 
    if ptml4.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 4\b/, ptml4 
    end 
    if ptml5.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 5\b/, ptml5 
    end 
    if ptml6.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 6\b/, ptml6 
    end 
    if ptml7.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 7\b/, ptml7 
    end                     
    if ptml8.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 8\b/, ptml8
    end    
    if ptml9.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 9\b/, ptml9 
    end    
    if ptml10.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 10\b/, ptml10 
    end 
    if ptml11.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 11\b/, ptml11 
    end 
    if ptml12.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 12\b/, ptml12 
    end   
    if ptml13.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 13\b/, ptml13 
    end 
    if ptml14.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 14\b/, ptml14 
    end 
    if ptml15.nil?
      new_data.gsub! /Sit 6 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Lt Play 15\b/, ptml15 
    end 

    if ptml1.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 1\b/, ptml1 
    end 
    if ptml2.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 2\b/, ptml2 
    end   
    if ptml3.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 3\b/, ptml3 
    end 
    if ptml4.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 4\b/, ptml4 
    end 
    if ptml5.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 5\b/, ptml5 
    end 
    if ptml6.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 6\b/, ptml6 
    end 
    if ptml7.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 7\b/, ptml7 
    end                     
    if ptml8.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 8\b/, ptml8
    end    
    if ptml9.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 9\b/, ptml9 
    end    
    if ptml10.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 10\b/, ptml10 
    end 
    if ptml11.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 11\b/, ptml11 
    end 
    if ptml12.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 12\b/, ptml12 
    end   
    if ptml13.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 13\b/, ptml13 
    end 
    if ptml14.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 14\b/, ptml14 
    end 
    if ptml15.nil?
      new_data2.gsub! /Sit 6 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Lt Play 15\b/, ptml15 
    end 

    #Pass Right Hash
    unless passThirdMediumsRight[0].nil?  
      ptmr1 = passThirdMediumsRight[0].fullname 
    end
    unless passThirdMediumsRight[1].nil?  
      ptmr2 = passThirdMediumsRight[1].fullname 
    end
    unless passThirdMediumsRight[2].nil?  
      ptmr3 = passThirdMediumsRight[2].fullname 
    end
    unless passThirdMediumsRight[3].nil?  
      ptmr4 = passThirdMediumsRight[3].fullname 
    end
    unless passThirdMediumsRight[4].nil?  
      ptmr5 = passThirdMediumsRight[4].fullname
    end
    unless passThirdMediumsRight[5].nil?  
      ptmr6 = passThirdMediumsRight[5].fullname 
    end
    unless passThirdMediumsRight[6].nil?  
      ptmr7 = passThirdMediumsRight[6].fullname 
    end
    unless passThirdMediumsRight[7].nil?  
      ptmr8 = passThirdMediumsRight[7].fullname 
    end
    unless passThirdMediumsRight[8].nil?  
      ptmr9 = passThirdMediumsRight[8].fullname 
    end
    unless passThirdMediumsRight[9].nil?  
      ptmr10 = passThirdMediumsRight[9].fullname
    end
    unless passThirdMediumsRight[10].nil?  
      ptmr11 = passThirdMediumsRight[10].fullname 
    end
    unless passThirdMediumsRight[11].nil?  
      ptmr12 = passThirdMediumsRight[11].fullname 
    end
    unless passThirdMediumsRight[12].nil?  
      ptmr13 = passThirdMediumsRight[12].fullname 
    end
    unless passThirdMediumsRight[13].nil?  
      ptmr14 = passThirdMediumsRight[13].fullname
    end
    unless passThirdMediumsRight[14].nil?  
      ptmr15 = passThirdMediumsRight[14].fullname 
    end

    if ptmr1.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 1\b/, ptmr1 
    end 
    if ptmr2.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 2\b/, ptmr2 
    end   
    if ptmr3.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 3\b/, ptmr3 
    end 
    if ptmr4.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 4\b/, ptmr4 
    end 
    if ptmr5.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 5\b/, ptmr5 
    end 
    if ptmr6.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 6\b/, ptmr6 
    end 
    if ptmr7.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 7\b/, ptmr7 
    end                     
    if ptmr8.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 8\b/, ptmr8
    end    
    if ptmr9.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 9\b/, ptmr9 
    end    
    if ptmr10.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 10\b/, ptmr10 
    end 
    if ptmr11.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 11\b/, ptmr11 
    end 
    if ptmr12.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 12\b/, ptmr12 
    end   
    if ptmr13.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 13\b/, ptmr13 
    end 
    if ptmr14.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 14\b/, ptmr14 
    end 
    if ptmr15.nil?
      new_data.gsub! /Sit 6 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 6 Pass Rt Play 15\b/, ptmr15 
    end 

    if ptmr1.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 1\b/, ptmr1 
    end 
    if ptmr2.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 2\b/, ptmr2 
    end   
    if ptmr3.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 3\b/, ptmr3 
    end 
    if ptmr4.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 4\b/, ptmr4 
    end 
    if ptmr5.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 5\b/, ptmr5 
    end 
    if ptmr6.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 6\b/, ptmr6 
    end 
    if ptmr7.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 7\b/, ptmr7 
    end                     
    if ptmr8.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 8\b/, ptmr8
    end    
    if ptmr9.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 9\b/, ptmr9 
    end    
    if ptmr10.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 10\b/, ptmr10 
    end 
    if ptmr11.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 11\b/, ptmr11 
    end 
    if ptmr12.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 12\b/, ptmr12 
    end   
    if ptmr13.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 13\b/, ptmr13 
    end 
    if ptmr14.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 14\b/, ptmr14 
    end 
    if ptmr15.nil?
      new_data2.gsub! /Sit 6 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 6 Pass Rt Play 15\b/, ptmr15 
    end     
    #----------End 3rd & Medium---------

    #----------2nd & Short----------
    secondShorts = event.plays.where('situation5 = ?', true)
     
    runSecondShorts = secondShorts.where('play_type = ?', 'Run')
    runSecondShortsLeft = runSecondShorts.where('hash_mark = ?', 'Left')
    runSecondShortsRight = runSecondShorts.where('hash_mark = ?', 'Right')
     
    passSecondShorts = secondShorts.where('play_type = ?', 'Pass')
    passSecondShortsLeft = passSecondShorts.where('hash_mark = ?', 'Left')
    passSecondShortsRight = passSecondShorts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondShortsLeft[0].nil?  
      rssl1 = runSecondShortsLeft[0].fullname 
    end
    unless runSecondShortsLeft[1].nil?  
      rssl2 = runSecondShortsLeft[1].fullname 
    end
    unless runSecondShortsLeft[2].nil?  
      rssl3 = runSecondShortsLeft[2].fullname 
    end
    unless runSecondShortsLeft[3].nil?  
      rssl4 = runSecondShortsLeft[3].fullname 
    end
    unless runSecondShortsLeft[4].nil?  
      rssl5 = runSecondShortsLeft[4].fullname
    end
    unless runSecondShortsLeft[5].nil?  
      rssl6 = runSecondShortsLeft[5].fullname 
    end
    unless runSecondShortsLeft[6].nil?  
      rssl7 = runSecondShortsLeft[6].fullname 
    end
    unless runSecondShortsLeft[7].nil?  
      rssl8 = runSecondShortsLeft[7].fullname 
    end
    unless runSecondShortsLeft[8].nil?  
      rssl9 = runSecondShortsLeft[8].fullname 
    end
    unless runSecondShortsLeft[9].nil?  
      rssl10 = runSecondShortsLeft[9].fullname
    end
    unless runSecondShortsLeft[10].nil?  
      rssl11 = runSecondShortsLeft[10].fullname
    end
    unless runSecondShortsLeft[11].nil?  
      rssl12 = runSecondShortsLeft[11].fullname 
    end
    unless runSecondShortsLeft[12].nil?  
      rssl13 = runSecondShortsLeft[12].fullname 
    end
    unless runSecondShortsLeft[13].nil?  
      rssl14 = runSecondShortsLeft[13].fullname
    end
    unless runSecondShortsLeft[14].nil?  
      rssl15 = runSecondShortsLeft[14].fullname
    end

    if rssl1.nil?
      new_data.gsub! /Sit 7 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 1\b/, rssl1 
    end 
    if rssl2.nil?
      new_data.gsub! /Sit 7 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 2\b/, rssl2 
    end   
    if rssl3.nil?
      new_data.gsub! /Sit 7 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 3\b/, rssl3 
    end 
    if rssl4.nil?
      new_data.gsub! /Sit 7 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 4\b/, rssl4 
    end 
    if rssl5.nil?
      new_data.gsub! /Sit 7 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 5\b/, rssl5 
    end 
    if rssl6.nil?
      new_data.gsub! /Sit 7 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 6\b/, rssl6 
    end 
    if rssl7.nil?
      new_data.gsub! /Sit 7 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 7\b/, rssl7 
    end                     
    if rssl8.nil?
      new_data.gsub! /Sit 7 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 8\b/, rssl8
    end    
    if rssl9.nil?
      new_data.gsub! /Sit 7 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 9\b/, rssl9 
    end    
    if rssl10.nil?
      new_data.gsub! /Sit 7 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 10\b/, rssl10 
    end 
    if rssl11.nil?
      new_data.gsub! /Sit 7 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 11\b/, rssl11 
    end 
    if rssl12.nil?
      new_data.gsub! /Sit 7 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 12\b/, rssl12 
    end   
    if rssl13.nil?
      new_data.gsub! /Sit 7 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 13\b/, rssl13 
    end 
    if rssl14.nil?
      new_data.gsub! /Sit 7 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 14\b/, rssl14 
    end 
    if rssl15.nil?
      new_data.gsub! /Sit 7 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 7 Run Lt Play 15\b/, rssl15 
    end 

    if rssl1.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 1\b/, rssl1 
    end 
    if rssl2.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 2\b/, rssl2 
    end   
    if rssl3.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 3\b/, rssl3 
    end 
    if rssl4.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 4\b/, rssl4 
    end 
    if rssl5.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 5\b/, rssl5 
    end 
    if rssl6.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 6\b/, rssl6 
    end 
    if rssl7.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 7\b/, rssl7 
    end                     
    if rssl8.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 8\b/, rssl8
    end    
    if rssl9.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 9\b/, rssl9 
    end    
    if rssl10.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 10\b/, rssl10 
    end 
    if rssl11.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 11\b/, rssl11 
    end 
    if rssl12.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 12\b/, rssl12 
    end   
    if rssl13.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 13\b/, rssl13 
    end 
    if rssl14.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 14\b/, rssl14 
    end 
    if rssl15.nil?
      new_data2.gsub! /Sit 7 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Lt Play 15\b/, rssl15 
    end 

    #Run Right Hash
    unless runSecondShortsRight[0].nil?  
      rssr1 = runSecondShortsRight[0].fullname 
    end
    unless runSecondShortsRight[1].nil?  
      rssr2 = runSecondShortsRight[1].fullname 
    end
    unless runSecondShortsRight[2].nil?  
      rssr3 = runSecondShortsRight[2].fullname 
    end
    unless runSecondShortsRight[3].nil?  
      rssr4 = runSecondShortsRight[3].fullname 
    end
    unless runSecondShortsRight[4].nil?  
      rssr5 = runSecondShortsRight[4].fullname
    end
    unless runSecondShortsRight[5].nil?  
      rssr6 = runSecondShortsRight[5].fullname 
    end
    unless runSecondShortsRight[6].nil?  
      rssr7 = runSecondShortsRight[6].fullname 
    end
    unless runSecondShortsRight[7].nil?  
      rssr8 = runSecondShortsRight[7].fullname 
    end
    unless runSecondShortsRight[8].nil?  
      rssr9 = runSecondShortsRight[8].fullname 
    end
    unless runSecondShortsRight[9].nil?  
      rssr10 = runSecondShortsRight[9].fullname
    end
    unless runSecondShortsRight[10].nil?  
      rssr11 = runSecondShortsRight[10].fullname
    end
    unless runSecondShortsRight[11].nil?  
      rssr12 = runSecondShortsRight[11].fullname 
    end
    unless runSecondShortsRight[12].nil?  
      rssr13 = runSecondShortsRight[12].fullname 
    end
    unless runSecondShortsRight[13].nil?  
      rssr14 = runSecondShortsRight[13].fullname
    end
    unless runSecondShortsRight[14].nil?  
      rssr15 = runSecondShortsRight[14].fullname
    end

    if rssr1.nil?
      new_data.gsub! /Sit 7 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 1\b/, rssr1 
    end 
    if rssr2.nil?
      new_data.gsub! /Sit 7 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 2\b/, rssr2 
    end   
    if rssr3.nil?
      new_data.gsub! /Sit 7 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 3\b/, rssr3 
    end 
    if rssr4.nil?
      new_data.gsub! /Sit 7 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 4\b/, rssr4 
    end 
    if rssr5.nil?
      new_data.gsub! /Sit 7 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 5\b/, rssr5 
    end 
    if rssr6.nil?
      new_data.gsub! /Sit 7 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 6\b/, rssr6 
    end 
    if rssr7.nil?
      new_data.gsub! /Sit 7 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 7\b/, rssr7 
    end                     
    if rssr8.nil?
      new_data.gsub! /Sit 7 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 8\b/, rssr8
    end    
    if rssr9.nil?
      new_data.gsub! /Sit 7 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 9\b/, rssr9 
    end    
    if rssr10.nil?
      new_data.gsub! /Sit 7 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 10\b/, rssr10 
    end 
    if rssr11.nil?
      new_data.gsub! /Sit 7 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 11\b/, rssr11 
    end 
    if rssr12.nil?
      new_data.gsub! /Sit 7 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 12\b/, rssr12 
    end   
    if rssr13.nil?
      new_data.gsub! /Sit 7 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 13\b/, rssr13 
    end 
    if rssr14.nil?
      new_data.gsub! /Sit 7 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 14\b/, rssr14 
    end 
    if rssr15.nil?
      new_data.gsub! /Sit 7 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 7 Run Rt Play 15\b/, rssr15 
    end 

    if rssr1.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 1\b/, rssr1 
    end 
    if rssr2.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 2\b/, rssr2 
    end   
    if rssr3.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 3\b/, rssr3 
    end 
    if rssr4.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 4\b/, rssr4 
    end 
    if rssr5.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 5\b/, rssr5 
    end 
    if rssr6.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 6\b/, rssr6 
    end 
    if rssr7.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 7\b/, rssr7 
    end                     
    if rssr8.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 8\b/, rssr8
    end    
    if rssr9.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 9\b/, rssr9 
    end    
    if rssr10.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 10\b/, rssr10 
    end 
    if rssr11.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 11\b/, rssr11 
    end 
    if rssr12.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 12\b/, rssr12 
    end   
    if rssr13.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 13\b/, rssr13 
    end 
    if rssr14.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 14\b/, rssr14 
    end 
    if rssr15.nil?
      new_data2.gsub! /Sit 7 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 7 Run Rt Play 15\b/, rssr15 
    end 

    #Pass Left Hash
    unless passSecondShortsLeft[0].nil?  
      pssl1 = passSecondShortsLeft[0].fullname 
    end
    unless passSecondShortsLeft[1].nil?  
      pssl2 = passSecondShortsLeft[1].fullname 
    end
    unless passSecondShortsLeft[2].nil?  
      pssl3 = passSecondShortsLeft[2].fullname 
    end
    unless passSecondShortsLeft[3].nil?  
      pssl4 = passSecondShortsLeft[3].fullname 
    end
    unless passSecondShortsLeft[4].nil?  
      pssl5 = passSecondShortsLeft[4].fullname
    end
    unless passSecondShortsLeft[5].nil?  
      pssl6 = passSecondShortsLeft[5].fullname 
    end
    unless passSecondShortsLeft[6].nil?  
      pssl7 = passSecondShortsLeft[6].fullname 
    end
    unless passSecondShortsLeft[7].nil?  
      pssl8 = passSecondShortsLeft[7].fullname 
    end
    unless passSecondShortsLeft[8].nil?  
      pssl9 = passSecondShortsLeft[8].fullname 
    end
    unless passSecondShortsLeft[9].nil?  
      pssl10 = passSecondShortsLeft[9].fullname
    end
    unless passSecondShortsLeft[10].nil?  
      pssl11 = passSecondShortsLeft[10].fullname
    end
    unless passSecondShortsLeft[11].nil?  
      pssl12 = passSecondShortsLeft[11].fullname 
    end
    unless passSecondShortsLeft[12].nil?  
      pssl13 = passSecondShortsLeft[12].fullname 
    end
    unless passSecondShortsLeft[13].nil?  
      pssl14 = passSecondShortsLeft[13].fullname
    end
    unless passSecondShortsLeft[14].nil?  
      pssl15 = passSecondShortsLeft[14].fullname
    end

    if pssl1.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 1\b/, pssl1 
    end 
    if pssl2.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 2\b/, pssl2 
    end   
    if pssl3.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 3\b/, pssl3 
    end 
    if pssl4.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 4\b/, pssl4 
    end 
    if pssl5.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 5\b/, pssl5 
    end 
    if pssl6.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 6\b/, pssl6 
    end 
    if pssl7.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 7\b/, pssl7 
    end                     
    if pssl8.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 8\b/, pssl8
    end    
    if pssl9.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 9\b/, pssl9 
    end    
    if pssl10.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 10\b/, pssl10 
    end 
    if pssl11.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 11\b/, pssl11 
    end 
    if pssl12.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 12\b/, pssl12 
    end   
    if pssl13.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 13\b/, pssl13 
    end 
    if pssl14.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 14\b/, pssl14 
    end 
    if pssl15.nil?
      new_data.gsub! /Sit 7 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Lt Play 15\b/, pssl15 
    end 

    if pssl1.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 1\b/, pssl1 
    end 
    if pssl2.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 2\b/, pssl2 
    end   
    if pssl3.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 3\b/, pssl3 
    end 
    if pssl4.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 4\b/, pssl4 
    end 
    if pssl5.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 5\b/, pssl5 
    end 
    if pssl6.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 6\b/, pssl6 
    end 
    if pssl7.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 7\b/, pssl7 
    end                     
    if pssl8.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 8\b/, pssl8
    end    
    if pssl9.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 9\b/, pssl9 
    end    
    if pssl10.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 10\b/, pssl10 
    end 
    if pssl11.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 11\b/, pssl11 
    end 
    if pssl12.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 12\b/, pssl12 
    end   
    if pssl13.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 13\b/, pssl13 
    end 
    if pssl14.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 14\b/, pssl14 
    end 
    if pssl15.nil?
      new_data2.gsub! /Sit 7 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Lt Play 15\b/, pssl15 
    end 

    #Pass Right Hash
    unless passSecondShortsRight[0].nil?  
      pssr1 = passSecondShortsRight[0].fullname 
    end
    unless passSecondShortsRight[1].nil?  
      pssr2 = passSecondShortsRight[1].fullname 
    end
    unless passSecondShortsRight[2].nil?  
      pssr3 = passSecondShortsRight[2].fullname 
    end
    unless passSecondShortsRight[3].nil?  
      pssr4 = passSecondShortsRight[3].fullname 
    end
    unless passSecondShortsRight[4].nil?  
      pssr5 = passSecondShortsRight[4].fullname
    end
    unless passSecondShortsRight[5].nil?  
      pssr6 = passSecondShortsRight[5].fullname 
    end
    unless passSecondShortsRight[6].nil?  
      pssr7 = passSecondShortsRight[6].fullname 
    end
    unless passSecondShortsRight[7].nil?  
      pssr8 = passSecondShortsRight[7].fullname 
    end
    unless passSecondShortsRight[8].nil?  
      pssr9 = passSecondShortsRight[8].fullname 
    end
    unless passSecondShortsRight[9].nil?  
      pssr10 = passSecondShortsRight[9].fullname
    end
    unless passSecondShortsRight[10].nil?  
      pssr11 = passSecondShortsRight[10].fullname
    end
    unless passSecondShortsRight[11].nil?  
      pssr12 = passSecondShortsRight[11].fullname 
    end
    unless passSecondShortsRight[12].nil?  
      pssr13 = passSecondShortsRight[12].fullname 
    end
    unless passSecondShortsRight[13].nil?  
      pssr14 = passSecondShortsRight[13].fullname
    end
    unless passSecondShortsRight[14].nil?  
      pssr15 = passSecondShortsRight[14].fullname
    end

    if pssr1.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 1\b/, pssr1 
    end 
    if pssr2.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 2\b/, pssr2 
    end   
    if pssr3.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 3\b/, pssr3 
    end 
    if pssr4.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 4\b/, pssr4 
    end 
    if pssr5.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 5\b/, pssr5 
    end 
    if pssr6.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 6\b/, pssr6 
    end 
    if pssr7.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 7\b/, pssr7 
    end                     
    if pssr8.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 8\b/, pssr8
    end    
    if pssr9.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 9\b/, pssr9 
    end    
    if pssr10.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 10\b/, pssr10 
    end 
    if pssr11.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 11\b/, pssr11 
    end 
    if pssr12.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 12\b/, pssr12 
    end   
    if pssr13.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 13\b/, pssr13 
    end 
    if pssr14.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 14\b/, pssr14 
    end 
    if pssr15.nil?
      new_data.gsub! /Sit 7 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 7 Pass Rt Play 15\b/, pssr15 
    end 

    if pssr1.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 1\b/, pssr1 
    end 
    if pssr2.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 2\b/, pssr2 
    end   
    if pssr3.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 3\b/, pssr3 
    end 
    if pssr4.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 4\b/, pssr4 
    end 
    if pssr5.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 5\b/, pssr5 
    end 
    if pssr6.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 6\b/, pssr6 
    end 
    if pssr7.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 7\b/, pssr7 
    end                     
    if pssr8.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 8\b/, pssr8
    end    
    if pssr9.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 9\b/, pssr9 
    end    
    if pssr10.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 10\b/, pssr10 
    end 
    if pssr11.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 11\b/, pssr11 
    end 
    if pssr12.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 12\b/, pssr12 
    end   
    if pssr13.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 13\b/, pssr13 
    end 
    if pssr14.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 14\b/, pssr14 
    end 
    if pssr15.nil?
      new_data2.gsub! /Sit 7 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 7 Pass Rt Play 15\b/, pssr15 
    end     
    #----------End 2nd & Short----------

    #----------3rd & Short----------
    thirdShorts = event.plays.where('situation8 = ?', true)
     
    runThirdShorts = thirdShorts.where('play_type = ?', 'Run')
    runThirdShortsLeft = runThirdShorts.where('hash_mark = ?', 'Left')
    runThirdShortsRight = runThirdShorts.where('hash_mark = ?', 'Right')
     
    passThirdShorts = thirdShorts.where('play_type = ?', 'Pass')
    passThirdShortsLeft = passThirdShorts.where('hash_mark = ?', 'Left')
    passThirdShortsRight = passThirdShorts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdShortsLeft[0].nil?  
      rtsl1 = runThirdShortsLeft[0].fullname 
    end
    unless runThirdShortsLeft[1].nil?  
      rtsl2 = runThirdShortsLeft[1].fullname 
    end
    unless runThirdShortsLeft[2].nil?  
      rtsl3 = runThirdShortsLeft[2].fullname 
    end
    unless runThirdShortsLeft[3].nil?  
      rtsl4 = runThirdShortsLeft[3].fullname 
    end
    unless runThirdShortsLeft[4].nil?  
      rtsl5 = runThirdShortsLeft[4].fullname
    end
    unless runThirdShortsLeft[5].nil?  
      rtsl6 = runThirdShortsLeft[5].fullname 
    end
    unless runThirdShortsLeft[6].nil?  
      rtsl7 = runThirdShortsLeft[6].fullname
    end    
    unless runThirdShortsLeft[7].nil?  
      rtsl8 = runThirdShortsLeft[7].fullname 
    end
    unless runThirdShortsLeft[8].nil?  
      rtsl9 = runThirdShortsLeft[8].fullname 
    end
    unless runThirdShortsLeft[9].nil?  
      rtsl10 = runThirdShortsLeft[9].fullname 
    end
    unless runThirdShortsLeft[10].nil?  
      rtsl11 = runThirdShortsLeft[10].fullname 
    end
    unless runThirdShortsLeft[11].nil?  
      rtsl12 = runThirdShortsLeft[11].fullname 
    end
    unless runThirdShortsLeft[12].nil?  
      rtsl13 = runThirdShortsLeft[12].fullname 
    end
    unless runThirdShortsLeft[13].nil?  
      rtsl14 = runThirdShortsLeft[13].fullname 
    end
    unless runThirdShortsLeft[14].nil?  
      rtsl15 = runThirdShortsLeft[14].fullname 
    end

    if rtsl1.nil?
      new_data.gsub! /Sit 8 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 1\b/, rtsl1 
    end 
    if rtsl2.nil?
      new_data.gsub! /Sit 8 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 2\b/, rtsl2 
    end   
    if rtsl3.nil?
      new_data.gsub! /Sit 8 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 3\b/, rtsl3 
    end 
    if rtsl4.nil?
      new_data.gsub! /Sit 8 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 4\b/, rtsl4 
    end 
    if rtsl5.nil?
      new_data.gsub! /Sit 8 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 5\b/, rtsl5 
    end 
    if rtsl6.nil?
      new_data.gsub! /Sit 8 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 6\b/, rtsl6 
    end 
    if rtsl7.nil?
      new_data.gsub! /Sit 8 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 7\b/, rtsl7 
    end                     
    if rtsl8.nil?
      new_data.gsub! /Sit 8 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 8\b/, rtsl8
    end    
    if rtsl9.nil?
      new_data.gsub! /Sit 8 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 9\b/, rtsl9 
    end    
    if rtsl10.nil?
      new_data.gsub! /Sit 8 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 10\b/, rtsl10 
    end 
    if rtsl11.nil?
      new_data.gsub! /Sit 8 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 11\b/, rtsl11 
    end 
    if rtsl12.nil?
      new_data.gsub! /Sit 8 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 12\b/, rtsl12 
    end   
    if rtsl13.nil?
      new_data.gsub! /Sit 8 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 13\b/, rtsl13 
    end 
    if rtsl14.nil?
      new_data.gsub! /Sit 8 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 14\b/, rtsl14 
    end 
    if rtsl15.nil?
      new_data.gsub! /Sit 8 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 8 Run Lt Play 15\b/, rtsl15 
    end 

    if rtsl1.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 1\b/, rtsl1 
    end 
    if rtsl2.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 2\b/, rtsl2 
    end   
    if rtsl3.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 3\b/, rtsl3 
    end 
    if rtsl4.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 4\b/, rtsl4 
    end 
    if rtsl5.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 5\b/, rtsl5 
    end 
    if rtsl6.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 6\b/, rtsl6 
    end 
    if rtsl7.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 7\b/, rtsl7 
    end                     
    if rtsl8.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 8\b/, rtsl8
    end    
    if rtsl9.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 9\b/, rtsl9 
    end    
    if rtsl10.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 10\b/, rtsl10 
    end 
    if rtsl11.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 11\b/, rtsl11 
    end 
    if rtsl12.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 12\b/, rtsl12 
    end   
    if rtsl13.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 13\b/, rtsl13 
    end 
    if rtsl14.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 14\b/, rtsl14 
    end 
    if rtsl15.nil?
      new_data2.gsub! /Sit 8 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Lt Play 15\b/, rtsl15 
    end 

    #Run Right Hash
    unless runThirdShortsRight[0].nil?  
      rtsr1 = runThirdShortsRight[0].fullname 
    end
    unless runThirdShortsRight[1].nil?  
      rtsr2 = runThirdShortsRight[1].fullname 
    end
    unless runThirdShortsRight[2].nil?  
      rtsr3 = runThirdShortsRight[2].fullname 
    end
    unless runThirdShortsRight[3].nil?  
      rtsr4 = runThirdShortsRight[3].fullname 
    end
    unless runThirdShortsRight[4].nil?  
      rtsr5 = runThirdShortsRight[4].fullname
    end
    unless runThirdShortsRight[5].nil?  
      rtsr6 = runThirdShortsRight[5].fullname 
    end
    unless runThirdShortsRight[6].nil?  
      rtsr7 = runThirdShortsRight[6].fullname
    end    
    unless runThirdShortsRight[7].nil?  
      rtsr8 = runThirdShortsRight[7].fullname 
    end
    unless runThirdShortsRight[8].nil?  
      rtsr9 = runThirdShortsRight[8].fullname
    end
    unless runThirdShortsRight[9].nil?  
      rtsr10 = runThirdShortsRight[9].fullname 
    end
    unless runThirdShortsRight[10].nil?  
      rtsr11 = runThirdShortsRight[10].fullname
    end 
    unless runThirdShortsRight[11].nil?  
      rtsr12 = runThirdShortsRight[11].fullname 
    end
    unless runThirdShortsRight[12].nil?  
      rtsr13 = runThirdShortsRight[12].fullname
    end
    unless runThirdShortsRight[13].nil?  
      rtsr14 = runThirdShortsRight[13].fullname 
    end
    unless runThirdShortsRight[14].nil?  
      rtsr15 = runThirdShortsRight[14].fullname
    end

    if rtsr1.nil?
      new_data.gsub! /Sit 8 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 1\b/, rtsr1 
    end 
    if rtsr2.nil?
      new_data.gsub! /Sit 8 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 2\b/, rtsr2 
    end   
    if rtsr3.nil?
      new_data.gsub! /Sit 8 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 3\b/, rtsr3 
    end 
    if rtsr4.nil?
      new_data.gsub! /Sit 8 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 4\b/, rtsr4 
    end 
    if rtsr5.nil?
      new_data.gsub! /Sit 8 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 5\b/, rtsr5 
    end 
    if rtsr6.nil?
      new_data.gsub! /Sit 8 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 6\b/, rtsr6 
    end 
    if rtsr7.nil?
      new_data.gsub! /Sit 8 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 7\b/, rtsr7 
    end                     
    if rtsr8.nil?
      new_data.gsub! /Sit 8 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 8\b/, rtsr8
    end    
    if rtsr9.nil?
      new_data.gsub! /Sit 8 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 9\b/, rtsr9 
    end    
    if rtsr10.nil?
      new_data.gsub! /Sit 8 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 10\b/, rtsr10 
    end 
    if rtsr11.nil?
      new_data.gsub! /Sit 8 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 11\b/, rtsr11 
    end 
    if rtsr12.nil?
      new_data.gsub! /Sit 8 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 12\b/, rtsr12 
    end   
    if rtsr13.nil?
      new_data.gsub! /Sit 8 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 13\b/, rtsr13 
    end 
    if rtsr14.nil?
      new_data.gsub! /Sit 8 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 14\b/, rtsr14 
    end 
    if rtsr15.nil?
      new_data.gsub! /Sit 8 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 8 Run Rt Play 15\b/, rtsr15 
    end 

    if rtsr1.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 1\b/, rtsr1 
    end 
    if rtsr2.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 2\b/, rtsr2 
    end   
    if rtsr3.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 3\b/, rtsr3 
    end 
    if rtsr4.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 4\b/, rtsr4 
    end 
    if rtsr5.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 5\b/, rtsr5 
    end 
    if rtsr6.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 6\b/, rtsr6 
    end 
    if rtsr7.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 7\b/, rtsr7 
    end                     
    if rtsr8.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 8\b/, rtsr8
    end    
    if rtsr9.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 9\b/, rtsr9 
    end    
    if rtsr10.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 10\b/, rtsr10 
    end 
    if rtsr11.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 11\b/, rtsr11 
    end 
    if rtsr12.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 12\b/, rtsr12 
    end   
    if rtsr13.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 13\b/, rtsr13 
    end 
    if rtsr14.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 14\b/, rtsr14 
    end 
    if rtsr15.nil?
      new_data2.gsub! /Sit 8 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 8 Run Rt Play 15\b/, rtsr15 
    end 

    #Pass Left Hash
    unless passThirdShortsLeft[0].nil?  
      ptsl1 = passThirdShortsLeft[0].fullname 
    end
    unless passThirdShortsLeft[1].nil?  
      ptsl2 = passThirdShortsLeft[1].fullname 
    end
    unless passThirdShortsLeft[2].nil?  
      ptsl3 = passThirdShortsLeft[2].fullname 
    end
    unless passThirdShortsLeft[3].nil?  
      ptsl4 = passThirdShortsLeft[3].fullname 
    end
    unless passThirdShortsLeft[4].nil?  
      ptsl5 = passThirdShortsLeft[4].fullname 
    end
    unless passThirdShortsLeft[5].nil?  
      ptsl6 = passThirdShortsLeft[5].fullname 
    end
    unless passThirdShortsLeft[6].nil?  
      ptsl7 = passThirdShortsLeft[6].fullname 
    end
    unless passThirdShortsLeft[7].nil?  
      ptsl8 = passThirdShortsLeft[7].fullname 
    end
    unless passThirdShortsLeft[8].nil?  
      ptsl9 = passThirdShortsLeft[8].fullname 
    end
    unless passThirdShortsLeft[9].nil?  
      ptsl10 = passThirdShortsLeft[9].fullname 
    end
    unless passThirdShortsLeft[10].nil?  
      ptsl11 = passThirdShortsLeft[10].fullname 
    end
    unless passThirdShortsLeft[11].nil?  
      ptsl12 = passThirdShortsLeft[11].fullname 
    end
    unless passThirdShortsLeft[12].nil?  
      ptsl13 = passThirdShortsLeft[12].fullname 
    end
    unless passThirdShortsLeft[13].nil?  
      ptsl14 = passThirdShortsLeft[13].fullname 
    end
    unless passThirdShortsLeft[14].nil?  
      ptsl15 = passThirdShortsLeft[14].fullname 
    end

    if ptsl1.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 1\b/, ptsl1 
    end 
    if ptsl2.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 2\b/, ptsl2 
    end   
    if ptsl3.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 3\b/, ptsl3 
    end 
    if ptsl4.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 4\b/, ptsl4 
    end 
    if ptsl5.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 5\b/, ptsl5 
    end 
    if ptsl6.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 6\b/, ptsl6 
    end 
    if ptsl7.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 7\b/, ptsl7 
    end                     
    if ptsl8.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 8\b/, ptsl8
    end    
    if ptsl9.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 9\b/, ptsl9 
    end    
    if ptsl10.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 10\b/, ptsl10 
    end 
    if ptsl11.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 11\b/, ptsl11 
    end 
    if ptsl12.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 12\b/, ptsl12 
    end   
    if ptsl13.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 13\b/, ptsl13 
    end 
    if ptsl14.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 14\b/, ptsl14 
    end 
    if ptsl15.nil?
      new_data.gsub! /Sit 8 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Lt Play 15\b/, ptsl15 
    end 

    if ptsl1.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 1\b/, ptsl1 
    end 
    if ptsl2.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 2\b/, ptsl2 
    end   
    if ptsl3.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 3\b/, ptsl3 
    end 
    if ptsl4.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 4\b/, ptsl4 
    end 
    if ptsl5.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 5\b/, ptsl5 
    end 
    if ptsl6.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 6\b/, ptsl6 
    end 
    if ptsl7.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 7\b/, ptsl7 
    end                     
    if ptsl8.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 8\b/, ptsl8
    end    
    if ptsl9.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 9\b/, ptsl9 
    end    
    if ptsl10.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 10\b/, ptsl10 
    end 
    if ptsl11.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 11\b/, ptsl11 
    end 
    if ptsl12.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 12\b/, ptsl12 
    end   
    if ptsl13.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 13\b/, ptsl13 
    end 
    if ptsl14.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 14\b/, ptsl14 
    end 
    if ptsl15.nil?
      new_data2.gsub! /Sit 8 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Lt Play 15\b/, ptsl15 
    end 

    #Pass Right Hash
    unless passThirdShortsRight[0].nil?  
      ptsr1 = passThirdShortsRight[0].fullname 
    end
    unless passThirdShortsRight[1].nil?  
      ptsr2 = passThirdShortsRight[1].fullname 
    end
    unless passThirdShortsRight[2].nil?  
      ptsr3 = passThirdShortsRight[2].fullname 
    end
    unless passThirdShortsRight[3].nil?  
      ptsr4 = passThirdShortsRight[3].fullname 
    end
    unless passThirdShortsRight[4].nil?  
      ptsr5 = passThirdShortsRight[4].fullname 
    end
    unless passThirdShortsRight[5].nil?  
      ptsr6 = passThirdShortsRight[5].fullname 
    end
    unless passThirdShortsRight[6].nil?  
      ptsr7 = passThirdShortsRight[6].fullname 
    end
    unless passThirdShortsRight[7].nil?  
      ptsr8 = passThirdShortsRight[7].fullname 
    end
    unless passThirdShortsRight[8].nil?  
      ptsr9 = passThirdShortsRight[8].fullname 
    end
    unless passThirdShortsRight[9].nil?  
      ptsr10 = passThirdShortsRight[9].fullname 
    end
    unless passThirdShortsRight[10].nil?  
      ptsr11 = passThirdShortsRight[10].fullname 
    end
    unless passThirdShortsRight[11].nil?  
      ptsr12 = passThirdShortsRight[11].fullname 
    end
    unless passThirdShortsRight[12].nil?  
      ptsr13 = passThirdShortsRight[12].fullname 
    end
    unless passThirdShortsRight[13].nil?  
      ptsr14 = passThirdShortsRight[13].fullname 
    end
    unless passThirdShortsRight[14].nil?  
      ptsr15 = passThirdShortsRight[14].fullname 
    end

    if ptsr1.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 1\b/, ptsr1 
    end 
    if ptsr2.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 2\b/, ptsr2 
    end   
    if ptsr3.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 3\b/, ptsr3 
    end 
    if ptsr4.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 4\b/, ptsr4 
    end 
    if ptsr5.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 5\b/, ptsr5 
    end 
    if ptsr6.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 6\b/, ptsr6 
    end 
    if ptsr7.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 7\b/, ptsr7 
    end                     
    if ptsr8.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 8\b/, ptsr8
    end    
    if ptsr9.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 9\b/, ptsr9 
    end    
    if ptsr10.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 10\b/, ptsr10 
    end 
    if ptsr11.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 11\b/, ptsr11 
    end 
    if ptsr12.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 12\b/, ptsr12 
    end   
    if ptsr13.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 13\b/, ptsr13 
    end 
    if ptsr14.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 14\b/, ptsr14 
    end 
    if ptsr15.nil?
      new_data.gsub! /Sit 8 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 8 Pass Rt Play 15\b/, ptsr15 
    end 

    if ptsr1.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 1\b/, ptsr1 
    end 
    if ptsr2.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 2\b/, ptsr2 
    end   
    if ptsr3.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 3\b/, ptsr3 
    end 
    if ptsr4.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 4\b/, ptsr4 
    end 
    if ptsr5.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 5\b/, ptsr5 
    end 
    if ptsr6.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 6\b/, ptsr6 
    end 
    if ptsr7.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 7\b/, ptsr7 
    end                     
    if ptsr8.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 8\b/, ptsr8
    end    
    if ptsr9.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 9\b/, ptsr9 
    end    
    if ptsr10.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 10\b/, ptsr10 
    end 
    if ptsr11.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 11\b/, ptsr11 
    end 
    if ptsr12.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 12\b/, ptsr12 
    end   
    if ptsr13.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 13\b/, ptsr13 
    end 
    if ptsr14.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 14\b/, ptsr14 
    end 
    if ptsr15.nil?
      new_data2.gsub! /Sit 8 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 8 Pass Rt Play 15\b/, ptsr15 
    end     
    #----------End 3rd & Short----------

    #----------Redzone----------
    redzones = event.plays.where('situation9 = ?', true)
     
    runredzones = redzones.where('play_type = ?', 'Run')
    runredzonesLeft = runredzones.where('hash_mark = ?', 'Left')
    runredzonesRight = runredzones.where('hash_mark = ?', 'Right')
     
    passredzones = redzones.where('play_type = ?', 'Pass')
    passredzonesLeft = passredzones.where('hash_mark = ?', 'Left')
    passredzonesRight = passredzones.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runredzonesLeft[0].nil?  
      rrzl1 = runredzonesLeft[0].fullname 
    end
    unless runredzonesLeft[1].nil?  
      rrzl2 = runredzonesLeft[1].fullname 
    end
    unless runredzonesLeft[2].nil?  
      rrzl3 = runredzonesLeft[2].fullname 
    end
    unless runredzonesLeft[3].nil?  
      rrzl4 = runredzonesLeft[3].fullname 
    end
    unless runredzonesLeft[4].nil?  
      rrzl5 = runredzonesLeft[4].fullname
    end
    unless runredzonesLeft[5].nil?  
      rrzl6 = runredzonesLeft[5].fullname 
    end
    unless runredzonesLeft[6].nil?  
      rrzl7 = runredzonesLeft[6].fullname
    end    
    unless runredzonesLeft[7].nil?  
      rrzl8 = runredzonesLeft[7].fullname 
    end
    unless runredzonesLeft[8].nil?  
      rrzl9 = runredzonesLeft[8].fullname 
    end
    unless runredzonesLeft[9].nil?  
      rrzl10 = runredzonesLeft[9].fullname 
    end
    unless runredzonesLeft[10].nil?  
      rrzl11 = runredzonesLeft[10].fullname 
    end
    unless runredzonesLeft[11].nil?  
      rrzl12 = runredzonesLeft[11].fullname
    end
    unless runredzonesLeft[12].nil?  
      rrzl13 = runredzonesLeft[12].fullname 
    end
    unless runredzonesLeft[13].nil?  
      rrzl14 = runredzonesLeft[13].fullname
    end 
    unless runredzonesLeft[14].nil?  
      rrzl15 = runredzonesLeft[14].fullname
    end 

    if rrzl1.nil?
      new_data.gsub! /Sit 9 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 1\b/, rrzl1 
    end 
    if rrzl2.nil?
      new_data.gsub! /Sit 9 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 2\b/, rrzl2 
    end   
    if rrzl3.nil?
      new_data.gsub! /Sit 9 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 3\b/, rrzl3 
    end 
    if rrzl4.nil?
      new_data.gsub! /Sit 9 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 4\b/, rrzl4 
    end 
    if rrzl5.nil?
      new_data.gsub! /Sit 9 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 5\b/, rrzl5 
    end 
    if rrzl6.nil?
      new_data.gsub! /Sit 9 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 6\b/, rrzl6 
    end 
    if rrzl7.nil?
      new_data.gsub! /Sit 9 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 7\b/, rrzl7 
    end                     
    if rrzl8.nil?
      new_data.gsub! /Sit 9 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 8\b/, rrzl8
    end    
    if rrzl9.nil?
      new_data.gsub! /Sit 9 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 9\b/, rrzl9 
    end    
    if rrzl10.nil?
      new_data.gsub! /Sit 9 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 10\b/, rrzl10 
    end 
    if rrzl11.nil?
      new_data.gsub! /Sit 9 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 11\b/, rrzl11 
    end 
    if rrzl12.nil?
      new_data.gsub! /Sit 9 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 12\b/, rrzl12 
    end   
    if rrzl13.nil?
      new_data.gsub! /Sit 9 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 13\b/, rrzl13 
    end 
    if rrzl14.nil?
      new_data.gsub! /Sit 9 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 14\b/, rrzl14 
    end 
    if rrzl15.nil?
      new_data.gsub! /Sit 9 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 9 Run Lt Play 15\b/, rrzl15 
    end 

    if rrzl1.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 1\b/, rrzl1 
    end 
    if rrzl2.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 2\b/, rrzl2 
    end   
    if rrzl3.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 3\b/, rrzl3 
    end 
    if rrzl4.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 4\b/, rrzl4 
    end 
    if rrzl5.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 5\b/, rrzl5 
    end 
    if rrzl6.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 6\b/, rrzl6 
    end 
    if rrzl7.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 7\b/, rrzl7 
    end                     
    if rrzl8.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 8\b/, rrzl8
    end    
    if rrzl9.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 9\b/, rrzl9 
    end    
    if rrzl10.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 10\b/, rrzl10 
    end 
    if rrzl11.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 11\b/, rrzl11 
    end 
    if rrzl12.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 12\b/, rrzl12 
    end   
    if rrzl13.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 13\b/, rrzl13 
    end 
    if rrzl14.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 14\b/, rrzl14 
    end 
    if rrzl15.nil?
      new_data2.gsub! /Sit 9 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Lt Play 15\b/, rrzl15 
    end 

    #Run Right Hash
    unless runredzonesRight[0].nil?  
      rrzr1 = runredzonesRight[0].fullname 
    end
    unless runredzonesRight[1].nil?  
      rrzr2 = runredzonesRight[1].fullname 
    end
    unless runredzonesRight[2].nil?  
      rrzr3 = runredzonesRight[2].fullname 
    end
    unless runredzonesRight[3].nil?  
      rrzr4 = runredzonesRight[3].fullname 
    end
    unless runredzonesRight[4].nil?  
      rrzr5 = runredzonesRight[4].fullname
    end
    unless runredzonesRight[5].nil?  
      rrzr6 = runredzonesRight[5].fullname 
    end
    unless runredzonesRight[6].nil?  
      rrzr7 = runredzonesRight[6].fullname
    end    
    unless runredzonesRight[7].nil?  
      rrzr8 = runredzonesRight[7].fullname 
    end
    unless runredzonesRight[8].nil?  
      rrzr9 = runredzonesRight[8].fullname 
    end
    unless runredzonesRight[9].nil?  
      rrzr10 = runredzonesRight[9].fullname 
    end
    unless runredzonesRight[10].nil?  
      rrzr11 = runredzonesRight[10].fullname 
    end
    unless runredzonesRight[11].nil?  
      rrzr12 = runredzonesRight[11].fullname
    end
    unless runredzonesRight[12].nil?  
      rrzr13 = runredzonesRight[12].fullname 
    end
    unless runredzonesRight[13].nil?  
      rrzr14 = runredzonesRight[13].fullname
    end 
    unless runredzonesRight[14].nil?  
      rrzr15 = runredzonesRight[14].fullname
    end 

    if rrzr1.nil?
      new_data.gsub! /Sit 9 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 1\b/, rrzr1 
    end 
    if rrzr2.nil?
      new_data.gsub! /Sit 9 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 2\b/, rrzr2 
    end   
    if rrzr3.nil?
      new_data.gsub! /Sit 9 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 3\b/, rrzr3 
    end 
    if rrzr4.nil?
      new_data.gsub! /Sit 9 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 4\b/, rrzr4 
    end 
    if rrzr5.nil?
      new_data.gsub! /Sit 9 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 5\b/, rrzr5 
    end 
    if rrzr6.nil?
      new_data.gsub! /Sit 9 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 6\b/, rrzr6 
    end 
    if rrzr7.nil?
      new_data.gsub! /Sit 9 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 7\b/, rrzr7 
    end                     
    if rrzr8.nil?
      new_data.gsub! /Sit 9 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 8\b/, rrzr8
    end    
    if rrzr9.nil?
      new_data.gsub! /Sit 9 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 9\b/, rrzr9 
    end    
    if rrzr10.nil?
      new_data.gsub! /Sit 9 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 10\b/, rrzr10 
    end 
    if rrzr11.nil?
      new_data.gsub! /Sit 9 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 11\b/, rrzr11 
    end 
    if rrzr12.nil?
      new_data.gsub! /Sit 9 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 12\b/, rrzr12 
    end   
    if rrzr13.nil?
      new_data.gsub! /Sit 9 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 13\b/, rrzr13 
    end 
    if rrzr14.nil?
      new_data.gsub! /Sit 9 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 14\b/, rrzr14 
    end 
    if rrzr15.nil?
      new_data.gsub! /Sit 9 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 9 Run Rt Play 15\b/, rrzr15 
    end 

    if rrzr1.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 1\b/, rrzr1 
    end 
    if rrzr2.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 2\b/, rrzr2 
    end   
    if rrzr3.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 3\b/, rrzr3 
    end 
    if rrzr4.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 4\b/, rrzr4 
    end 
    if rrzr5.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 5\b/, rrzr5 
    end 
    if rrzr6.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 6\b/, rrzr6 
    end 
    if rrzr7.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 7\b/, rrzr7 
    end                     
    if rrzr8.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 8\b/, rrzr8
    end    
    if rrzr9.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 9\b/, rrzr9 
    end    
    if rrzr10.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 10\b/, rrzr10 
    end 
    if rrzr11.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 11\b/, rrzr11 
    end 
    if rrzr12.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 12\b/, rrzr12 
    end   
    if rrzr13.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 13\b/, rrzr13 
    end 
    if rrzr14.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 14\b/, rrzr14 
    end 
    if rrzr15.nil?
      new_data2.gsub! /Sit 9 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 9 Run Rt Play 15\b/, rrzr15 
    end

    #Pass Left Hash
    unless passredzonesLeft[0].nil?  
      przl1 = passredzonesLeft[0].fullname 
    end
    unless passredzonesLeft[1].nil?  
      przl2 = passredzonesLeft[1].fullname 
    end
    unless passredzonesLeft[2].nil?  
      przl3 = passredzonesLeft[2].fullname 
    end
    unless passredzonesLeft[3].nil?  
      przl4 = passredzonesLeft[3].fullname 
    end
    unless passredzonesLeft[4].nil?  
      przl5 = passredzonesLeft[4].fullname 
    end
    unless passredzonesLeft[5].nil?  
      przl6 = passredzonesLeft[5].fullname 
    end 
    unless passredzonesLeft[6].nil?  
      przl7 = passredzonesLeft[6].fullname 
    end       
    unless passredzonesLeft[7].nil?  
      przl8 = passredzonesLeft[7].fullname 
    end
    unless passredzonesLeft[8].nil?  
      przl9 = passredzonesLeft[8].fullname 
    end
    unless passredzonesLeft[9].nil?  
      przl10 = passredzonesLeft[9].fullname 
    end
    unless passredzonesLeft[10].nil?  
      przl11 = passredzonesLeft[10].fullname 
    end
    unless passredzonesLeft[11].nil?  
      przl12 = passredzonesLeft[11].fullname 
    end
    unless passredzonesLeft[12].nil?  
      przl13 = passredzonesLeft[12].fullname 
    end 
    unless passredzonesLeft[13].nil?  
      przl14 = passredzonesLeft[13].fullname 
    end 
    unless passredzonesLeft[14].nil?  
      przl15 = passredzonesLeft[14].fullname 
    end 

    if przl1.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 1\b/, przl1 
    end 
    if przl2.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 2\b/, przl2 
    end   
    if przl3.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 3\b/, przl3 
    end 
    if przl4.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 4\b/, przl4 
    end 
    if przl5.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 5\b/, przl5 
    end 
    if przl6.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 6\b/, przl6 
    end 
    if przl7.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 7\b/, przl7 
    end                     
    if przl8.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 8\b/, przl8
    end    
    if przl9.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 9\b/, przl9 
    end    
    if przl10.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 10\b/, przl10 
    end 
    if przl11.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 11\b/, przl11 
    end 
    if przl12.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 12\b/, przl12 
    end   
    if przl13.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 13\b/, przl13 
    end 
    if przl14.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 14\b/, przl14 
    end 
    if przl15.nil?
      new_data.gsub! /Sit 9 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Lt Play 15\b/, przl15 
    end 

    if przl1.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 1\b/, przl1 
    end 
    if przl2.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 2\b/, przl2 
    end   
    if przl3.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 3\b/, przl3 
    end 
    if przl4.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 4\b/, przl4 
    end 
    if przl5.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 5\b/, przl5 
    end 
    if przl6.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 6\b/, przl6 
    end 
    if przl7.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 7\b/, przl7 
    end                     
    if przl8.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 8\b/, przl8
    end    
    if przl9.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 9\b/, przl9 
    end    
    if przl10.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 10\b/, przl10 
    end 
    if przl11.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 11\b/, przl11 
    end 
    if przl12.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 12\b/, przl12 
    end   
    if przl13.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 13\b/, przl13 
    end 
    if przl14.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 14\b/, przl14 
    end 
    if przl15.nil?
      new_data2.gsub! /Sit 9 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Lt Play 15\b/, przl15 
    end 

    #Pass Right Hash
    unless passredzonesRight[0].nil?  
      przr1 = passredzonesRight[0].fullname 
    end
    unless passredzonesRight[1].nil?  
      przr2 = passredzonesRight[1].fullname 
    end
    unless passredzonesRight[2].nil?  
      przr3 = passredzonesRight[2].fullname 
    end
    unless passredzonesRight[3].nil?  
      przr4 = passredzonesRight[3].fullname 
    end
    unless passredzonesRight[4].nil?  
      przr5 = passredzonesRight[4].fullname 
    end
    unless passredzonesRight[5].nil?  
      przr6 = passredzonesRight[5].fullname 
    end
    unless passredzonesRight[6].nil?  
      przr7 = passredzonesRight[6].fullname 
    end   
    unless passredzonesRight[7].nil?  
      przr8 = passredzonesRight[7].fullname 
    end
    unless passredzonesRight[8].nil?  
      przr9 = passredzonesRight[8].fullname 
    end
    unless passredzonesRight[9].nil?  
      przr10 = passredzonesRight[9].fullname 
    end
    unless passredzonesRight[10].nil?  
      przr11 = passredzonesRight[10].fullname 
    end
    unless passredzonesRight[11].nil?  
      przr12 = passredzonesRight[11].fullname 
    end
    unless passredzonesRight[12].nil?  
      przr13 = passredzonesRight[12].fullname 
    end
    unless passredzonesRight[13].nil?  
      przr14 = passredzonesRight[13].fullname 
    end     
    unless passredzonesRight[14].nil?  
      przr15 = passredzonesRight[14].fullname 
    end 

    if przr1.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 1\b/, przr1 
    end 
    if przr2.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 2\b/, przr2 
    end   
    if przr3.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 3\b/, przr3 
    end 
    if przr4.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 4\b/, przr4 
    end 
    if przr5.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 5\b/, przr5 
    end 
    if przr6.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 6\b/, przr6 
    end 
    if przr7.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 7\b/, przr7 
    end                     
    if przr8.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 8\b/, przr8
    end    
    if przr9.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 9\b/, przr9 
    end    
    if przr10.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 10\b/, przr10 
    end 
    if przr11.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 11\b/, przr11 
    end 
    if przr12.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 12\b/, przr12 
    end   
    if przr13.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 13\b/, przr13 
    end 
    if przr14.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 14\b/, przr14 
    end 
    if przr15.nil?
      new_data.gsub! /Sit 9 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 9 Pass Rt Play 15\b/, przr15 
    end 

    if przr1.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 1\b/, przr1 
    end 
    if przr2.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 2\b/, przr2 
    end   
    if przr3.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 3\b/, przr3 
    end 
    if przr4.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 4\b/, przr4 
    end 
    if przr5.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 5\b/, przr5 
    end 
    if przr6.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 6\b/, przr6 
    end 
    if przr7.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 7\b/, przr7 
    end                     
    if przr8.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 8\b/, przr8
    end    
    if przr9.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 9\b/, przr9 
    end    
    if przr10.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 10\b/, przr10 
    end 
    if przr11.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 11\b/, przr11 
    end 
    if przr12.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 12\b/, przr12 
    end   
    if przr13.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 13\b/, przr13 
    end 
    if przr14.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 14\b/, przr14 
    end 
    if przr15.nil?
      new_data2.gsub! /Sit 9 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 9 Pass Rt Play 15\b/, przr15 
    end     
    #----------End Red Zone-------------

    #----------Goal Line----------
    goalines = event.plays.where('situation10 = ?', true)
     
    rungoalines = goalines.where('play_type = ?', 'Run')
    rungoalinesLeft = rungoalines.where('hash_mark = ?', 'Left')
    rungoalinesRight = rungoalines.where('hash_mark = ?', 'Right')
     
    passgoalines = goalines.where('play_type = ?', 'Pass')
    passgoalinesLeft = passgoalines.where('hash_mark = ?', 'Left')
    passgoalinesRight = passgoalines.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless rungoalinesLeft[0].nil?  
      rgll1 = rungoalinesLeft[0].fullname 
    end
    unless rungoalinesLeft[1].nil?  
      rgll2 = rungoalinesLeft[1].fullname 
    end
    unless rungoalinesLeft[2].nil?  
      rgll3 = rungoalinesLeft[2].fullname 
    end
    unless rungoalinesLeft[3].nil?  
      rgll4 = rungoalinesLeft[3].fullname 
    end
    unless rungoalinesLeft[4].nil?  
      rgll5 = rungoalinesLeft[4].fullname
    end
    unless rungoalinesLeft[5].nil?  
      rgll6 = rungoalinesLeft[5].fullname 
    end
    unless rungoalinesLeft[6].nil?  
      rgll7 = rungoalinesLeft[6].fullname
    end  
      unless rungoalinesLeft[7].nil?  
      rgll8 = rungoalinesLeft[7].fullname 
    end
    unless rungoalinesLeft[8].nil?  
      rgll9 = rungoalinesLeft[8].fullname 
    end
    unless rungoalinesLeft[9].nil?  
      rgll10 = rungoalinesLeft[9].fullname 
    end
    unless rungoalinesLeft[10].nil?  
      rgll11 = rungoalinesLeft[10].fullname 
    end
    unless rungoalinesLeft[11].nil?  
      rgll12 = rungoalinesLeft[11].fullname
    end
    unless rungoalinesLeft[12].nil?  
      rgll13 = rungoalinesLeft[12].fullname 
    end
    unless rungoalinesLeft[13].nil?  
      rgll14 = rungoalinesLeft[13].fullname
    end  
    unless rungoalinesLeft[14].nil?  
      rgll15 = rungoalinesLeft[14].fullname
    end

    if rgll1.nil?
      new_data.gsub! /Sit 10 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 1\b/, rgll1 
    end 
    if rgll2.nil?
      new_data.gsub! /Sit 10 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 2\b/, rgll2 
    end   
    if rgll3.nil?
      new_data.gsub! /Sit 10 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 3\b/, rgll3 
    end 
    if rgll4.nil?
      new_data.gsub! /Sit 10 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 4\b/, rgll4 
    end 
    if rgll5.nil?
      new_data.gsub! /Sit 10 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 5\b/, rgll5 
    end 
    if rgll6.nil?
      new_data.gsub! /Sit 10 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 6\b/, rgll6 
    end 
    if rgll7.nil?
      new_data.gsub! /Sit 10 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 7\b/, rgll7 
    end                     
    if rgll8.nil?
      new_data.gsub! /Sit 10 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 8\b/, rgll8
    end    
    if rgll9.nil?
      new_data.gsub! /Sit 10 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 9\b/, rgll9 
    end    
    if rgll10.nil?
      new_data.gsub! /Sit 10 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 10\b/, rgll10 
    end 
    if rgll11.nil?
      new_data.gsub! /Sit 10 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 11\b/, rgll11 
    end 
    if rgll12.nil?
      new_data.gsub! /Sit 10 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 12\b/, rgll12 
    end   
    if rgll13.nil?
      new_data.gsub! /Sit 10 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 13\b/, rgll13 
    end 
    if rgll14.nil?
      new_data.gsub! /Sit 10 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 14\b/, rgll14 
    end 
    if rgll15.nil?
      new_data.gsub! /Sit 10 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 10 Run Lt Play 15\b/, rgll15 
    end 

    if rgll1.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 1\b/, rgll1 
    end 
    if rgll2.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 2\b/, rgll2 
    end   
    if rgll3.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 3\b/, rgll3 
    end 
    if rgll4.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 4\b/, rgll4 
    end 
    if rgll5.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 5\b/, rgll5 
    end 
    if rgll6.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 6\b/, rgll6 
    end 
    if rgll7.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 7\b/, rgll7 
    end                     
    if rgll8.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 8\b/, rgll8
    end    
    if rgll9.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 9\b/, rgll9 
    end    
    if rgll10.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 10\b/, rgll10 
    end 
    if rgll11.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 11\b/, rgll11 
    end 
    if rgll12.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 12\b/, rgll12 
    end   
    if rgll13.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 13\b/, rgll13 
    end 
    if rgll14.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 14\b/, rgll14 
    end 
    if rgll15.nil?
      new_data2.gsub! /Sit 10 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Lt Play 15\b/, rgll15 
    end 

    #Run Right Hash
    unless rungoalinesRight[0].nil?  
      rglr1 = rungoalinesRight[0].fullname 
    end
    unless rungoalinesRight[1].nil?  
      rglr2 = rungoalinesRight[1].fullname 
    end
    unless rungoalinesRight[2].nil?  
      rglr3 = rungoalinesRight[2].fullname 
    end
    unless rungoalinesRight[3].nil?  
      rglr4 = rungoalinesRight[3].fullname 
    end
    unless rungoalinesRight[4].nil?  
      rglr5 = rungoalinesRight[4].fullname
    end
    unless rungoalinesRight[5].nil?  
      rglr6 = rungoalinesRight[5].fullname 
    end
    unless rungoalinesRight[6].nil?  
      rglr7 = rungoalinesRight[6].fullname
    end    
    unless rungoalinesRight[7].nil?  
      rglr8 = rungoalinesRight[7].fullname 
    end
    unless rungoalinesRight[8].nil?  
      rglr9 = rungoalinesRight[8].fullname 
    end
    unless rungoalinesRight[9].nil?  
      rglr10 = rungoalinesRight[9].fullname 
    end
    unless rungoalinesRight[10].nil?  
      rglr11 = rungoalinesRight[10].fullname 
    end
    unless rungoalinesRight[11].nil?  
      rglr12 = rungoalinesRight[11].fullname
    end
    unless rungoalinesRight[12].nil?  
      rglr13 = rungoalinesRight[12].fullname 
    end
    unless rungoalinesRight[13].nil?  
      rglr14 = rungoalinesRight[13].fullname
    end 
    unless rungoalinesRight[14].nil?  
      rglr15 = rungoalinesRight[14].fullname
    end 

    if rglr1.nil?
      new_data.gsub! /Sit 10 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 1\b/, rglr1 
    end 
    if rglr2.nil?
      new_data.gsub! /Sit 10 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 2\b/, rglr2 
    end   
    if rglr3.nil?
      new_data.gsub! /Sit 10 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 3\b/, rglr3 
    end 
    if rglr4.nil?
      new_data.gsub! /Sit 10 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 4\b/, rglr4 
    end 
    if rglr5.nil?
      new_data.gsub! /Sit 10 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 5\b/, rglr5 
    end 
    if rglr6.nil?
      new_data.gsub! /Sit 10 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 6\b/, rglr6 
    end 
    if rglr7.nil?
      new_data.gsub! /Sit 10 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 7\b/, rglr7 
    end                     
    if rglr8.nil?
      new_data.gsub! /Sit 10 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 8\b/, rglr8
    end    
    if rglr9.nil?
      new_data.gsub! /Sit 10 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 9\b/, rglr9 
    end    
    if rglr10.nil?
      new_data.gsub! /Sit 10 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 10\b/, rglr10 
    end 
    if rglr11.nil?
      new_data.gsub! /Sit 10 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 11\b/, rglr11 
    end 
    if rglr12.nil?
      new_data.gsub! /Sit 10 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 12\b/, rglr12 
    end   
    if rglr13.nil?
      new_data.gsub! /Sit 10 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 13\b/, rglr13 
    end 
    if rglr14.nil?
      new_data.gsub! /Sit 10 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 14\b/, rglr14 
    end 
    if rglr15.nil?
      new_data.gsub! /Sit 10 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 10 Run Rt Play 15\b/, rglr15 
    end 

    if rglr1.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 1\b/, rglr1 
    end 
    if rglr2.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 2\b/, rglr2 
    end   
    if rglr3.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 3\b/, rglr3 
    end 
    if rglr4.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 4\b/, rglr4 
    end 
    if rglr5.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 5\b/, rglr5 
    end 
    if rglr6.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 6\b/, rglr6 
    end 
    if rglr7.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 7\b/, rglr7 
    end                     
    if rglr8.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 8\b/, rglr8
    end    
    if rglr9.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 9\b/, rglr9 
    end    
    if rglr10.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 10\b/, rglr10 
    end 
    if rglr11.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 11\b/, rglr11 
    end 
    if rglr12.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 12\b/, rglr12 
    end   
    if rglr13.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 13\b/, rglr13 
    end 
    if rglr14.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 14\b/, rglr14 
    end 
    if rglr15.nil?
      new_data2.gsub! /Sit 10 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 10 Run Rt Play 15\b/, rglr15 
    end

    #Pass Left Hash
    unless passgoalinesLeft[0].nil?  
      pgll1 = passgoalinesLeft[0].fullname 
    end
    unless passgoalinesLeft[1].nil?  
      pgll2 = passgoalinesLeft[1].fullname 
    end
    unless passgoalinesLeft[2].nil?  
      pgll3 = passgoalinesLeft[2].fullname 
    end
    unless passgoalinesLeft[3].nil?  
      pgll4 = passgoalinesLeft[3].fullname 
    end
    unless passgoalinesLeft[4].nil?  
      pgll5 = passgoalinesLeft[4].fullname 
    end
    unless passgoalinesLeft[5].nil?  
      pgll6 = passgoalinesLeft[5].fullname 
    end 
    unless passgoalinesLeft[6].nil?  
      pgll7 = passgoalinesLeft[6].fullname 
    end       
    unless passgoalinesLeft[7].nil?  
      pgll8 = passgoalinesLeft[7].fullname 
    end
    unless passgoalinesLeft[8].nil?  
      pgll9 = passgoalinesLeft[8].fullname 
    end
    unless passgoalinesLeft[9].nil?  
      pgll10 = passgoalinesLeft[9].fullname 
    end
    unless passgoalinesLeft[10].nil?  
      pgll11 = passgoalinesLeft[10].fullname 
    end
    unless passgoalinesLeft[11].nil?  
      pgll12 = passgoalinesLeft[11].fullname 
    end
    unless passgoalinesLeft[12].nil?  
      pgll13 = passgoalinesLeft[12].fullname 
    end 
    unless passgoalinesLeft[13].nil?  
      pgll14 = passgoalinesLeft[13].fullname 
    end 
    unless passgoalinesLeft[14].nil?  
      pgll15 = passgoalinesLeft[14].fullname 
    end 

    if pgll1.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 1\b/, pgll1 
    end 
    if pgll2.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 2\b/, pgll2 
    end   
    if pgll3.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 3\b/, pgll3 
    end 
    if pgll4.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 4\b/, pgll4 
    end 
    if pgll5.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 5\b/, pgll5 
    end 
    if pgll6.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 6\b/, pgll6 
    end 
    if pgll7.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 7\b/, pgll7 
    end                     
    if pgll8.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 8\b/, pgll8
    end    
    if pgll9.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 9\b/, pgll9 
    end    
    if pgll10.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 10\b/, pgll10 
    end 
    if pgll11.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 11\b/, pgll11 
    end 
    if pgll12.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 12\b/, pgll12 
    end   
    if pgll13.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 13\b/, pgll13 
    end 
    if pgll14.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 14\b/, pgll14 
    end 
    if pgll15.nil?
      new_data.gsub! /Sit 10 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Lt Play 15\b/, pgll15 
    end 

    if pgll1.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 1\b/, pgll1 
    end 
    if pgll2.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 2\b/, pgll2 
    end   
    if pgll3.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 3\b/, pgll3 
    end 
    if pgll4.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 4\b/, pgll4 
    end 
    if pgll5.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 5\b/, pgll5 
    end 
    if pgll6.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 6\b/, pgll6 
    end 
    if pgll7.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 7\b/, pgll7 
    end                     
    if pgll8.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 8\b/, pgll8
    end    
    if pgll9.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 9\b/, pgll9 
    end    
    if pgll10.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 10\b/, pgll10 
    end 
    if pgll11.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 11\b/, pgll11 
    end 
    if pgll12.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 12\b/, pgll12 
    end   
    if pgll13.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 13\b/, pgll13 
    end 
    if pgll14.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 14\b/, pgll14 
    end 
    if pgll15.nil?
      new_data2.gsub! /Sit 10 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Lt Play 15\b/, pgll15 
    end 

    #Pass Right Hash
    unless passgoalinesRight[0].nil?  
      pglr1 = passgoalinesRight[0].fullname 
    end
    unless passgoalinesRight[1].nil?  
      pglr2 = passgoalinesRight[1].fullname 
    end
    unless passgoalinesRight[2].nil?  
      pglr3 = passgoalinesRight[2].fullname 
    end
    unless passgoalinesRight[3].nil?  
      pglr4 = passgoalinesRight[3].fullname 
    end
    unless passgoalinesRight[4].nil?  
      pglr5 = passgoalinesRight[4].fullname 
    end
    unless passgoalinesRight[5].nil?  
      pglr6 = passgoalinesRight[5].fullname 
    end
    unless passgoalinesRight[6].nil?  
      pglr7 = passgoalinesRight[6].fullname 
    end    
    unless passgoalinesRight[7].nil?  
      pglr8 = passgoalinesRight[7].fullname 
    end
    unless passgoalinesRight[8].nil?  
      pglr9 = passgoalinesRight[8].fullname 
    end
    unless passgoalinesRight[9].nil?  
      pglr10 = passgoalinesRight[9].fullname 
    end
    unless passgoalinesRight[10].nil?  
      pglr11 = passgoalinesRight[10].fullname 
    end
    unless passgoalinesRight[11].nil?  
      pglr12 = passgoalinesRight[11].fullname 
    end
    unless passgoalinesRight[12].nil?  
      pglr13 = passgoalinesRight[12].fullname 
    end
    unless passgoalinesRight[13].nil?  
      pglr14 = passgoalinesRight[13].fullname 
    end 
    unless passgoalinesRight[14].nil?  
      pglr15 = passgoalinesRight[14].fullname 
    end 

    if pglr1.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 1\b/, pglr1 
    end 
    if pglr2.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 2\b/, pglr2 
    end   
    if pglr3.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 3\b/, pglr3 
    end 
    if pglr4.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 4\b/, pglr4 
    end 
    if pglr5.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 5\b/, pglr5 
    end 
    if pglr6.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 6\b/, pglr6 
    end 
    if pglr7.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 7\b/, pglr7 
    end                     
    if pglr8.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 8\b/, pglr8
    end    
    if pglr9.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 9\b/, pglr9 
    end    
    if pglr10.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 10\b/, pglr10 
    end 
    if pglr11.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 11\b/, pglr11 
    end 
    if pglr12.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 12\b/, pglr12 
    end   
    if pglr13.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 13\b/, pglr13 
    end 
    if pglr14.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 14\b/, pglr14 
    end 
    if pglr15.nil?
      new_data.gsub! /Sit 10 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 10 Pass Rt Play 15\b/, pglr15 
    end  

    if pglr1.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 1\b/, pglr1 
    end 
    if pglr2.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 2\b/, pglr2 
    end   
    if pglr3.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 3\b/, pglr3 
    end 
    if pglr4.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 4\b/, pglr4 
    end 
    if pglr5.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 5\b/, pglr5 
    end 
    if pglr6.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 6\b/, pglr6 
    end 
    if pglr7.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 7\b/, pglr7 
    end                     
    if pglr8.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 8\b/, pglr8
    end    
    if pglr9.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 9\b/, pglr9 
    end    
    if pglr10.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 10\b/, pglr10 
    end 
    if pglr11.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 11\b/, pglr11 
    end 
    if pglr12.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 12\b/, pglr12 
    end   
    if pglr13.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 13\b/, pglr13 
    end 
    if pglr14.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 14\b/, pglr14 
    end 
    if pglr15.nil?
      new_data2.gsub! /Sit 10 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 10 Pass Rt Play 15\b/, pglr15 
    end           
    #----------End Goal Line------------

    #----------Coming Out----------
    comingOuts = event.plays.where('situation11 = ?', true)
     
    runComingOuts = comingOuts.where('play_type = ?', 'Run')
    runComingOutsLeft = runComingOuts.where('hash_mark = ?', 'Left')
    runComingOutsRight = runComingOuts.where('hash_mark = ?', 'Right')
     
    passComingOuts = comingOuts.where('play_type = ?', 'Pass')
    passComingOutsLeft = passComingOuts.where('hash_mark = ?', 'Left')
    passComingOutsRight = passComingOuts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runComingOutsLeft[0].nil?  
      rcol1 = runComingOutsLeft[0].fullname 
    end
    unless runComingOutsLeft[1].nil?  
      rcol2 = runComingOutsLeft[1].fullname 
    end
    unless runComingOutsLeft[2].nil?  
      rcol3 = runComingOutsLeft[2].fullname 
    end
    unless runComingOutsLeft[3].nil?  
      rcol4 = runComingOutsLeft[3].fullname 
    end
    unless runComingOutsLeft[4].nil?  
      rcol5 = runComingOutsLeft[4].fullname
    end
    unless runComingOutsLeft[5].nil?  
      rcol6 = runComingOutsLeft[5].fullname 
    end
    unless runComingOutsLeft[6].nil?  
      rcol7 = runComingOutsLeft[6].fullname
    end    
    unless runComingOutsLeft[7].nil?  
      rcol8 = runComingOutsLeft[7].fullname 
    end
    unless runComingOutsLeft[8].nil?  
      rcol9 = runComingOutsLeft[8].fullname 
    end
    unless runComingOutsLeft[9].nil?  
      rcol10 = runComingOutsLeft[9].fullname 
    end
    unless runComingOutsLeft[10].nil?  
      rcol11 = runComingOutsLeft[10].fullname 
    end
    unless runComingOutsLeft[11].nil?  
      rcol12 = runComingOutsLeft[11].fullname
    end
    unless runComingOutsLeft[12].nil?  
      rcol13 = runComingOutsLeft[12].fullname 
    end
    unless runComingOutsLeft[13].nil?  
      rcol14 = runComingOutsLeft[13].fullname
    end  
    unless runComingOutsLeft[14].nil?  
      rcol15 = runComingOutsLeft[14].fullname
    end 

    if rcol1.nil?
      new_data.gsub! /Sit 11 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 1\b/, rcol1 
    end 
    if rcol2.nil?
      new_data.gsub! /Sit 11 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 2\b/, rcol2 
    end   
    if rcol3.nil?
      new_data.gsub! /Sit 11 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 3\b/, rcol3 
    end 
    if rcol4.nil?
      new_data.gsub! /Sit 11 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 4\b/, rcol4 
    end 
    if rcol5.nil?
      new_data.gsub! /Sit 11 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 5\b/, rcol5 
    end 
    if rcol6.nil?
      new_data.gsub! /Sit 11 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 6\b/, rcol6 
    end 
    if rcol7.nil?
      new_data.gsub! /Sit 11 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 7\b/, rcol7 
    end                     
    if rcol8.nil?
      new_data.gsub! /Sit 11 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 8\b/, rcol8
    end    
    if rcol9.nil?
      new_data.gsub! /Sit 11 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 9\b/, rcol9 
    end    
    if rcol10.nil?
      new_data.gsub! /Sit 11 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 10\b/, rcol10 
    end 
    if rcol11.nil?
      new_data.gsub! /Sit 11 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 11\b/, rcol11 
    end 
    if rcol12.nil?
      new_data.gsub! /Sit 11 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 12\b/, rcol12 
    end   
    if rcol13.nil?
      new_data.gsub! /Sit 11 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 13\b/, rcol13 
    end 
    if rcol14.nil?
      new_data.gsub! /Sit 11 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 14\b/, rcol14 
    end 
    if rcol15.nil?
      new_data.gsub! /Sit 11 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 11 Run Lt Play 15\b/, rcol15 
    end 

    if rcol1.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 1\b/, rcol1 
    end 
    if rcol2.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 2\b/, rcol2 
    end   
    if rcol3.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 3\b/, rcol3 
    end 
    if rcol4.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 4\b/, rcol4 
    end 
    if rcol5.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 5\b/, rcol5 
    end 
    if rcol6.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 6\b/, rcol6 
    end 
    if rcol7.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 7\b/, rcol7 
    end                     
    if rcol8.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 8\b/, rcol8
    end    
    if rcol9.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 9\b/, rcol9 
    end    
    if rcol10.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 10\b/, rcol10 
    end 
    if rcol11.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 11\b/, rcol11 
    end 
    if rcol12.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 12\b/, rcol12 
    end   
    if rcol13.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 13\b/, rcol13 
    end 
    if rcol14.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 14\b/, rcol14 
    end 
    if rcol15.nil?
      new_data2.gsub! /Sit 11 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Lt Play 15\b/, rcol15 
    end 

    #Run Right Hash
    unless runComingOutsRight[0].nil?  
      rcor1 = runComingOutsRight[0].fullname 
    end
    unless runComingOutsRight[1].nil?  
      rcor2 = runComingOutsRight[1].fullname 
    end
    unless runComingOutsRight[2].nil?  
      rcor3 = runComingOutsRight[2].fullname 
    end
    unless runComingOutsRight[3].nil?  
      rcor4 = runComingOutsRight[3].fullname 
    end
    unless runComingOutsRight[4].nil?  
      rcor5 = runComingOutsRight[4].fullname
    end
    unless runComingOutsRight[5].nil?  
      rcor6 = runComingOutsRight[5].fullname 
    end
    unless runComingOutsRight[6].nil?  
      rcor7 = runComingOutsRight[6].fullname
    end    
    unless runComingOutsRight[7].nil?  
      rcor8 = runComingOutsRight[7].fullname 
    end
    unless runComingOutsRight[8].nil?  
      rcor9 = runComingOutsRight[8].fullname 
    end
    unless runComingOutsRight[9].nil?  
      rcor10 = runComingOutsRight[9].fullname 
    end
    unless runComingOutsRight[10].nil?  
      rcor11 = runComingOutsRight[10].fullname 
    end
    unless runComingOutsRight[11].nil?  
      rcor12 = runComingOutsRight[11].fullname
    end
    unless runComingOutsRight[12].nil?  
      rcor13 = runComingOutsRight[12].fullname 
    end
    unless runComingOutsRight[13].nil?  
      rcor14 = runComingOutsRight[13].fullname
    end
    unless runComingOutsRight[14].nil?  
      rcor15 = runComingOutsRight[14].fullname
    end

    if rcor1.nil?
      new_data.gsub! /Sit 11 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 1\b/, rcor1 
    end 
    if rcor2.nil?
      new_data.gsub! /Sit 11 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 2\b/, rcor2 
    end   
    if rcor3.nil?
      new_data.gsub! /Sit 11 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 3\b/, rcor3 
    end 
    if rcor4.nil?
      new_data.gsub! /Sit 11 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 4\b/, rcor4 
    end 
    if rcor5.nil?
      new_data.gsub! /Sit 11 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 5\b/, rcor5 
    end 
    if rcor6.nil?
      new_data.gsub! /Sit 11 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 6\b/, rcor6 
    end 
    if rcor7.nil?
      new_data.gsub! /Sit 11 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 7\b/, rcor7 
    end                     
    if rcor8.nil?
      new_data.gsub! /Sit 11 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 8\b/, rcor8
    end    
    if rcor9.nil?
      new_data.gsub! /Sit 11 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 9\b/, rcor9 
    end    
    if rcor10.nil?
      new_data.gsub! /Sit 11 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 10\b/, rcor10 
    end 
    if rcor11.nil?
      new_data.gsub! /Sit 11 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 11\b/, rcor11 
    end 
    if rcor12.nil?
      new_data.gsub! /Sit 11 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 12\b/, rcor12 
    end   
    if rcor13.nil?
      new_data.gsub! /Sit 11 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 13\b/, rcor13 
    end 
    if rcor14.nil?
      new_data.gsub! /Sit 11 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 14\b/, rcor14 
    end 
    if rcor15.nil?
      new_data.gsub! /Sit 11 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 11 Run Rt Play 15\b/, rcor15 
    end 

    if rcor1.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 1\b/, rcor1 
    end 
    if rcor2.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 2\b/, rcor2 
    end   
    if rcor3.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 3\b/, rcor3 
    end 
    if rcor4.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 4\b/, rcor4 
    end 
    if rcor5.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 5\b/, rcor5 
    end 
    if rcor6.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 6\b/, rcor6 
    end 
    if rcor7.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 7\b/, rcor7 
    end                     
    if rcor8.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 8\b/, rcor8
    end    
    if rcor9.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 9\b/, rcor9 
    end    
    if rcor10.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 10\b/, rcor10 
    end 
    if rcor11.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 11\b/, rcor11 
    end 
    if rcor12.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 12\b/, rcor12 
    end   
    if rcor13.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 13\b/, rcor13 
    end 
    if rcor14.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 14\b/, rcor14 
    end 
    if rcor15.nil?
      new_data2.gsub! /Sit 11 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 11 Run Rt Play 15\b/, rcor15 
    end 

    #Pass Left Hash
    unless passComingOutsLeft[0].nil?  
      pcol1 = passComingOutsLeft[0].fullname 
    end
    unless passComingOutsLeft[1].nil?  
      pcol2 = passComingOutsLeft[1].fullname 
    end
    unless passComingOutsLeft[2].nil?  
      pcol3 = passComingOutsLeft[2].fullname 
    end
    unless passComingOutsLeft[3].nil?  
      pcol4 = passComingOutsLeft[3].fullname 
    end
    unless passComingOutsLeft[4].nil?  
      pcol5 = passComingOutsLeft[4].fullname 
    end
    unless passComingOutsLeft[5].nil?  
      pcol6 = passComingOutsLeft[5].fullname 
    end 
    unless passComingOutsLeft[6].nil?  
      pcol7 = passComingOutsLeft[6].fullname 
    end       
    unless passComingOutsLeft[7].nil?  
      pcol8 = passComingOutsLeft[7].fullname 
    end
    unless passComingOutsLeft[8].nil?  
      pcol9 = passComingOutsLeft[8].fullname 
    end
    unless passComingOutsLeft[9].nil?  
      pcol10 = passComingOutsLeft[9].fullname 
    end
    unless passComingOutsLeft[10].nil?  
      pcol11 = passComingOutsLeft[10].fullname 
    end
    unless passComingOutsLeft[11].nil?  
      pcol12 = passComingOutsLeft[11].fullname 
    end
    unless passComingOutsLeft[12].nil?  
      pcol13 = passComingOutsLeft[12].fullname 
    end 
    unless passComingOutsLeft[13].nil?  
      pcol14 = passComingOutsLeft[13].fullname 
    end
    unless passComingOutsLeft[14].nil?  
      pcol15 = passComingOutsLeft[14].fullname 
    end

    if pcol1.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 1\b/, pcol1 
    end 
    if pcol2.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 2\b/, pcol2 
    end   
    if pcol3.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 3\b/, pcol3 
    end 
    if pcol4.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 4\b/, pcol4 
    end 
    if pcol5.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 5\b/, pcol5 
    end 
    if pcol6.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 6\b/, pcol6 
    end 
    if pcol7.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 7\b/, pcol7 
    end                     
    if pcol8.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 8\b/, pcol8
    end    
    if pcol9.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 9\b/, pcol9 
    end    
    if pcol10.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 10\b/, pcol10 
    end 
    if pcol11.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 11\b/, pcol11 
    end 
    if pcol12.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 12\b/, pcol12 
    end   
    if pcol13.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 13\b/, pcol13 
    end 
    if pcol14.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 14\b/, pcol14 
    end 
    if pcol15.nil?
      new_data.gsub! /Sit 11 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Lt Play 15\b/, pcol15 
    end 

    if pcol1.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 1\b/, pcol1 
    end 
    if pcol2.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 2\b/, pcol2 
    end   
    if pcol3.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 3\b/, pcol3 
    end 
    if pcol4.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 4\b/, pcol4 
    end 
    if pcol5.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 5\b/, pcol5 
    end 
    if pcol6.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 6\b/, pcol6 
    end 
    if pcol7.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 7\b/, pcol7 
    end                     
    if pcol8.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 8\b/, pcol8
    end    
    if pcol9.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 9\b/, pcol9 
    end    
    if pcol10.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 10\b/, pcol10 
    end 
    if pcol11.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 11\b/, pcol11 
    end 
    if pcol12.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 12\b/, pcol12 
    end   
    if pcol13.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 13\b/, pcol13 
    end 
    if pcol14.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 14\b/, pcol14 
    end 
    if pcol15.nil?
      new_data2.gsub! /Sit 11 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Lt Play 15\b/, pcol15 
    end 

    #Pass Right Hash
    unless passComingOutsRight[0].nil?  
      pcor1 = passComingOutsRight[0].fullname 
    end
    unless passComingOutsRight[1].nil?  
      pcor2 = passComingOutsRight[1].fullname 
    end
    unless passComingOutsRight[2].nil?  
      pcor3 = passComingOutsRight[2].fullname 
    end
    unless passComingOutsRight[3].nil?  
      pcor4 = passComingOutsRight[3].fullname 
    end
    unless passComingOutsRight[4].nil?  
      pcor5 = passComingOutsRight[4].fullname 
    end
    unless passComingOutsRight[5].nil?  
      pcor6 = passComingOutsRight[5].fullname 
    end
    unless passComingOutsRight[6].nil?  
      pcor7 = passComingOutsRight[6].fullname 
    end     
    unless passComingOutsRight[7].nil?  
      pcor8 = passComingOutsRight[7].fullname 
    end
    unless passComingOutsRight[8].nil?  
      pcor9 = passComingOutsRight[8].fullname 
    end
    unless passComingOutsRight[9].nil?  
      pcor10 = passComingOutsRight[9].fullname 
    end
    unless passComingOutsRight[10].nil?  
      pcor11 = passComingOutsRight[10].fullname 
    end
    unless passComingOutsRight[11].nil?  
      pcor12 = passComingOutsRight[11].fullname 
    end
    unless passComingOutsRight[12].nil?  
      pcor13 = passComingOutsRight[12].fullname 
    end
    unless passComingOutsRight[13].nil?  
      pcor14 = passComingOutsRight[13].fullname 
    end   
    unless passComingOutsRight[14].nil?  
      pcor15 = passComingOutsRight[14].fullname 
    end  

    if pcor1.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 1\b/, pcor1 
    end 
    if pcor2.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 2\b/, pcor2 
    end   
    if pcor3.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 3\b/, pcor3 
    end 
    if pcor4.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 4\b/, pcor4 
    end 
    if pcor5.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 5\b/, pcor5 
    end 
    if pcor6.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 6\b/, pcor6 
    end 
    if pcor7.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 7\b/, pcor7 
    end                     
    if pcor8.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 8\b/, pcor8
    end    
    if pcor9.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 9\b/, pcor9 
    end    
    if pcor10.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 10\b/, pcor10 
    end 
    if pcor11.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 11\b/, pcor11 
    end 
    if pcor12.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 12\b/, pcor12 
    end   
    if pcor13.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 13\b/, pcor13 
    end 
    if pcor14.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 14\b/, pcor14 
    end 
    if pcor15.nil?
      new_data.gsub! /Sit 11 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 11 Pass Rt Play 15\b/, pcor15 
    end  

    if pcor1.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 1\b/, pcor1 
    end 
    if pcor2.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 2\b/, pcor2 
    end   
    if pcor3.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 3\b/, pcor3 
    end 
    if pcor4.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 4\b/, pcor4 
    end 
    if pcor5.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 5\b/, pcor5 
    end 
    if pcor6.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 6\b/, pcor6 
    end 
    if pcor7.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 7\b/, pcor7 
    end                     
    if pcor8.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 8\b/, pcor8
    end    
    if pcor9.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 9\b/, pcor9 
    end    
    if pcor10.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 10\b/, pcor10 
    end 
    if pcor11.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 11\b/, pcor11 
    end 
    if pcor12.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 12\b/, pcor12 
    end   
    if pcor13.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 13\b/, pcor13 
    end 
    if pcor14.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 14\b/, pcor14 
    end 
    if pcor15.nil?
      new_data2.gsub! /Sit 11 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 11 Pass Rt Play 15\b/, pcor15 
    end        
    #----------End Coming Out-----------

    #----------Custom 1----------
    customOnes = event.plays.where('situation12 = ?', true)
     
    runCustomOnes = customOnes.where('play_type = ?', 'Run')
    runCustomOnesLeft = runCustomOnes.where('hash_mark = ?', 'Left')
    runCustomOnesRight = runCustomOnes.where('hash_mark = ?', 'Right')
     
    passCustomOnes = customOnes.where('play_type = ?', 'Pass')
    passCustomOnesLeft = passCustomOnes.where('hash_mark = ?', 'Left')
    passCustomOnesRight = passCustomOnes.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runCustomOnesLeft[0].nil?  
      rcuol1 = runCustomOnesLeft[0].fullname 
    end
    unless runCustomOnesLeft[1].nil?  
      rcuol2 = runCustomOnesLeft[1].fullname 
    end
    unless runCustomOnesLeft[2].nil?  
      rcuol3 = runCustomOnesLeft[2].fullname 
    end
    unless runCustomOnesLeft[3].nil?  
      rcuol4 = runCustomOnesLeft[3].fullname 
    end
    unless runCustomOnesLeft[4].nil?  
      rcuol5 = runCustomOnesLeft[4].fullname
    end
    unless runCustomOnesLeft[5].nil?  
      rcuol6 = runCustomOnesLeft[5].fullname 
    end
    unless runCustomOnesLeft[6].nil?  
      rcuol7 = runCustomOnesLeft[6].fullname
    end    
    unless runCustomOnesLeft[7].nil?  
      rcuol8 = runCustomOnesLeft[7].fullname 
    end
    unless runCustomOnesLeft[8].nil?  
      rcuol9 = runCustomOnesLeft[8].fullname 
    end
    unless runCustomOnesLeft[9].nil?  
      rcuol10 = runCustomOnesLeft[9].fullname 
    end
    unless runCustomOnesLeft[10].nil?  
      rcuol11 = runCustomOnesLeft[10].fullname 
    end
    unless runCustomOnesLeft[11].nil?  
      rcuol12 = runCustomOnesLeft[11].fullname
    end
    unless runCustomOnesLeft[12].nil?  
      rcuol13 = runCustomOnesLeft[12].fullname 
    end
    unless runCustomOnesLeft[13].nil?  
      rcuol14 = runCustomOnesLeft[13].fullname
    end 
    unless runCustomOnesLeft[14].nil?  
      rcuol15 = runCustomOnesLeft[14].fullname
    end 

    if rcuol1.nil?
      new_data.gsub! /Sit 12 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 1\b/, rcuol1 
    end 
    if rcuol2.nil?
      new_data.gsub! /Sit 12 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 2\b/, rcuol2 
    end   
    if rcuol3.nil?
      new_data.gsub! /Sit 12 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 3\b/, rcuol3 
    end 
    if rcuol4.nil?
      new_data.gsub! /Sit 12 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 4\b/, rcuol4 
    end 
    if rcuol5.nil?
      new_data.gsub! /Sit 12 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 5\b/, rcuol5 
    end 
    if rcuol6.nil?
      new_data.gsub! /Sit 12 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 6\b/, rcuol6 
    end 
    if rcuol7.nil?
      new_data.gsub! /Sit 12 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 7\b/, rcuol7 
    end                     
    if rcuol8.nil?
      new_data.gsub! /Sit 12 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 8\b/, rcuol8
    end    
    if rcuol9.nil?
      new_data.gsub! /Sit 12 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 9\b/, rcuol9 
    end    
    if rcuol10.nil?
      new_data.gsub! /Sit 12 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 10\b/, rcuol10 
    end 
    if rcuol11.nil?
      new_data.gsub! /Sit 12 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 11\b/, rcuol11 
    end 
    if rcuol12.nil?
      new_data.gsub! /Sit 12 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 12\b/, rcuol12 
    end   
    if rcuol13.nil?
      new_data.gsub! /Sit 12 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 13\b/, rcuol13 
    end 
    if rcuol14.nil?
      new_data.gsub! /Sit 12 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 14\b/, rcuol14 
    end 
    if rcuol15.nil?
      new_data.gsub! /Sit 12 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 12 Run Lt Play 15\b/, rcuol15 
    end 

    if rcuol1.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 1\b/, rcuol1 
    end 
    if rcuol2.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 2\b/, rcuol2 
    end   
    if rcuol3.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 3\b/, rcuol3 
    end 
    if rcuol4.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 4\b/, rcuol4 
    end 
    if rcuol5.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 5\b/, rcuol5 
    end 
    if rcuol6.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 6\b/, rcuol6 
    end 
    if rcuol7.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 7\b/, rcuol7 
    end                     
    if rcuol8.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 8\b/, rcuol8
    end    
    if rcuol9.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 9\b/, rcuol9 
    end    
    if rcuol10.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 10\b/, rcuol10 
    end 
    if rcuol11.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 11\b/, rcuol11 
    end 
    if rcuol12.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 12\b/, rcuol12 
    end   
    if rcuol13.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 13\b/, rcuol13 
    end 
    if rcuol14.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 14\b/, rcuol14 
    end 
    if rcuol15.nil?
      new_data2.gsub! /Sit 12 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Lt Play 15\b/, rcuol15 
    end 

    #Run Right Hash
    unless runCustomOnesRight[0].nil?  
      rcuor1 = runCustomOnesRight[0].fullname 
    end
    unless runCustomOnesRight[1].nil?  
      rcuor2 = runCustomOnesRight[1].fullname 
    end
    unless runCustomOnesRight[2].nil?  
      rcuor3 = runCustomOnesRight[2].fullname 
    end
    unless runCustomOnesRight[3].nil?  
      rcuor4 = runCustomOnesRight[3].fullname 
    end
    unless runCustomOnesRight[4].nil?  
      rcuor5 = runCustomOnesRight[4].fullname
    end
    unless runCustomOnesRight[5].nil?  
      rcuor6 = runCustomOnesRight[5].fullname 
    end
    unless runCustomOnesRight[6].nil?  
      rcuor7 = runCustomOnesRight[6].fullname
    end    
    unless runCustomOnesRight[7].nil?  
      rcuor8 = runCustomOnesRight[7].fullname 
    end
    unless runCustomOnesRight[8].nil?  
      rcuor9 = runCustomOnesRight[8].fullname 
    end
    unless runCustomOnesRight[9].nil?  
      rcuor10 = runCustomOnesRight[9].fullname 
    end
    unless runCustomOnesRight[10].nil?  
      rcuor11 = runCustomOnesRight[10].fullname 
    end
    unless runCustomOnesRight[11].nil?  
      rcuor12 = runCustomOnesRight[11].fullname
    end
    unless runCustomOnesRight[12].nil?  
      rcuor13 = runCustomOnesRight[12].fullname 
    end
    unless runCustomOnesRight[13].nil?  
      rcuor14 = runCustomOnesRight[13].fullname
    end 
    unless runCustomOnesRight[14].nil?  
      rcuor15 = runCustomOnesRight[14].fullname
    end 

    if rcuor1.nil?
      new_data.gsub! /Sit 12 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 1\b/, rcuor1 
    end 
    if rcuor2.nil?
      new_data.gsub! /Sit 12 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 2\b/, rcuor2 
    end   
    if rcuor3.nil?
      new_data.gsub! /Sit 12 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 3\b/, rcuor3 
    end 
    if rcuor4.nil?
      new_data.gsub! /Sit 12 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 4\b/, rcuor4 
    end 
    if rcuor5.nil?
      new_data.gsub! /Sit 12 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 5\b/, rcuor5 
    end 
    if rcuor6.nil?
      new_data.gsub! /Sit 12 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 6\b/, rcuor6 
    end 
    if rcuor7.nil?
      new_data.gsub! /Sit 12 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 7\b/, rcuor7 
    end                     
    if rcuor8.nil?
      new_data.gsub! /Sit 12 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 8\b/, rcuor8
    end    
    if rcuor9.nil?
      new_data.gsub! /Sit 12 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 9\b/, rcuor9 
    end    
    if rcuor10.nil?
      new_data.gsub! /Sit 12 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 10\b/, rcuor10 
    end 
    if rcuor11.nil?
      new_data.gsub! /Sit 12 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 11\b/, rcuor11 
    end 
    if rcuor12.nil?
      new_data.gsub! /Sit 12 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 12\b/, rcuor12 
    end   
    if rcuor13.nil?
      new_data.gsub! /Sit 12 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 13\b/, rcuor13 
    end 
    if rcuor14.nil?
      new_data.gsub! /Sit 12 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 14\b/, rcuor14 
    end 
    if rcuor15.nil?
      new_data.gsub! /Sit 12 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 12 Run Rt Play 15\b/, rcuor15 
    end 

    if rcuor1.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 1\b/, rcuor1 
    end 
    if rcuor2.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 2\b/, rcuor2 
    end   
    if rcuor3.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 3\b/, rcuor3 
    end 
    if rcuor4.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 4\b/, rcuor4 
    end 
    if rcuor5.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 5\b/, rcuor5 
    end 
    if rcuor6.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 6\b/, rcuor6 
    end 
    if rcuor7.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 7\b/, rcuor7 
    end                     
    if rcuor8.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 8\b/, rcuor8
    end    
    if rcuor9.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 9\b/, rcuor9 
    end    
    if rcuor10.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 10\b/, rcuor10 
    end 
    if rcuor11.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 11\b/, rcuor11 
    end 
    if rcuor12.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 12\b/, rcuor12 
    end   
    if rcuor13.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 13\b/, rcuor13 
    end 
    if rcuor14.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 14\b/, rcuor14 
    end 
    if rcuor15.nil?
      new_data2.gsub! /Sit 12 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 12 Run Rt Play 15\b/, rcuor15 
    end 

    #Pass Left Hash
    unless passCustomOnesLeft[0].nil?  
      pcuol1 = passCustomOnesLeft[0].fullname 
    end
    unless passCustomOnesLeft[1].nil?  
      pcuol2 = passCustomOnesLeft[1].fullname 
    end
    unless passCustomOnesLeft[2].nil?  
      pcuol3 = passCustomOnesLeft[2].fullname 
    end
    unless passCustomOnesLeft[3].nil?  
      pcuol4 = passCustomOnesLeft[3].fullname 
    end
    unless passCustomOnesLeft[4].nil?  
      pcuol5 = passCustomOnesLeft[4].fullname 
    end
    unless passCustomOnesLeft[5].nil?  
      pcuol6 = passCustomOnesLeft[5].fullname 
    end 
    unless passCustomOnesLeft[6].nil?  
      pcuol7 = passCustomOnesLeft[6].fullname 
    end       
    unless passCustomOnesLeft[7].nil?  
      pcuol8 = passCustomOnesLeft[7].fullname 
    end
    unless passCustomOnesLeft[8].nil?  
      pcuol9 = passCustomOnesLeft[8].fullname 
    end
    unless passCustomOnesLeft[9].nil?  
      pcuol10 = passCustomOnesLeft[9].fullname 
    end
    unless passCustomOnesLeft[10].nil?  
      pcuol11 = passCustomOnesLeft[10].fullname 
    end
    unless passCustomOnesLeft[11].nil?  
      pcuol12 = passCustomOnesLeft[11].fullname 
    end
    unless passCustomOnesLeft[12].nil?  
      pcuol13 = passCustomOnesLeft[12].fullname 
    end 
    unless passCustomOnesLeft[13].nil?  
      pcuol14 = passCustomOnesLeft[13].fullname 
    end 
    unless passCustomOnesLeft[14].nil?  
      pcuol15 = passCustomOnesLeft[14].fullname 
    end 

    if pcuol1.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 1\b/, pcuol1 
    end 
    if pcuol2.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 2\b/, pcuol2 
    end   
    if pcuol3.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 3\b/, pcuol3 
    end 
    if pcuol4.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 4\b/, pcuol4 
    end 
    if pcuol5.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 5\b/, pcuol5 
    end 
    if pcuol6.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 6\b/, pcuol6 
    end 
    if pcuol7.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 7\b/, pcuol7 
    end                     
    if pcuol8.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 8\b/, pcuol8
    end    
    if pcuol9.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 9\b/, pcuol9 
    end    
    if pcuol10.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 10\b/, pcuol10 
    end 
    if pcuol11.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 11\b/, pcuol11 
    end 
    if pcuol12.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 12\b/, pcuol12 
    end   
    if pcuol13.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 13\b/, pcuol13 
    end 
    if pcuol14.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 14\b/, pcuol14 
    end 
    if pcuol15.nil?
      new_data.gsub! /Sit 12 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Lt Play 15\b/, pcuol15 
    end 

    if pcuol1.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 1\b/, pcuol1 
    end 
    if pcuol2.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 2\b/, pcuol2 
    end   
    if pcuol3.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 3\b/, pcuol3 
    end 
    if pcuol4.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 4\b/, pcuol4 
    end 
    if pcuol5.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 5\b/, pcuol5 
    end 
    if pcuol6.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 6\b/, pcuol6 
    end 
    if pcuol7.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 7\b/, pcuol7 
    end                     
    if pcuol8.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 8\b/, pcuol8
    end    
    if pcuol9.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 9\b/, pcuol9 
    end    
    if pcuol10.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 10\b/, pcuol10 
    end 
    if pcuol11.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 11\b/, pcuol11 
    end 
    if pcuol12.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 12\b/, pcuol12 
    end   
    if pcuol13.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 13\b/, pcuol13 
    end 
    if pcuol14.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 14\b/, pcuol14 
    end 
    if pcuol15.nil?
      new_data2.gsub! /Sit 12 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Lt Play 15\b/, pcuol15 
    end 

    #Pass Right Hash
    unless passCustomOnesRight[0].nil?  
      pcuor1 = passCustomOnesRight[0].fullname 
    end
    unless passCustomOnesRight[1].nil?  
      pcuor2 = passCustomOnesRight[1].fullname 
    end
    unless passCustomOnesRight[2].nil?  
      pcuor3 = passCustomOnesRight[2].fullname 
    end
    unless passCustomOnesRight[3].nil?  
      pcuor4 = passCustomOnesRight[3].fullname 
    end
    unless passCustomOnesRight[4].nil?  
      pcuor5 = passCustomOnesRight[4].fullname 
    end
    unless passCustomOnesRight[5].nil?  
      pcuor6 = passCustomOnesRight[5].fullname 
    end
    unless passCustomOnesRight[6].nil?  
      pcuor7 = passCustomOnesRight[6].fullname 
    end    
    unless passCustomOnesRight[7].nil?  
      pcuor8 = passCustomOnesRight[7].fullname 
    end
    unless passCustomOnesRight[8].nil?  
      pcuor9 = passCustomOnesRight[8].fullname 
    end
    unless passCustomOnesRight[9].nil?  
      pcuor10 = passCustomOnesRight[9].fullname 
    end
    unless passCustomOnesRight[10].nil?  
      pcuor11 = passCustomOnesRight[10].fullname 
    end
    unless passCustomOnesRight[11].nil?  
      pcuor12 = passCustomOnesRight[11].fullname 
    end
    unless passCustomOnesRight[12].nil?  
      pcuor13 = passCustomOnesRight[12].fullname 
    end
    unless passCustomOnesRight[13].nil?  
      pcuor14 = passCustomOnesRight[13].fullname 
    end       
    unless passCustomOnesRight[14].nil?  
      pcuor15 = passCustomOnesRight[14].fullname 
    end

    if pcuor1.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 1\b/, pcuor1 
    end 
    if pcuor2.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 2\b/, pcuor2 
    end   
    if pcuor3.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 3\b/, pcuor3 
    end 
    if pcuor4.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 4\b/, pcuor4 
    end 
    if pcuor5.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 5\b/, pcuor5 
    end 
    if pcuor6.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 6\b/, pcuor6 
    end 
    if pcuor7.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 7\b/, pcuor7 
    end                     
    if pcuor8.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 8\b/, pcuor8
    end    
    if pcuor9.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 9\b/, pcuor9 
    end    
    if pcuor10.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 10\b/, pcuor10 
    end 
    if pcuor11.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 11\b/, pcuor11 
    end 
    if pcuor12.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 12\b/, pcuor12 
    end   
    if pcuor13.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 13\b/, pcuor13 
    end 
    if pcuor14.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 14\b/, pcuor14 
    end 
    if pcuor15.nil?
      new_data.gsub! /Sit 12 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 12 Pass Rt Play 15\b/, pcuor15 
    end   

    if pcuor1.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 1\b/, pcuor1 
    end 
    if pcuor2.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 2\b/, pcuor2 
    end   
    if pcuor3.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 3\b/, pcuor3 
    end 
    if pcuor4.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 4\b/, pcuor4 
    end 
    if pcuor5.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 5\b/, pcuor5 
    end 
    if pcuor6.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 6\b/, pcuor6 
    end 
    if pcuor7.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 7\b/, pcuor7 
    end                     
    if pcuor8.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 8\b/, pcuor8
    end    
    if pcuor9.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 9\b/, pcuor9 
    end    
    if pcuor10.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 10\b/, pcuor10 
    end 
    if pcuor11.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 11\b/, pcuor11 
    end 
    if pcuor12.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 12\b/, pcuor12 
    end   
    if pcuor13.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 13\b/, pcuor13 
    end 
    if pcuor14.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 14\b/, pcuor14 
    end 
    if pcuor15.nil?
      new_data2.gsub! /Sit 12 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 12 Pass Rt Play 15\b/, pcuor15 
    end       
    #----------End Custom 1-------------

    #----------Custom 2----------
    customTwos = event.plays.where('situation13 = ?', true)
     
    runCustomTwos = customTwos.where('play_type = ?', 'Run')
    runCustomTwosLeft = runCustomTwos.where('hash_mark = ?', 'Left')
    runCustomTwosRight = runCustomTwos.where('hash_mark = ?', 'Right')
     
    passCustomTwos = customTwos.where('play_type = ?', 'Pass')
    passCustomTwosLeft = passCustomTwos.where('hash_mark = ?', 'Left')
    passCustomTwosRight = passCustomTwos.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runCustomTwosLeft[0].nil?  
      rcutl1 = runCustomTwosLeft[0].fullname 
    end
    unless runCustomTwosLeft[1].nil?  
      rcutl2 = runCustomTwosLeft[1].fullname 
    end
    unless runCustomTwosLeft[2].nil?  
      rcutl3 = runCustomTwosLeft[2].fullname 
    end
    unless runCustomTwosLeft[3].nil?  
      rcutl4 = runCustomTwosLeft[3].fullname 
    end
    unless runCustomTwosLeft[4].nil?  
      rcutl5 = runCustomTwosLeft[4].fullname
    end
    unless runCustomTwosLeft[5].nil?  
      rcutl6 = runCustomTwosLeft[5].fullname 
    end
    unless runCustomTwosLeft[6].nil?  
      rcutl7 = runCustomTwosLeft[6].fullname
    end    
    unless runCustomTwosLeft[7].nil?  
      rcutl8 = runCustomTwosLeft[7].fullname 
    end
    unless runCustomTwosLeft[8].nil?  
      rcutl9 = runCustomTwosLeft[8].fullname 
    end
    unless runCustomTwosLeft[9].nil?  
      rcutl10 = runCustomTwosLeft[9].fullname 
    end
    unless runCustomTwosLeft[10].nil?  
      rcutl11 = runCustomTwosLeft[10].fullname 
    end
    unless runCustomTwosLeft[11].nil?  
      rcutl12 = runCustomTwosLeft[11].fullname
    end
    unless runCustomTwosLeft[12].nil?  
      rcutl13 = runCustomTwosLeft[12].fullname 
    end
    unless runCustomTwosLeft[13].nil?  
      rcutl14 = runCustomTwosLeft[13].fullname
    end 
    unless runCustomTwosLeft[14].nil?  
      rcutl15 = runCustomTwosLeft[14].fullname
    end

    if rcutl1.nil?
      new_data.gsub! /Sit 13 Run Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 1\b/, rcutl1 
    end 
    if rcutl2.nil?
      new_data.gsub! /Sit 13 Run Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 2\b/, rcutl2 
    end   
    if rcutl3.nil?
      new_data.gsub! /Sit 13 Run Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 3\b/, rcutl3 
    end 
    if rcutl4.nil?
      new_data.gsub! /Sit 13 Run Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 4\b/, rcutl4 
    end 
    if rcutl5.nil?
      new_data.gsub! /Sit 13 Run Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 5\b/, rcutl5 
    end 
    if rcutl6.nil?
      new_data.gsub! /Sit 13 Run Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 6\b/, rcutl6 
    end 
    if rcutl7.nil?
      new_data.gsub! /Sit 13 Run Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 7\b/, rcutl7 
    end                     
    if rcutl8.nil?
      new_data.gsub! /Sit 13 Run Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 8\b/, rcutl8
    end    
    if rcutl9.nil?
      new_data.gsub! /Sit 13 Run Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 9\b/, rcutl9 
    end    
    if rcutl10.nil?
      new_data.gsub! /Sit 13 Run Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 10\b/, rcutl10 
    end 
    if rcutl11.nil?
      new_data.gsub! /Sit 13 Run Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 11\b/, rcutl11 
    end 
    if rcutl12.nil?
      new_data.gsub! /Sit 13 Run Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 12\b/, rcutl12 
    end   
    if rcutl13.nil?
      new_data.gsub! /Sit 13 Run Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 13\b/, rcutl13 
    end 
    if rcutl14.nil?
      new_data.gsub! /Sit 13 Run Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 14\b/, rcutl14 
    end 
    if rcutl15.nil?
      new_data.gsub! /Sit 13 Run Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 13 Run Lt Play 15\b/, rcutl15 
    end 

    if rcutl1.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 1\b/, rcutl1 
    end 
    if rcutl2.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 2\b/, rcutl2 
    end   
    if rcutl3.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 3\b/, rcutl3 
    end 
    if rcutl4.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 4\b/, rcutl4 
    end 
    if rcutl5.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 5\b/, rcutl5 
    end 
    if rcutl6.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 6\b/, rcutl6 
    end 
    if rcutl7.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 7\b/, rcutl7 
    end                     
    if rcutl8.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 8\b/, rcutl8
    end    
    if rcutl9.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 9\b/, rcutl9 
    end    
    if rcutl10.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 10\b/, rcutl10 
    end 
    if rcutl11.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 11\b/, rcutl11 
    end 
    if rcutl12.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 12\b/, rcutl12 
    end   
    if rcutl13.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 13\b/, rcutl13 
    end 
    if rcutl14.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 14\b/, rcutl14 
    end 
    if rcutl15.nil?
      new_data2.gsub! /Sit 13 Run Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Lt Play 15\b/, rcutl15 
    end 

    #Run Right Hash
    unless runCustomTwosRight[0].nil?  
      rcutr1 = runCustomTwosRight[0].fullname 
    end
    unless runCustomTwosRight[1].nil?  
      rcutr2 = runCustomTwosRight[1].fullname 
    end
    unless runCustomTwosRight[2].nil?  
      rcutr3 = runCustomTwosRight[2].fullname 
    end
    unless runCustomTwosRight[3].nil?  
      rcutr4 = runCustomTwosRight[3].fullname 
    end
    unless runCustomTwosRight[4].nil?  
      rcutr5 = runCustomTwosRight[4].fullname
    end
    unless runCustomTwosRight[5].nil?  
      rcutr6 = runCustomTwosRight[5].fullname 
    end
    unless runCustomTwosRight[6].nil?  
      rcutr7 = runCustomTwosRight[6].fullname
    end    
    unless runCustomTwosRight[7].nil?  
      rcutr8 = runCustomTwosRight[7].fullname 
    end
    unless runCustomTwosRight[8].nil?  
      rcutr9 = runCustomTwosRight[8].fullname 
    end
    unless runCustomTwosRight[9].nil?  
      rcutr10 = runCustomTwosRight[9].fullname 
    end
    unless runCustomTwosRight[10].nil?  
      rcutr11 = runCustomTwosRight[10].fullname 
    end
    unless runCustomTwosRight[11].nil?  
      rcutr12 = runCustomTwosRight[11].fullname
    end
    unless runCustomTwosRight[12].nil?  
      rcutr13 = runCustomTwosRight[12].fullname 
    end
    unless runCustomTwosRight[13].nil?  
      rcutr14 = runCustomTwosRight[13].fullname
    end 
    unless runCustomTwosRight[14].nil?  
      rcutr15 = runCustomTwosRight[14].fullname
    end 

    if rcutr1.nil?
      new_data.gsub! /Sit 13 Run Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 1\b/, rcutr1 
    end 
    if rcutr2.nil?
      new_data.gsub! /Sit 13 Run Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 2\b/, rcutr2 
    end   
    if rcutr3.nil?
      new_data.gsub! /Sit 13 Run Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 3\b/, rcutr3 
    end 
    if rcutr4.nil?
      new_data.gsub! /Sit 13 Run Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 4\b/, rcutr4 
    end 
    if rcutr5.nil?
      new_data.gsub! /Sit 13 Run Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 5\b/, rcutr5 
    end 
    if rcutr6.nil?
      new_data.gsub! /Sit 13 Run Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 6\b/, rcutr6 
    end 
    if rcutr7.nil?
      new_data.gsub! /Sit 13 Run Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 7\b/, rcutr7 
    end                     
    if rcutr8.nil?
      new_data.gsub! /Sit 13 Run Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 8\b/, rcutr8
    end    
    if rcutr9.nil?
      new_data.gsub! /Sit 13 Run Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 9\b/, rcutr9 
    end    
    if rcutr10.nil?
      new_data.gsub! /Sit 13 Run Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 10\b/, rcutr10 
    end 
    if rcutr11.nil?
      new_data.gsub! /Sit 13 Run Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 11\b/, rcutr11 
    end 
    if rcutr12.nil?
      new_data.gsub! /Sit 13 Run Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 12\b/, rcutr12 
    end   
    if rcutr13.nil?
      new_data.gsub! /Sit 13 Run Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 13\b/, rcutr13 
    end 
    if rcutr14.nil?
      new_data.gsub! /Sit 13 Run Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 14\b/, rcutr14 
    end 
    if rcutr15.nil?
      new_data.gsub! /Sit 13 Run Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 13 Run Rt Play 15\b/, rcutr15 
    end 

    if rcutr1.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 1\b/, rcutr1 
    end 
    if rcutr2.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 2\b/, rcutr2 
    end   
    if rcutr3.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 3\b/, rcutr3 
    end 
    if rcutr4.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 4\b/, rcutr4 
    end 
    if rcutr5.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 5\b/, rcutr5 
    end 
    if rcutr6.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 6\b/, rcutr6 
    end 
    if rcutr7.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 7\b/, rcutr7 
    end                     
    if rcutr8.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 8\b/, rcutr8
    end    
    if rcutr9.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 9\b/, rcutr9 
    end    
    if rcutr10.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 10\b/, rcutr10 
    end 
    if rcutr11.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 11\b/, rcutr11 
    end 
    if rcutr12.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 12\b/, rcutr12 
    end   
    if rcutr13.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 13\b/, rcutr13 
    end 
    if rcutr14.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 14\b/, rcutr14 
    end 
    if rcutr15.nil?
      new_data2.gsub! /Sit 13 Run Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 13 Run Rt Play 15\b/, rcutr15 
    end 

    #Pass Left Hash
    unless passCustomTwosLeft[0].nil?  
      pcutl1 = passCustomTwosLeft[0].fullname 
    end
    unless passCustomTwosLeft[1].nil?  
      pcutl2 = passCustomTwosLeft[1].fullname 
    end
    unless passCustomTwosLeft[2].nil?  
      pcutl3 = passCustomTwosLeft[2].fullname 
    end
    unless passCustomTwosLeft[3].nil?  
      pcutl4 = passCustomTwosLeft[3].fullname 
    end
    unless passCustomTwosLeft[4].nil?  
      pcutl5 = passCustomTwosLeft[4].fullname 
    end
    unless passCustomTwosLeft[5].nil?  
      pcutl6 = passCustomTwosLeft[5].fullname 
    end 
    unless passCustomTwosLeft[6].nil?  
      pcutl7 = passCustomTwosLeft[6].fullname 
    end       
    unless passCustomTwosLeft[7].nil?  
      pcutl8 = passCustomTwosLeft[7].fullname 
    end
    unless passCustomTwosLeft[8].nil?  
      pcutl9 = passCustomTwosLeft[8].fullname 
    end
    unless passCustomTwosLeft[9].nil?  
      pcutl10 = passCustomTwosLeft[9].fullname 
    end
    unless passCustomTwosLeft[10].nil?  
      pcutl11 = passCustomTwosLeft[10].fullname 
    end
    unless passCustomTwosLeft[11].nil?  
      pcutl12 = passCustomTwosLeft[11].fullname 
    end
    unless passCustomTwosLeft[12].nil?  
      pcutl13 = passCustomTwosLeft[12].fullname 
    end 
    unless passCustomTwosLeft[13].nil?  
      pcutl14 = passCustomTwosLeft[13].fullname 
    end 
    unless passCustomTwosLeft[14].nil?  
      pcutl15 = passCustomTwosLeft[14].fullname 
    end 

    if pcutl1.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 1\b/, pcutl1 
    end 
    if pcutl2.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 2\b/, pcutl2 
    end   
    if pcutl3.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 3\b/, pcutl3 
    end 
    if pcutl4.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 4\b/, pcutl4 
    end 
    if pcutl5.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 5\b/, pcutl5 
    end 
    if pcutl6.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 6\b/, pcutl6 
    end 
    if pcutl7.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 7\b/, pcutl7 
    end                     
    if pcutl8.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 8\b/, pcutl8
    end    
    if pcutl9.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 9\b/, pcutl9 
    end    
    if pcutl10.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 10\b/, pcutl10 
    end 
    if pcutl11.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 11\b/, pcutl11 
    end 
    if pcutl12.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 12\b/, pcutl12 
    end   
    if pcutl13.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 13\b/, pcutl13 
    end 
    if pcutl14.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 14\b/, pcutl14 
    end 
    if pcutl15.nil?
      new_data.gsub! /Sit 13 Pass Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Lt Play 15\b/, pcutl15 
    end 

    if pcutl1.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 1\b/, pcutl1 
    end 
    if pcutl2.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 2\b/, pcutl2 
    end   
    if pcutl3.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 3\b/, pcutl3 
    end 
    if pcutl4.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 4\b/, pcutl4 
    end 
    if pcutl5.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 5\b/, pcutl5 
    end 
    if pcutl6.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 6\b/, pcutl6 
    end 
    if pcutl7.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 7\b/, pcutl7 
    end                     
    if pcutl8.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 8\b/, pcutl8
    end    
    if pcutl9.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 9\b/, pcutl9 
    end    
    if pcutl10.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 10\b/, pcutl10 
    end 
    if pcutl11.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 11\b/, pcutl11 
    end 
    if pcutl12.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 12\b/, pcutl12 
    end   
    if pcutl13.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 13\b/, pcutl13 
    end 
    if pcutl14.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 14\b/, pcutl14 
    end 
    if pcutl15.nil?
      new_data2.gsub! /Sit 13 Pass Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Lt Play 15\b/, pcutl15 
    end 

    #Pass Right Hash
    unless passCustomTwosRight[0].nil?  
      pcutr1 = passCustomTwosRight[0].fullname 
    end
    unless passCustomTwosRight[1].nil?  
      pcutr2 = passCustomTwosRight[1].fullname 
    end
    unless passCustomTwosRight[2].nil?  
      pcutr3 = passCustomTwosRight[2].fullname 
    end
    unless passCustomTwosRight[3].nil?  
      pcutr4 = passCustomTwosRight[3].fullname 
    end
    unless passCustomTwosRight[4].nil?  
      pcutr5 = passCustomTwosRight[4].fullname 
    end
    unless passCustomTwosRight[5].nil?  
      pcutr6 = passCustomTwosRight[5].fullname 
    end
    unless passCustomTwosRight[6].nil?  
      pcutr7 = passCustomTwosRight[6].fullname 
    end      
    unless passCustomTwosRight[7].nil?  
      pcutr8 = passCustomTwosRight[7].fullname 
    end
    unless passCustomTwosRight[8].nil?  
      pcutr9 = passCustomTwosRight[8].fullname 
    end
    unless passCustomTwosRight[9].nil?  
      pcutr10 = passCustomTwosRight[9].fullname 
    end
    unless passCustomTwosRight[10].nil?  
      pcutr11 = passCustomTwosRight[10].fullname 
    end
    unless passCustomTwosRight[11].nil?  
      pcutr12 = passCustomTwosRight[11].fullname 
    end
    unless passCustomTwosRight[12].nil?  
      pcutr13 = passCustomTwosRight[12].fullname 
    end
    unless passCustomTwosRight[13].nil?  
      pcutr14 = passCustomTwosRight[13].fullname 
    end   
    unless passCustomTwosRight[14].nil?  
      pcutr15 = passCustomTwosRight[14].fullname 
    end 

    if pcutr1.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 1\b/, pcutr1 
    end 
    if pcutr2.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 2\b/, pcutr2 
    end   
    if pcutr3.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 3\b/, pcutr3 
    end 
    if pcutr4.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 4\b/, pcutr4 
    end 
    if pcutr5.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 5\b/, pcutr5 
    end 
    if pcutr6.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 6\b/, pcutr6 
    end 
    if pcutr7.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 7\b/, pcutr7 
    end                     
    if pcutr8.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 8\b/, pcutr8
    end    
    if pcutr9.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 9\b/, pcutr9 
    end    
    if pcutr10.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 10\b/, pcutr10 
    end 
    if pcutr11.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 11\b/, pcutr11 
    end 
    if pcutr12.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 12\b/, pcutr12 
    end   
    if pcutr13.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 13\b/, pcutr13 
    end 
    if pcutr14.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 14\b/, pcutr14 
    end 
    if pcutr15.nil?
      new_data.gsub! /Sit 13 Pass Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 13 Pass Rt Play 15\b/, pcutr15 
    end  

    if pcutr1.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 1\b/, pcutr1 
    end 
    if pcutr2.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 2\b/, pcutr2 
    end   
    if pcutr3.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 3\b/, pcutr3 
    end 
    if pcutr4.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 4\b/, pcutr4 
    end 
    if pcutr5.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 5\b/, pcutr5 
    end 
    if pcutr6.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 6\b/, pcutr6 
    end 
    if pcutr7.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 7\b/, pcutr7 
    end                     
    if pcutr8.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 8\b/, pcutr8
    end    
    if pcutr9.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 9\b/, pcutr9 
    end    
    if pcutr10.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 10\b/, pcutr10 
    end 
    if pcutr11.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 11\b/, pcutr11 
    end 
    if pcutr12.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 12\b/, pcutr12 
    end   
    if pcutr13.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 13\b/, pcutr13 
    end 
    if pcutr14.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 14\b/, pcutr14 
    end 
    if pcutr15.nil?
      new_data2.gsub! /Sit 13 Pass Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 13 Pass Rt Play 15\b/, pcutr15 
    end       
    #----------End Custom 2-------------

    #----------Custom 3----------
    customThrees = event.plays.where('situation14 = ?', true)
    customThreesLeft = customThrees.where('hash_mark = ?', 'Left')
    customThreesRight = customThrees.where('hash_mark = ?', 'Right')
     
    #Left Hash
    unless customThreesLeft[0].nil?  
      cuthl1 = customThreesLeft[0].fullname 
    end
    unless customThreesLeft[1].nil?  
      cuthl2 = customThreesLeft[1].fullname 
    end
    unless customThreesLeft[2].nil?  
      cuthl3 = customThreesLeft[2].fullname 
    end
    unless customThreesLeft[3].nil?  
      cuthl4 = customThreesLeft[3].fullname 
    end
    unless customThreesLeft[4].nil?  
      cuthl5 = customThreesLeft[4].fullname
    end
    unless customThreesLeft[5].nil?  
      cuthl6 = customThreesLeft[5].fullname 
    end
    unless customThreesLeft[6].nil?  
      cuthl7 = customThreesLeft[6].fullname
    end    
    unless customThreesLeft[7].nil?  
      cuthl8 = customThreesLeft[7].fullname 
    end
    unless customThreesLeft[8].nil?  
      cuthl9 = customThreesLeft[8].fullname 
    end
    unless customThreesLeft[9].nil?  
      cuthl10 = customThreesLeft[9].fullname 
    end
    unless customThreesLeft[10].nil?  
      cuthl11 = customThreesLeft[10].fullname 
    end
    unless customThreesLeft[11].nil?  
      cuthl12 = customThreesLeft[11].fullname
    end
    unless customThreesLeft[12].nil?  
      cuthl13 = customThreesLeft[12].fullname 
    end
    unless customThreesLeft[13].nil?  
      cuthl14 = customThreesLeft[13].fullname
    end   
    unless customThreesLeft[14].nil?  
      cuthl15 = customThreesLeft[14].fullname
    end 
    unless customThreesLeft[15].nil?  
      cuthl16 = customThreesLeft[15].fullname 
    end
    unless customThreesLeft[16].nil?  
      cuthl17 = customThreesLeft[16].fullname
    end
    unless customThreesLeft[17].nil?  
      cuthl18 = customThreesLeft[17].fullname 
    end
    unless customThreesLeft[18].nil?  
      cuthl19 = customThreesLeft[18].fullname
    end   
    unless customThreesLeft[19].nil?  
      cuthl20 = customThreesLeft[19].fullname
    end 

    if cuthl1.nil?
      new_data.gsub! /Sit 14 Lt Play 1\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 1\b/, cuthl1 
    end 
    if cuthl2.nil?
      new_data.gsub! /Sit 14 Lt Play 2\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 2\b/, cuthl2 
    end   
    if cuthl3.nil?
      new_data.gsub! /Sit 14 Lt Play 3\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 3\b/, cuthl3 
    end 
    if cuthl4.nil?
      new_data.gsub! /Sit 14 Lt Play 4\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 4\b/, cuthl4 
    end 
    if cuthl5.nil?
      new_data.gsub! /Sit 14 Lt Play 5\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 5\b/, cuthl5 
    end 
    if cuthl6.nil?
      new_data.gsub! /Sit 14 Lt Play 6\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 6\b/, cuthl6 
    end 
    if cuthl7.nil?
      new_data.gsub! /Sit 14 Lt Play 7\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 7\b/, cuthl7 
    end                     
    if cuthl8.nil?
      new_data.gsub! /Sit 14 Lt Play 8\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 8\b/, cuthl8
    end    
    if cuthl9.nil?
      new_data.gsub! /Sit 14 Lt Play 9\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 9\b/, cuthl9 
    end    
    if cuthl10.nil?
      new_data.gsub! /Sit 14 Lt Play 10\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 10\b/, cuthl10 
    end 
    if cuthl11.nil?
      new_data.gsub! /Sit 14 Lt Play 11\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 11\b/, cuthl11 
    end 
    if cuthl12.nil?
      new_data.gsub! /Sit 14 Lt Play 12\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 12\b/, cuthl12 
    end   
    if cuthl13.nil?
      new_data.gsub! /Sit 14 Lt Play 13\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 13\b/, cuthl13 
    end 
    if cuthl14.nil?
      new_data.gsub! /Sit 14 Lt Play 14\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 14\b/, cuthl14 
    end 
    if cuthl15.nil?
      new_data.gsub! /Sit 14 Lt Play 15\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 15\b/, cuthl15 
    end 
    if cuthl16.nil?
      new_data.gsub! /Sit 14 Lt Play 16\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 16\b/, cuthl16 
    end 
    if cuthl17.nil?
      new_data.gsub! /Sit 14 Lt Play 17\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 17\b/, cuthl17 
    end   
    if cuthl18.nil?
      new_data.gsub! /Sit 14 Lt Play 18\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 18\b/, cuthl18 
    end 
    if cuthl19.nil?
      new_data.gsub! /Sit 14 Lt Play 19\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 19\b/, cuthl19 
    end 
    if cuthl20.nil?
      new_data.gsub! /Sit 14 Lt Play 20\b/, " "
    else
      new_data.gsub! /Sit 14 Lt Play 20\b/, cuthl20 
    end 

    if cuthl1.nil?
      new_data2.gsub! /Sit 14 Lt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 1\b/, cuthl1 
    end 
    if cuthl2.nil?
      new_data2.gsub! /Sit 14 Lt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 2\b/, cuthl2 
    end   
    if cuthl3.nil?
      new_data2.gsub! /Sit 14 Lt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 3\b/, cuthl3 
    end 
    if cuthl4.nil?
      new_data2.gsub! /Sit 14 Lt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 4\b/, cuthl4 
    end 
    if cuthl5.nil?
      new_data2.gsub! /Sit 14 Lt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 5\b/, cuthl5 
    end 
    if cuthl6.nil?
      new_data2.gsub! /Sit 14 Lt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 6\b/, cuthl6 
    end 
    if cuthl7.nil?
      new_data2.gsub! /Sit 14 Lt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 7\b/, cuthl7 
    end                     
    if cuthl8.nil?
      new_data2.gsub! /Sit 14 Lt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 8\b/, cuthl8
    end    
    if cuthl9.nil?
      new_data2.gsub! /Sit 14 Lt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 9\b/, cuthl9 
    end    
    if cuthl10.nil?
      new_data2.gsub! /Sit 14 Lt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 10\b/, cuthl10 
    end 
    if cuthl11.nil?
      new_data2.gsub! /Sit 14 Lt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 11\b/, cuthl11 
    end 
    if cuthl12.nil?
      new_data2.gsub! /Sit 14 Lt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 12\b/, cuthl12 
    end   
    if cuthl13.nil?
      new_data2.gsub! /Sit 14 Lt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 13\b/, cuthl13 
    end 
    if cuthl14.nil?
      new_data2.gsub! /Sit 14 Lt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 14\b/, cuthl14 
    end 
    if cuthl15.nil?
      new_data2.gsub! /Sit 14 Lt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 15\b/, cuthl15 
    end 
    if cuthl16.nil?
      new_data2.gsub! /Sit 14 Lt Play 16\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 16\b/, cuthl16 
    end 
    if cuthl17.nil?
      new_data2.gsub! /Sit 14 Lt Play 17\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 17\b/, cuthl17 
    end   
    if cuthl18.nil?
      new_data2.gsub! /Sit 14 Lt Play 18\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 18\b/, cuthl18 
    end 
    if cuthl19.nil?
      new_data2.gsub! /Sit 14 Lt Play 19\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 19\b/, cuthl19 
    end 
    if cuthl20.nil?
      new_data2.gsub! /Sit 14 Lt Play 20\b/, " "
    else
      new_data2.gsub! /Sit 14 Lt Play 20\b/, cuthl20 
    end 

    #Right Hash
    unless customThreesRight[0].nil?  
      cuthr1 = customThreesRight[0].fullname 
    end
    unless customThreesRight[1].nil?  
      cuthr2 = customThreesRight[1].fullname 
    end
    unless customThreesRight[2].nil?  
      cuthr3 = customThreesRight[2].fullname 
    end
    unless customThreesRight[3].nil?  
      cuthr4 = customThreesRight[3].fullname 
    end
    unless customThreesRight[4].nil?  
      cuthr5 = customThreesRight[4].fullname
    end
    unless customThreesRight[5].nil?  
      cuthr6 = customThreesRight[5].fullname 
    end
    unless customThreesRight[6].nil?  
      cuthr7 = customThreesRight[6].fullname
    end    
    unless customThreesRight[7].nil?  
      cuthr8 = customThreesRight[7].fullname 
    end
    unless customThreesRight[8].nil?  
      cuthr9 = customThreesRight[8].fullname 
    end
    unless customThreesRight[9].nil?  
      cuthr10 = customThreesRight[9].fullname 
    end
    unless customThreesRight[10].nil?  
      cuthr11 = customThreesRight[10].fullname 
    end
    unless customThreesRight[11].nil?  
      cuthr12 = customThreesRight[11].fullname
    end
    unless customThreesRight[12].nil?  
      cuthr13 = customThreesRight[12].fullname 
    end
    unless customThreesRight[13].nil?  
      cuthr14 = customThreesRight[13].fullname
    end 
    unless customThreesRight[14].nil?  
      cuthr15 = customThreesRight[14].fullname
    end 
    unless customThreesRight[15].nil?  
      cuthr16 = customThreesRight[15].fullname 
    end
    unless customThreesRight[16].nil?  
      cuthr17 = customThreesRight[16].fullname
    end
    unless customThreesRight[17].nil?  
      cuthr18 = customThreesRight[17].fullname 
    end
    unless customThreesRight[18].nil?  
      cuthr19 = customThreesRight[18].fullname
    end 
    unless customThreesRight[19].nil?  
      cuthr20 = customThreesRight[19].fullname
    end   
    unless customThreesRight[15].nil?  
      cuthr16 = customThreesRight[15].fullname 
    end
    unless customThreesRight[16].nil?  
      cuthr17 = customThreesRight[16].fullname
    end
    unless customThreesRight[17].nil?  
      cuthr18 = customThreesRight[17].fullname 
    end
    unless customThreesRight[18].nil?  
      cuthr19 = customThreesRight[18].fullname
    end 
    unless customThreesRight[19].nil?  
      cuthr20 = customThreesRight[19].fullname
    end 

    if cuthr1.nil?
      new_data.gsub! /Sit 14 Rt Play 1\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 1\b/, cuthr1 
    end 
    if cuthr2.nil?
      new_data.gsub! /Sit 14 Rt Play 2\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 2\b/, cuthr2 
    end   
    if cuthr3.nil?
      new_data.gsub! /Sit 14 Rt Play 3\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 3\b/, cuthr3 
    end 
    if cuthr4.nil?
      new_data.gsub! /Sit 14 Rt Play 4\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 4\b/, cuthr4 
    end 
    if cuthr5.nil?
      new_data.gsub! /Sit 14 Rt Play 5\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 5\b/, cuthr5 
    end 
    if cuthr6.nil?
      new_data.gsub! /Sit 14 Rt Play 6\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 6\b/, cuthr6 
    end 
    if cuthr7.nil?
      new_data.gsub! /Sit 14 Rt Play 7\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 7\b/, cuthr7 
    end                     
    if cuthr8.nil?
      new_data.gsub! /Sit 14 Rt Play 8\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 8\b/, cuthr8
    end    
    if cuthr9.nil?
      new_data.gsub! /Sit 14 Rt Play 9\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 9\b/, cuthr9 
    end    
    if cuthr10.nil?
      new_data.gsub! /Sit 14 Rt Play 10\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 10\b/, cuthr10 
    end 
    if cuthr11.nil?
      new_data.gsub! /Sit 14 Rt Play 11\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 11\b/, cuthr11 
    end 
    if cuthr12.nil?
      new_data.gsub! /Sit 14 Rt Play 12\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 12\b/, cuthr12 
    end   
    if cuthr13.nil?
      new_data.gsub! /Sit 14 Rt Play 13\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 13\b/, cuthr13 
    end 
    if cuthr14.nil?
      new_data.gsub! /Sit 14 Rt Play 14\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 14\b/, cuthr14 
    end 
    if cuthr15.nil?
      new_data.gsub! /Sit 14 Rt Play 15\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 15\b/, cuthr15 
    end 
    if cuthr16.nil?
      new_data.gsub! /Sit 14 Rt Play 16\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 16\b/, cuthr16 
    end 
    if cuthr17.nil?
      new_data.gsub! /Sit 14 Rt Play 17\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 17\b/, cuthr17 
    end   
    if cuthr18.nil?
      new_data.gsub! /Sit 14 Rt Play 18\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 18\b/, cuthr18 
    end 
    if cuthr19.nil?
      new_data.gsub! /Sit 14 Rt Play 19\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 19\b/, cuthr19 
    end 
    if cuthr20.nil?
      new_data.gsub! /Sit 14 Rt Play 20\b/, " "
    else
      new_data.gsub! /Sit 14 Rt Play 20\b/, cuthr20 
    end 

    if cuthr1.nil?
      new_data2.gsub! /Sit 14 Rt Play 1\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 1\b/, cuthr1 
    end 
    if cuthr2.nil?
      new_data2.gsub! /Sit 14 Rt Play 2\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 2\b/, cuthr2 
    end   
    if cuthr3.nil?
      new_data2.gsub! /Sit 14 Rt Play 3\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 3\b/, cuthr3 
    end 
    if cuthr4.nil?
      new_data2.gsub! /Sit 14 Rt Play 4\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 4\b/, cuthr4 
    end 
    if cuthr5.nil?
      new_data2.gsub! /Sit 14 Rt Play 5\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 5\b/, cuthr5 
    end 
    if cuthr6.nil?
      new_data2.gsub! /Sit 14 Rt Play 6\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 6\b/, cuthr6 
    end 
    if cuthr7.nil?
      new_data2.gsub! /Sit 14 Rt Play 7\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 7\b/, cuthr7 
    end                     
    if cuthr8.nil?
      new_data2.gsub! /Sit 14 Rt Play 8\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 8\b/, cuthr8
    end    
    if cuthr9.nil?
      new_data2.gsub! /Sit 14 Rt Play 9\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 9\b/, cuthr9 
    end    
    if cuthr10.nil?
      new_data2.gsub! /Sit 14 Rt Play 10\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 10\b/, cuthr10 
    end 
    if cuthr11.nil?
      new_data2.gsub! /Sit 14 Rt Play 11\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 11\b/, cuthr11 
    end 
    if cuthr12.nil?
      new_data2.gsub! /Sit 14 Rt Play 12\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 12\b/, cuthr12 
    end   
    if cuthr13.nil?
      new_data2.gsub! /Sit 14 Rt Play 13\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 13\b/, cuthr13 
    end 
    if cuthr14.nil?
      new_data2.gsub! /Sit 14 Rt Play 14\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 14\b/, cuthr14 
    end 
    if cuthr15.nil?
      new_data2.gsub! /Sit 14 Rt Play 15\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 15\b/, cuthr15 
    end 
    if cuthr16.nil?
      new_data2.gsub! /Sit 14 Rt Play 16\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 16\b/, cuthr16 
    end 
    if cuthr17.nil?
      new_data2.gsub! /Sit 14 Rt Play 17\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 17\b/, cuthr17 
    end   
    if cuthr18.nil?
      new_data2.gsub! /Sit 14 Rt Play 18\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 18\b/, cuthr18 
    end 
    if cuthr19.nil?
      new_data2.gsub! /Sit 14 Rt Play 19\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 19\b/, cuthr19 
    end 
    if cuthr20.nil?
      new_data2.gsub! /Sit 14 Rt Play 20\b/, " "
    else
      new_data2.gsub! /Sit 14 Rt Play 20\b/, cuthr20 
    end              
    #----------End Custom 3-------------

    self.update :gdata => new_data, 
    :g_format1 => default_gamecall.gc_format1,
    :g_class1 => default_gamecall.gc_class1,
    :col_widths1 => default_gamecall.col_widths1,
    :orig_col_widths1 => default_gamecall.col_widths1,
    :gdata2 => new_data2, 
    :g_format2 => default_gamecall.gc_format2,
    :g_class2 => default_gamecall.gc_class2,
    :col_widths2 => default_gamecall.col_widths2,
    :orig_col_widths2 => default_gamecall.col_widths2      
  end



  #Sets the initial game call sheet when created
  def use_default_gamecall
    event = Event.find_by(id: self.event_id)
    title = self.title

    #----------Openers----------
    openers = event.plays.where('situation1 = ?', true)
    openersLeft = openers.where('hash_mark = ?', 'Left')
    openersRight = openers.where('hash_mark = ?', 'Right')

    #Openers Left Hash
    unless openersLeft[0].nil?  
      openl1 = openersLeft[0].fullname 
    end
    unless openersLeft[1].nil?  
      openl2 = openersLeft[1].fullname 
    end
    unless openersLeft[2].nil?  
      openl3 = openersLeft[2].fullname 
    end
    unless openersLeft[3].nil?  
      openl4 = openersLeft[3].fullname 
    end
    unless openersLeft[4].nil?  
      openl5 = openersLeft[4].fullname 
    end
    unless openersLeft[5].nil?  
      openl6 = openersLeft[5].fullname 
    end
    unless openersLeft[6].nil?  
      openl7 = openersLeft[6].fullname 
    end
    unless openersLeft[7].nil?  
      openl8 = openersLeft[7].fullname 
    end
    unless openersLeft[8].nil?  
      openl9 = openersLeft[8].fullname 
    end
    unless openersLeft[9].nil?  
      openl10 = openersLeft[9].fullname 
    end
    unless openersLeft[10].nil?  
      openl11 = openersLeft[10].fullname 
    end
    unless openersLeft[11].nil?  
      openl12 = openersLeft[11].fullname 
    end
    unless openersLeft[12].nil?  
      openl13 = openersLeft[12].fullname 
    end
    unless openersLeft[13].nil?  
      openl14 = openersLeft[13].fullname 
    end  
    unless openersLeft[14].nil?  
      openl15 = openersLeft[14].fullname 
    end  

    #Openers Right Hash
    unless openersRight[0].nil?  
      openr1 = openersRight[0].fullname 
    end
    unless openersRight[1].nil?  
      openr2 = openersRight[1].fullname 
    end
    unless openersRight[2].nil?  
      openr3 = openersRight[2].fullname 
    end
    unless openersRight[3].nil?  
      openr4 = openersRight[3].fullname 
    end
    unless openersRight[4].nil?  
      openr5 = openersRight[4].fullname 
    end
    unless openersRight[5].nil?  
      openr6 = openersRight[5].fullname 
    end
    unless openersRight[6].nil?  
      openr7 = openersRight[6].fullname 
    end
    unless openersRight[7].nil?  
      openr8 = openersRight[7].fullname 
    end
    unless openersRight[8].nil?  
      openr9 = openersRight[8].fullname 
    end
    unless openersRight[9].nil?  
      openr10 = openersRight[9].fullname 
    end
    unless openersRight[10].nil?  
      openr11 = openersRight[10].fullname 
    end
    unless openersRight[11].nil?  
      openr12 = openersRight[11].fullname 
    end
    unless openersRight[12].nil?  
      openr13 = openersRight[12].fullname 
    end
    unless openersRight[13].nil?  
      openr14 = openersRight[13].fullname 
    end  
    unless openersRight[14].nil?  
      openr15 = openersRight[14].fullname 
    end          
    #----------End Openers----------

    #----------1st/2nd & 10----------
    firstTens = event.plays.where('situation2 = ?', true)
     
    runFirstTens = firstTens.where('play_type = ?', 'Run')
    runFirstTensLeft = runFirstTens.where('hash_mark = ?', 'Left')
    runFirstTensRight = runFirstTens.where('hash_mark = ?', 'Right')
     
    passFirstTens = firstTens.where('play_type = ?', 'Pass')
    passFirstTensLeft = passFirstTens.where('hash_mark = ?', 'Left')
    passFirstTensRight = passFirstTens.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runFirstTensLeft[0].nil?  
      rftl1 = runFirstTensLeft[0].fullname 
    end
    unless runFirstTensLeft[1].nil?  
      rftl2 = runFirstTensLeft[1].fullname 
    end
    unless runFirstTensLeft[2].nil?  
      rftl3 = runFirstTensLeft[2].fullname 
    end
    unless runFirstTensLeft[3].nil?  
      rftl4 = runFirstTensLeft[3].fullname 
    end
    unless runFirstTensLeft[4].nil?  
      rftl5 = runFirstTensLeft[4].fullname 
    end
    unless runFirstTensLeft[5].nil?  
      rftl6 = runFirstTensLeft[5].fullname 
    end
    unless runFirstTensLeft[6].nil?  
      rftl7 = runFirstTensLeft[6].fullname 
    end
    unless runFirstTensLeft[7].nil?  
      rftl8 = runFirstTensLeft[7].fullname 
    end
    unless runFirstTensLeft[8].nil?  
      rftl9 = runFirstTensLeft[8].fullname 
    end
    unless runFirstTensLeft[9].nil?  
      rftl10 = runFirstTensLeft[9].fullname 
    end
    unless runFirstTensLeft[10].nil?  
      rftl11 = runFirstTensLeft[10].fullname 
    end
    unless runFirstTensLeft[11].nil?  
      rftl12 = runFirstTensLeft[11].fullname 
    end
    unless runFirstTensLeft[12].nil?  
      rftl13 = runFirstTensLeft[12].fullname 
    end
    unless runFirstTensLeft[13].nil?  
      rftl14 = runFirstTensLeft[13].fullname 
    end    
    unless runFirstTensLeft[14].nil?  
      rftl15 = runFirstTensLeft[14].fullname 
    end      

    #Run Right Hash
    unless runFirstTensRight[0].nil?  
      rftr1 = runFirstTensRight[0].fullname 
    end
    unless runFirstTensRight[1].nil?  
      rftr2 = runFirstTensRight[1].fullname 
    end
    unless runFirstTensRight[2].nil?  
      rftr3 = runFirstTensRight[2].fullname 
    end
    unless runFirstTensRight[3].nil?  
      rftr4 = runFirstTensRight[3].fullname 
    end
    unless runFirstTensRight[4].nil?  
      rftr5 = runFirstTensRight[4].fullname 
    end
    unless runFirstTensRight[5].nil?  
      rftr6 = runFirstTensRight[5].fullname 
    end
    unless runFirstTensRight[6].nil?  
      rftr7 = runFirstTensRight[6].fullname 
    end
    unless runFirstTensRight[7].nil?  
      rftr8 = runFirstTensRight[7].fullname 
    end
    unless runFirstTensRight[8].nil?  
      rftr9 = runFirstTensRight[8].fullname 
    end
    unless runFirstTensRight[9].nil?  
      rftr10 = runFirstTensRight[9].fullname 
    end
    unless runFirstTensRight[10].nil?  
      rftr11 = runFirstTensRight[10].fullname 
    end
    unless runFirstTensRight[11].nil?  
      rftr12 = runFirstTensRight[11].fullname 
    end
    unless runFirstTensRight[12].nil?  
      rftr13 = runFirstTensRight[12].fullname 
    end
    unless runFirstTensRight[13].nil?  
      rftr14 = runFirstTensRight[13].fullname 
    end
    unless runFirstTensRight[14].nil?  
      rftr15 = runFirstTensRight[14].fullname 
    end        

    #Pass Left Hash
    unless passFirstTensLeft[0].nil?  
      pftl1 = passFirstTensLeft[0].fullname 
    end
    unless passFirstTensLeft[1].nil?  
      pftl2 = passFirstTensLeft[1].fullname 
    end
    unless passFirstTensLeft[2].nil?  
      pftl3 = passFirstTensLeft[2].fullname 
    end
    unless passFirstTensLeft[3].nil?  
      pftl4 = passFirstTensLeft[3].fullname 
    end
    unless passFirstTensLeft[4].nil?  
      pftl5 = passFirstTensLeft[4].fullname 
    end
    unless passFirstTensLeft[5].nil?  
      pftl6 = passFirstTensLeft[5].fullname 
    end
    unless passFirstTensLeft[6].nil?  
      pftl7 = passFirstTensLeft[6].fullname 
    end
    unless passFirstTensLeft[7].nil?  
      pftl8 = passFirstTensLeft[7].fullname 
    end
    unless passFirstTensLeft[8].nil?  
      pftl9 = passFirstTensLeft[8].fullname 
    end
    unless passFirstTensLeft[9].nil?  
      pftl10 = passFirstTensLeft[9].fullname 
    end
    unless passFirstTensLeft[10].nil?  
      pftl11 = passFirstTensLeft[10].fullname 
    end
    unless passFirstTensLeft[11].nil?  
      pftl12 = passFirstTensLeft[11].fullname 
    end
    unless passFirstTensLeft[12].nil?  
      pftl13 = passFirstTensLeft[12].fullname 
    end
    unless passFirstTensLeft[13].nil?  
      pftl14 = passFirstTensLeft[13].fullname 
    end    
    unless passFirstTensLeft[14].nil?  
      pftl15 = passFirstTensLeft[14].fullname 
    end 

    #Pass Right Hash
    unless passFirstTensRight[0].nil?  
      pftr1 = passFirstTensRight[0].fullname 
    end
    unless passFirstTensRight[1].nil?  
      pftr2 = passFirstTensRight[1].fullname 
    end
    unless passFirstTensRight[2].nil?  
      pftr3 = passFirstTensRight[2].fullname 
    end
    unless passFirstTensRight[3].nil?  
      pftr4 = passFirstTensRight[3].fullname 
    end
    unless passFirstTensRight[4].nil?  
      pftr5 = passFirstTensRight[4].fullname 
    end
    unless passFirstTensRight[5].nil?  
      pftr6 = passFirstTensRight[5].fullname 
    end
    unless passFirstTensRight[6].nil?  
      pftr7 = passFirstTensRight[6].fullname 
    end   
    unless passFirstTensRight[7].nil?  
      pftr8 = passFirstTensRight[7].fullname 
    end
    unless passFirstTensRight[8].nil?  
      pftr9 = passFirstTensRight[8].fullname 
    end    
    unless passFirstTensRight[9].nil?  
      pftr10 = passFirstTensRight[9].fullname 
    end
    unless passFirstTensRight[10].nil?  
      pftr11 = passFirstTensRight[10].fullname 
    end
    unless passFirstTensRight[11].nil?  
      pftr12 = passFirstTensRight[11].fullname 
    end
    unless passFirstTensRight[12].nil?  
      pftr13 = passFirstTensRight[12].fullname 
    end
    unless passFirstTensRight[13].nil?  
      pftr14 = passFirstTensRight[13].fullname 
    end
    unless passFirstTensRight[14].nil?  
      pftr15 = passFirstTensRight[14].fullname 
    end


    #Number of user's run plays in situation 2
    num_ftr = self.user.s_name2_num_run

    #Left Hash
    # ftl_s0 
    if num_ftr > 0
      ftl_s0 = self.user.s_name2 + ' - Run'
    else
      ftl_s0 = self.user.s_name2 + ' - Pass'
    end

    #ftl_s1 
    if num_ftr > 0
      ftl_s1 = rftl1
    else
      ftl_s1 = pftl1
    end

    #ftl_s2
    if num_ftr == 0
      ftl_s2 = pftl2
    elsif num_ftr == 1
      ftl_s2 = self.user.s_name2 + ' - Pass'
    else num_ftr > 1
      ftl_s2 = rftl2
    end

    #ftl_s3
    case num_ftr
      when 0 then ftl_s3 = pftl3       
      when 1 then ftl_s3 = pftl1
      when 2 then ftl_s3 = self.user.s_name2 + ' - Pass'
      when 3..100 then ftl_s3 = rftl3
    end

    #ftl_s4
    case num_ftr
      when 0 then ftl_s4 = pftl4       
      when 1 then ftl_s4 = pftl2
      when 2 then ftl_s4 = pftl1
      when 3 then ftl_s4 = self.user.s_name2 + ' - Pass'
      when 4..100 then ftl_s4 = rftl4
    end

    #ftl_s5
    case num_ftr
      when 0 then ftl_s5 = pftl5       
      when 1 then ftl_s5 = pftl3
      when 2 then ftl_s5 = pftl2
      when 3 then ftl_s5 = pftl1
      when 4 then ftl_s5 = self.user.s_name2 + ' - Pass'
      when 5..100 then ftl_s5 = rftl5
    end

    #ftl_s6
    case num_ftr
      when 0 then ftl_s6 = pftl6      
      when 1 then ftl_s6 = pftl4
      when 2 then ftl_s6 = pftl3
      when 3 then ftl_s6 = pftl2
      when 4 then ftl_s6 = pftl1
      when 5 then ftl_s6 = self.user.s_name2 + ' - Pass'
      when 6..100 then ftl_s6 = rftl6
    end

    #ftl_s7
    case num_ftr
      when 0 then ftl_s7 = pftl7      
      when 1 then ftl_s7 = pftl5
      when 2 then ftl_s7 = pftl4
      when 3 then ftl_s7 = pftl3
      when 4 then ftl_s7 = pftl2
      when 5 then ftl_s7 = pftl1
      when 6 then ftl_s7 = self.user.s_name2 + ' - Pass'
      when 7..100 then ftl_s7 = rftl7
    end

    #ftl_s8
    case num_ftr
      when 0 then ftl_s8 = pftl8      
      when 1 then ftl_s8 = pftl6
      when 2 then ftl_s8 = pftl5
      when 3 then ftl_s8 = pftl4
      when 4 then ftl_s8 = pftl3
      when 5 then ftl_s8 = pftl2
      when 6 then ftl_s8 = pftl1
      when 7 then ftl_s8 = self.user.s_name2 + ' - Pass'
      when 8..100 then ftl_s8 = rftl8
    end

    #ftl_s9
    case num_ftr
      when 0 then ftl_s9 = pftl9      
      when 1 then ftl_s9 = pftl7
      when 2 then ftl_s9 = pftl6
      when 3 then ftl_s9 = pftl5
      when 4 then ftl_s9 = pftl4
      when 5 then ftl_s9 = pftl3
      when 6 then ftl_s9 = pftl2
      when 7 then ftl_s9 = pftl1
      when 8 then ftl_s9 = self.user.s_name2 + ' - Pass'
      when 9..100 then ftl_s9 = rftl9
    end

    #ftl_s10
    case num_ftr
      when 0 then ftl_s10 = pftl10     
      when 1 then ftl_s10 = pftl8
      when 2 then ftl_s10 = pftl7
      when 3 then ftl_s10 = pftl6
      when 4 then ftl_s10 = pftl5
      when 5 then ftl_s10 = pftl4
      when 6 then ftl_s10 = pftl3
      when 7 then ftl_s10 = pftl2
      when 8 then ftl_s10 = pftl1
      when 9 then ftl_s10 = self.user.s_name2 + ' - Pass'
      when 10..100 then ftl_s10 = rftl10
    end

    #ftl_s11
    case num_ftr
      when 0 then ftl_s11 = pftl11     
      when 1 then ftl_s11 = pftl9
      when 2 then ftl_s11 = pftl8
      when 3 then ftl_s11 = pftl7
      when 4 then ftl_s11 = pftl6
      when 5 then ftl_s11 = pftl5
      when 6 then ftl_s11 = pftl4
      when 7 then ftl_s11 = pftl3
      when 8 then ftl_s11 = pftl2
      when 9 then ftl_s11 = pftl1
      when 10 then ftl_s11 = self.user.s_name2 + ' - Pass'
      when 11..100 then ftl_s11 = rftl11
    end

    #ftl_s12
    case num_ftr
      when 0 then ftl_s12 = pftl12    
      when 1 then ftl_s12 = pftl10
      when 2 then ftl_s12 = pftl9
      when 3 then ftl_s12 = pftl8
      when 4 then ftl_s12 = pftl7
      when 5 then ftl_s12 = pftl6
      when 6 then ftl_s12 = pftl5
      when 7 then ftl_s12 = pftl4
      when 8 then ftl_s12 = pftl3
      when 9 then ftl_s12 = pftl2
      when 10 then ftl_s12 = pftl1
      when 11 then ftl_s12 = self.user.s_name2 + ' - Pass'
      when 12..100 then ftl_s12 = rftl12
    end

    #ftl_s13
    case num_ftr
      when 0 then ftl_s13 = pftl13    
      when 1 then ftl_s13 = pftl11
      when 2 then ftl_s13 = pftl10
      when 3 then ftl_s13 = pftl9
      when 4 then ftl_s13 = pftl8
      when 5 then ftl_s13 = pftl7
      when 6 then ftl_s13 = pftl6
      when 7 then ftl_s13 = pftl5
      when 8 then ftl_s13 = pftl4
      when 9 then ftl_s13 = pftl3
      when 10 then ftl_s13 = pftl2
      when 11 then ftl_s13 = pftl1
      when 12 then ftl_s13 = self.user.s_name2 + ' - Pass'
      when 13..100 then ftl_s13 = rftl13
    end

    #ftl_s14
    case num_ftr
      when 0 then ftl_s14 = pftl14    
      when 1 then ftl_s14 = pftl12
      when 2 then ftl_s14 = pftl11
      when 3 then ftl_s14 = pftl10
      when 4 then ftl_s14 = pftl9
      when 5 then ftl_s14 = pftl8
      when 6 then ftl_s14 = pftl7
      when 7 then ftl_s14 = pftl6
      when 8 then ftl_s14 = pftl5
      when 9 then ftl_s14 = pftl4
      when 10 then ftl_s14 = pftl3
      when 11 then ftl_s14 = pftl2
      when 12 then ftl_s14 = pftl1  
      when 13 then ftl_s14 = self.user.s_name2 + ' - Pass'
      when 14..100 then ftl_s14 = rftl14
    end

    #ftl_s15
    case num_ftr
      when 0 then ftl_s15 = pftl15    
      when 1 then ftl_s15 = pftl13
      when 2 then ftl_s15 = pftl12
      when 3 then ftl_s15 = pftl11
      when 4 then ftl_s15 = pftl10
      when 5 then ftl_s15 = pftl9
      when 6 then ftl_s15 = pftl8
      when 7 then ftl_s15 = pftl7
      when 8 then ftl_s15 = pftl6
      when 9 then ftl_s15 = pftl5
      when 10 then ftl_s15 = pftl4
      when 11 then ftl_s15 = pftl3
      when 12 then ftl_s15 = pftl2
      when 13 then ftl_s15 = pftl1  
      when 14..100 then ftl_s15 = rftl15
    end    


    #Right Hash
    # ftr_s0 would always be blank

    #ftr_s1 
    if num_ftr > 0
      ftr_s1 = rftr1
    else
      ftr_s1 = pftr1
    end

    #ftr_s2
    if num_ftr == 0
      ftr_s2 = pftr2
    elsif num_ftr == 1
      ftr_s2 = ''
    else num_ftr > 1
      ftr_s2 = rftr2
    end

    #ftr_s3
    case num_ftr
      when 0 then ftr_s3 = pftr3       
      when 1 then ftr_s3 = pftr1
      when 2 then ftr_s3 = ''
      when 3..100 then ftr_s3 = rftr3
    end

    #ftr_s4
    case num_ftr
      when 0 then ftr_s4 = pftr4       
      when 1 then ftr_s4 = pftr2
      when 2 then ftr_s4 = pftr1
      when 3 then ''
      when 4..100 then ftr_s4 = rftr4
    end

    #ftr_s5
    case num_ftr
      when 0 then ftr_s5 = pftr5       
      when 1 then ftr_s5 = pftr3
      when 2 then ftr_s5 = pftr2
      when 3 then ftr_s5 = pftr1
      when 4 then ftr_s5 = ''
      when 5..100 then ftr_s5 = rftr5
    end

    #ftr_s6
    case num_ftr
      when 0 then ftr_s6 = pftr6      
      when 1 then ftr_s6 = pftr4
      when 2 then ftr_s6 = pftr3
      when 3 then ftr_s6 = pftr2
      when 4 then ftr_s6 = pftr1
      when 5 then ftr_s6 = ''
      when 6..100 then ftr_s6 = rftr6
    end

    #ftr_s7
    case num_ftr
      when 0 then ftr_s7 = pftr7      
      when 1 then ftr_s7 = pftr5
      when 2 then ftr_s7 = pftr4
      when 3 then ftr_s7 = pftr3
      when 4 then ftr_s7 = pftr2
      when 5 then ftr_s7 = pftr1
      when 6 then ftr_s7 = ''
      when 7..100 then ftr_s7 = rftr7
    end

    #ftr_s8
    case num_ftr
      when 0 then ftr_s8 = pftr8      
      when 1 then ftr_s8 = pftr6
      when 2 then ftr_s8 = pftr5
      when 3 then ftr_s8 = pftr4
      when 4 then ftr_s8 = pftr3
      when 5 then ftr_s8 = pftr2
      when 6 then ftr_s8 = pftr1
      when 7 then ftr_s8 = ''
      when 8..100 then ftr_s8 = rftr8
    end

    #ftr_s9
    case num_ftr
      when 0 then ftr_s9 = pftr9      
      when 1 then ftr_s9 = pftr7
      when 2 then ftr_s9 = pftr6
      when 3 then ftr_s9 = pftr5
      when 4 then ftr_s9 = pftr4
      when 5 then ftr_s9 = pftr3
      when 6 then ftr_s9 = pftr2
      when 7 then ftr_s9 = pftr1
      when 8 then ftr_s9 = ''
      when 9..100 then ftr_s9 = rftr9
    end

    #ftr_s10
    case num_ftr
      when 0 then ftr_s10 = pftr10     
      when 1 then ftr_s10 = pftr8
      when 2 then ftr_s10 = pftr7
      when 3 then ftr_s10 = pftr6
      when 4 then ftr_s10 = pftr5
      when 5 then ftr_s10 = pftr4
      when 6 then ftr_s10 = pftr3
      when 7 then ftr_s10 = pftr2
      when 8 then ftr_s10 = pftr1
      when 9 then ftr_s10 = ''
      when 10..100 then ftr_s10 = rftr10
    end

    #ftr_s11
    case num_ftr
      when 0 then ftr_s11 = pftr11     
      when 1 then ftr_s11 = pftr9
      when 2 then ftr_s11 = pftr8
      when 3 then ftr_s11 = pftr7
      when 4 then ftr_s11 = pftr6
      when 5 then ftr_s11 = pftr5
      when 6 then ftr_s11 = pftr4
      when 7 then ftr_s11 = pftr3
      when 8 then ftr_s11 = pftr2
      when 9 then ftr_s11 = pftr1
      when 10 then ftr_s11 = ''
      when 11..100 then ftr_s11 = rftr11
    end

    #ftr_s12
    case num_ftr
      when 0 then ftr_s12 = pftr12    
      when 1 then ftr_s12 = pftr10
      when 2 then ftr_s12 = pftr9
      when 3 then ftr_s12 = pftr8
      when 4 then ftr_s12 = pftr7
      when 5 then ftr_s12 = pftr6
      when 6 then ftr_s12 = pftr5
      when 7 then ftr_s12 = pftr4
      when 8 then ftr_s12 = pftr3
      when 9 then ftr_s12 = pftr2
      when 10 then ftr_s12 = pftr1
      when 11 then ftr_s12 = ''
      when 12..100 then ftr_s12 = rftr12
    end

    #ftr_s13
    case num_ftr
      when 0 then ftr_s13 = pftr13    
      when 1 then ftr_s13 = pftr11
      when 2 then ftr_s13 = pftr10
      when 3 then ftr_s13 = pftr9
      when 4 then ftr_s13 = pftr8
      when 5 then ftr_s13 = pftr7
      when 6 then ftr_s13 = pftr6
      when 7 then ftr_s13 = pftr5
      when 8 then ftr_s13 = pftr4
      when 9 then ftr_s13 = pftr3
      when 10 then ftr_s13 = pftr2
      when 11 then ftr_s13 = pftr1
      when 12 then ftr_s13 = ''
      when 13..100 then ftr_s13 = rftr13
    end

    #ftr_s14
    case num_ftr
      when 0 then ftr_s14 = pftr14    
      when 1 then ftr_s14 = pftr12
      when 2 then ftr_s14 = pftr11
      when 3 then ftr_s14 = pftr10
      when 4 then ftr_s14 = pftr9
      when 5 then ftr_s14 = pftr8
      when 6 then ftr_s14 = pftr7
      when 7 then ftr_s14 = pftr6
      when 8 then ftr_s14 = pftr5
      when 9 then ftr_s14 = pftr4
      when 10 then ftr_s14 = pftr3
      when 11 then ftr_s14 = pftr2
      when 12 then ftr_s14 = pftr1  
      when 13 then ftr_s14 = ''
      when 14..100 then ftr_s14 = rftr14
    end

    #ftr_s15
    case num_ftr
      when 0 then ftr_s15 = pftr15    
      when 1 then ftr_s15 = pftr13
      when 2 then ftr_s15 = pftr12
      when 3 then ftr_s15 = pftr11
      when 4 then ftr_s15 = pftr10
      when 5 then ftr_s15 = pftr9
      when 6 then ftr_s15 = pftr8
      when 7 then ftr_s15 = pftr7
      when 8 then ftr_s15 = pftr6
      when 9 then ftr_s15 = pftr5
      when 10 then ftr_s15 = pftr4
      when 11 then ftr_s15 = pftr3
      when 12 then ftr_s15 = pftr2
      when 13 then ftr_s15 = pftr1  
      when 14..100 then ftr_s15 = rftr15
    end

    #----------End 1st/2nd & 10----------

    #----------2nd & Long----------
    secondLongs = event.plays.where('situation3 = ?', true)
     
    runSecondLongs = secondLongs.where('play_type = ?', 'Run')
    runSecondLongsLeft = runSecondLongs.where('hash_mark = ?', 'Left')
    runSecondLongsRight = runSecondLongs.where('hash_mark = ?', 'Right')
     
    passSecondLongs = secondLongs.where('play_type = ?', 'Pass')
    passSecondLongsLeft = passSecondLongs.where('hash_mark = ?', 'Left')
    passSecondLongsRight = passSecondLongs.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondLongsLeft[0].nil?  
      rsll1 = runSecondLongsLeft[0].fullname 
    end
    unless runSecondLongsLeft[1].nil?  
      rsll2 = runSecondLongsLeft[1].fullname 
    end
    unless runSecondLongsLeft[2].nil?  
      rsll3 = runSecondLongsLeft[2].fullname 
    end
    unless runSecondLongsLeft[3].nil?  
      rsll4 = runSecondLongsLeft[3].fullname 
    end
    unless runSecondLongsLeft[4].nil?  
      rsll5 = runSecondLongsLeft[4].fullname 
    end
    unless runSecondLongsLeft[5].nil?  
      rsll6 = runSecondLongsLeft[5].fullname 
    end
    unless runSecondLongsLeft[6].nil?  
      rsll7 = runSecondLongsLeft[6].fullname 
    end
    unless runSecondLongsLeft[7].nil?  
      rsll8 = runSecondLongsLeft[7].fullname 
    end
    unless runSecondLongsLeft[8].nil?  
      rsll9 = runSecondLongsLeft[8].fullname 
    end
    unless runSecondLongsLeft[9].nil?  
      rsll10 = runSecondLongsLeft[9].fullname 
    end
    unless runSecondLongsLeft[10].nil?  
      rsll11 = runSecondLongsLeft[10].fullname 
    end
    unless runSecondLongsLeft[11].nil?  
      rsll12 = runSecondLongsLeft[11].fullname 
    end

    #Run Right Hash
    unless runSecondLongsRight[0].nil?  
      rslr1 = runSecondLongsRight[0].fullname 
    end
    unless runSecondLongsRight[1].nil?  
      rslr2 = runSecondLongsRight[1].fullname 
    end
    unless runSecondLongsRight[2].nil?  
      rslr3 = runSecondLongsRight[2].fullname 
    end
    unless runSecondLongsRight[3].nil?  
      rslr4 = runSecondLongsRight[3].fullname 
    end
    unless runSecondLongsRight[4].nil?  
      rslr5 = runSecondLongsRight[4].fullname 
    end
    unless runSecondLongsRight[5].nil?  
      rslr6 = runSecondLongsRight[5].fullname 
    end
    unless runSecondLongsRight[6].nil?  
      rslr7 = runSecondLongsRight[6].fullname 
    end
    unless runSecondLongsRight[7].nil?  
      rslr8 = runSecondLongsRight[7].fullname 
    end
    unless runSecondLongsRight[8].nil?  
      rslr9 = runSecondLongsRight[8].fullname 
    end
    unless runSecondLongsRight[9].nil?  
      rslr10 = runSecondLongsRight[9].fullname 
    end    
    unless runSecondLongsRight[10].nil?  
      rslr11 = runSecondLongsRight[10].fullname 
    end
    unless runSecondLongsRight[11].nil?  
      rslr12 = runSecondLongsRight[11].fullname 
    end 

    #Pass Left Hash
    unless passSecondLongsLeft[0].nil?  
      psll1 = passSecondLongsLeft[0].fullname 
    end
    unless passSecondLongsLeft[1].nil?  
      psll2 = passSecondLongsLeft[1].fullname 
    end
    unless passSecondLongsLeft[2].nil?  
      psll3 = passSecondLongsLeft[2].fullname 
    end
    unless passSecondLongsLeft[3].nil?  
      psll4 = passSecondLongsLeft[3].fullname 
    end
    unless passSecondLongsLeft[4].nil?  
      psll5 = passSecondLongsLeft[4].fullname 
    end  
    unless passSecondLongsLeft[5].nil?  
      psll6 = passSecondLongsLeft[5].fullname 
    end
    unless passSecondLongsLeft[6].nil?  
      psll7 = passSecondLongsLeft[6].fullname 
    end
    unless passSecondLongsLeft[7].nil?  
      psll8 = passSecondLongsLeft[7].fullname 
    end
    unless passSecondLongsLeft[8].nil?  
      psll9 = passSecondLongsLeft[8].fullname 
    end
    unless passSecondLongsLeft[9].nil?  
      psll10 = passSecondLongsLeft[9].fullname 
    end
    unless passSecondLongsLeft[10].nil?  
      psll11 = passSecondLongsLeft[10].fullname 
    end  
    unless passSecondLongsLeft[11].nil?  
      psll12 = passSecondLongsLeft[11].fullname 
    end    

    #Pass Right Hash
    unless passSecondLongsRight[0].nil?  
      pslr1 = passSecondLongsRight[0].fullname 
    end
    unless passSecondLongsRight[1].nil?  
      pslr2 = passSecondLongsRight[1].fullname 
    end
    unless passSecondLongsRight[2].nil?  
      pslr3 = passSecondLongsRight[2].fullname 
    end
    unless passSecondLongsRight[3].nil?  
      pslr4 = passSecondLongsRight[3].fullname 
    end
    unless passSecondLongsRight[4].nil?  
      pslr5 = passSecondLongsRight[4].fullname 
    end  
    unless passSecondLongsRight[5].nil?  
      pslr6 = passSecondLongsRight[5].fullname 
    end 
    unless passSecondLongsRight[6].nil?  
      pslr7 = passSecondLongsRight[6].fullname 
    end
    unless passSecondLongsRight[7].nil?  
      pslr8 = passSecondLongsRight[7].fullname 
    end
    unless passSecondLongsRight[8].nil?  
      pslr9 = passSecondLongsRight[8].fullname 
    end
    unless passSecondLongsRight[9].nil?  
      pslr10 = passSecondLongsRight[9].fullname 
    end
    unless passSecondLongsRight[10].nil?  
      pslr11 = passSecondLongsRight[10].fullname 
    end  
    unless passSecondLongsRight[11].nil?  
      pslr12 = passSecondLongsRight[11].fullname 
    end             


    #Number of user's run plays in situation 3
    num_slr = self.user.s_name3_num_run

    #Left Hash
    # sll_s0 
    if num_slr > 0
      sll_s0 = self.user.s_name3 + ' - Run'
    else
      sll_s0 = self.user.s_name3 + ' - Pass'
    end

    #sll_s1 
    if num_slr > 0
      sll_s1 = rsll1
    else
      sll_s1 = psll1
    end

    #sll_s2
    if num_slr == 0
      sll_s2 = psll2
    elsif num_slr == 1
      sll_s2 = self.user.s_name3 + ' - Pass'
    else num_slr > 1
      sll_s2 = rsll2
    end

    #sll_s3
    case num_slr
      when 0 then sll_s3 = psll3       
      when 1 then sll_s3 = psll1
      when 2 then sll_s3 = self.user.s_name3 + ' - Pass'
      when 3..100 then sll_s3 = rsll3
    end

    #sll_s4
    case num_slr
      when 0 then sll_s4 = psll4       
      when 1 then sll_s4 = psll2
      when 2 then sll_s4 = psll1
      when 3 then sll_s4 = self.user.s_name3 + ' - Pass'
      when 4..100 then sll_s4 = rsll4
    end

    #sll_s5
    case num_slr
      when 0 then sll_s5 = psll5       
      when 1 then sll_s5 = psll3
      when 2 then sll_s5 = psll2
      when 3 then sll_s5 = psll1
      when 4 then sll_s5 = self.user.s_name3 + ' - Pass'
      when 5..100 then sll_s5 = rsll5
    end

    #sll_s6
    case num_slr
      when 0 then sll_s6 = psll6      
      when 1 then sll_s6 = psll4
      when 2 then sll_s6 = psll3
      when 3 then sll_s6 = psll2
      when 4 then sll_s6 = psll1
      when 5 then sll_s6 = self.user.s_name3 + ' - Pass'
      when 6..100 then sll_s6 = rsll6
    end

    #sll_s7
    case num_slr
      when 0 then sll_s7 = psll7      
      when 1 then sll_s7 = psll5
      when 2 then sll_s7 = psll4
      when 3 then sll_s7 = psll3
      when 4 then sll_s7 = psll2
      when 5 then sll_s7 = psll1
      when 6 then sll_s7 = self.user.s_name3 + ' - Pass'
      when 7..100 then sll_s7 = rsll7
    end

    #sll_s8
    case num_slr
      when 0 then sll_s8 = psll8      
      when 1 then sll_s8 = psll6
      when 2 then sll_s8 = psll5
      when 3 then sll_s8 = psll4
      when 4 then sll_s8 = psll3
      when 5 then sll_s8 = psll2
      when 6 then sll_s8 = psll1
      when 7 then sll_s8 = self.user.s_name3 + ' - Pass'
      when 8..100 then sll_s8 = rsll8
    end

    #sll_s9
    case num_slr
      when 0 then sll_s9 = psll9      
      when 1 then sll_s9 = psll7
      when 2 then sll_s9 = psll6
      when 3 then sll_s9 = psll5
      when 4 then sll_s9 = psll4
      when 5 then sll_s9 = psll3
      when 6 then sll_s9 = psll2
      when 7 then sll_s9 = psll1
      when 8 then sll_s9 = self.user.s_name3 + ' - Pass'
      when 9..100 then sll_s9 = rsll9
    end

    #sll_s10
    case num_slr
      when 0 then sll_s10 = psll10     
      when 1 then sll_s10 = psll8
      when 2 then sll_s10 = psll7
      when 3 then sll_s10 = psll6
      when 4 then sll_s10 = psll5
      when 5 then sll_s10 = psll4
      when 6 then sll_s10 = psll3
      when 7 then sll_s10 = psll2
      when 8 then sll_s10 = psll1
      when 9 then sll_s10 = self.user.s_name3 + ' - Pass'
      when 10..100 then sll_s10 = rsll10
    end

    #sll_s11
    case num_slr
      when 0 then sll_s11 = psll11     
      when 1 then sll_s11 = psll9
      when 2 then sll_s11 = psll8
      when 3 then sll_s11 = psll7
      when 4 then sll_s11 = psll6
      when 5 then sll_s11 = psll5
      when 6 then sll_s11 = psll4
      when 7 then sll_s11 = psll3
      when 8 then sll_s11 = psll2
      when 9 then sll_s11 = psll1
      when 10 then sll_s11 = self.user.s_name3 + ' - Pass'
      when 11..100 then sll_s11 = rsll11
    end

    #sll_s12
    case num_slr
      when 0 then sll_s12 = psll12    
      when 1 then sll_s12 = psll10
      when 2 then sll_s12 = psll9
      when 3 then sll_s12 = psll8
      when 4 then sll_s12 = psll7
      when 5 then sll_s12 = psll6
      when 6 then sll_s12 = psll5
      when 7 then sll_s12 = psll4
      when 8 then sll_s12 = psll3
      when 9 then sll_s12 = psll2
      when 10 then sll_s12 = psll1
      when 11..100 then sll_s12 = rsll12
    end

  
    #Right Hash
    # slr_s0 would always be blank

    #slr_s1 
    if num_slr > 0
      slr_s1 = rslr1
    else
      slr_s1 = pslr1
    end

    #slr_s2
    if num_slr == 0
      slr_s2 = pslr2
    elsif num_slr == 1
      slr_s2 = ''
    else num_slr > 1
      slr_s2 = rslr2
    end

    #slr_s3
    case num_slr
      when 0 then slr_s3 = pslr3       
      when 1 then slr_s3 = pslr1
      when 2 then slr_s3 = ''
      when 3..100 then slr_s3 = rslr3
    end

    #slr_s4
    case num_slr
      when 0 then slr_s4 = pslr4       
      when 1 then slr_s4 = pslr2
      when 2 then slr_s4 = pslr1
      when 3 then ''
      when 4..100 then slr_s4 = rslr4
    end

    #slr_s5
    case num_slr
      when 0 then slr_s5 = pslr5       
      when 1 then slr_s5 = pslr3
      when 2 then slr_s5 = pslr2
      when 3 then slr_s5 = pslr1
      when 4 then slr_s5 = ''
      when 5..100 then slr_s5 = rslr5
    end

    #slr_s6
    case num_slr
      when 0 then slr_s6 = pslr6      
      when 1 then slr_s6 = pslr4
      when 2 then slr_s6 = pslr3
      when 3 then slr_s6 = pslr2
      when 4 then slr_s6 = pslr1
      when 5 then slr_s6 = ''
      when 6..100 then slr_s6 = rslr6
    end

    #slr_s7
    case num_slr
      when 0 then slr_s7 = pslr7      
      when 1 then slr_s7 = pslr5
      when 2 then slr_s7 = pslr4
      when 3 then slr_s7 = pslr3
      when 4 then slr_s7 = pslr2
      when 5 then slr_s7 = pslr1
      when 6 then slr_s7 = ''
      when 7..100 then slr_s7 = rslr7
    end

    #slr_s8
    case num_slr
      when 0 then slr_s8 = pslr8      
      when 1 then slr_s8 = pslr6
      when 2 then slr_s8 = pslr5
      when 3 then slr_s8 = pslr4
      when 4 then slr_s8 = pslr3
      when 5 then slr_s8 = pslr2
      when 6 then slr_s8 = pslr1
      when 7 then slr_s8 = ''
      when 8..100 then slr_s8 = rslr8
    end

    #slr_s9
    case num_slr
      when 0 then slr_s9 = pslr9      
      when 1 then slr_s9 = pslr7
      when 2 then slr_s9 = pslr6
      when 3 then slr_s9 = pslr5
      when 4 then slr_s9 = pslr4
      when 5 then slr_s9 = pslr3
      when 6 then slr_s9 = pslr2
      when 7 then slr_s9 = pslr1
      when 8 then slr_s9 = ''
      when 9..100 then slr_s9 = rslr9
    end

    #slr_s10
    case num_slr
      when 0 then slr_s10 = pslr10     
      when 1 then slr_s10 = pslr8
      when 2 then slr_s10 = pslr7
      when 3 then slr_s10 = pslr6
      when 4 then slr_s10 = pslr5
      when 5 then slr_s10 = pslr4
      when 6 then slr_s10 = pslr3
      when 7 then slr_s10 = pslr2
      when 8 then slr_s10 = pslr1
      when 9 then slr_s10 = ''
      when 10..100 then slr_s10 = rslr10
    end

    #slr_s11
    case num_slr
      when 0 then slr_s11 = pslr11     
      when 1 then slr_s11 = pslr9
      when 2 then slr_s11 = pslr8
      when 3 then slr_s11 = pslr7
      when 4 then slr_s11 = pslr6
      when 5 then slr_s11 = pslr5
      when 6 then slr_s11 = pslr4
      when 7 then slr_s11 = pslr3
      when 8 then slr_s11 = pslr2
      when 9 then slr_s11 = pslr1
      when 10 then slr_s11 = ''
      when 11..100 then slr_s11 = rslr11
    end

    #slr_s12
    case num_slr
      when 0 then slr_s12 = pslr12    
      when 1 then slr_s12 = pslr10
      when 2 then slr_s12 = pslr9
      when 3 then slr_s12 = pslr8
      when 4 then slr_s12 = pslr7
      when 5 then slr_s12 = pslr6
      when 6 then slr_s12 = pslr5
      when 7 then slr_s12 = pslr4
      when 8 then slr_s12 = pslr3
      when 9 then slr_s12 = pslr2
      when 10 then slr_s12 = pslr1
      when 11..100 then slr_s12 = rslr12
    end

    #----------End 2nd & Long ----------

    #----------3rd & Long ----------
    thirdLongs = event.plays.where('situation6 = ?', true)
     
    runThirdLongs = thirdLongs.where('play_type = ?', 'Run')
    runThirdLongsLeft = runThirdLongs.where('hash_mark = ?', 'Left')
    runThirdLongsRight = runThirdLongs.where('hash_mark = ?', 'Right')
     
    passThirdLongs = thirdLongs.where('play_type = ?', 'Pass')
    passThirdLongsLeft = passThirdLongs.where('hash_mark = ?', 'Left')
    passThirdLongsRight = passThirdLongs.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdLongsLeft[0].nil?  
      rtll1 = runThirdLongsLeft[0].fullname 
    end
    unless runThirdLongsLeft[1].nil?  
      rtll2 = runThirdLongsLeft[1].fullname 
    end
    unless runThirdLongsLeft[2].nil?  
      rtll3 = runThirdLongsLeft[2].fullname 
    end
    unless runThirdLongsLeft[3].nil?  
      rtll4 = runThirdLongsLeft[3].fullname 
    end
    unless runThirdLongsLeft[4].nil?  
      rtll5 = runThirdLongsLeft[4].fullname 
    end
    unless runThirdLongsLeft[5].nil?  
      rtll6 = runThirdLongsLeft[5].fullname 
    end
    unless runThirdLongsLeft[6].nil?  
      rtll7 = runThirdLongsLeft[6].fullname 
    end
    unless runThirdLongsLeft[7].nil?  
      rtll8 = runThirdLongsLeft[7].fullname 
    end
    unless runThirdLongsLeft[8].nil?  
      rtll9 = runThirdLongsLeft[8].fullname 
    end
    unless runThirdLongsLeft[9].nil?  
      rtll10 = runThirdLongsLeft[9].fullname 
    end
    unless runThirdLongsLeft[10].nil?  
      rtll11 = runThirdLongsLeft[10].fullname 
    end
    unless runThirdLongsLeft[11].nil?  
      rtll12 = runThirdLongsLeft[11].fullname 
    end

    #Run Right Hash
    unless runThirdLongsRight[0].nil?  
      rtlr1 = runThirdLongsRight[0].fullname 
    end
    unless runThirdLongsRight[1].nil?  
      rtlr2 = runThirdLongsRight[1].fullname 
    end
    unless runThirdLongsRight[2].nil?  
      rtlr3 = runThirdLongsRight[2].fullname 
    end
    unless runThirdLongsRight[3].nil?  
      rtlr4 = runThirdLongsRight[3].fullname 
    end
    unless runThirdLongsRight[4].nil?  
      rtlr5 = runThirdLongsRight[4].fullname 
    end
    unless runThirdLongsRight[5].nil?  
      rtlr6 = runThirdLongsRight[5].fullname 
    end
    unless runThirdLongsRight[6].nil?  
      rtlr7 = runThirdLongsRight[6].fullname 
    end
    unless runThirdLongsRight[7].nil?  
      rtlr8 = runThirdLongsRight[7].fullname 
    end
    unless runThirdLongsRight[8].nil?  
      rtlr9 = runThirdLongsRight[8].fullname 
    end
    unless runThirdLongsRight[9].nil?  
      rtlr10 = runThirdLongsRight[9].fullname 
    end
    unless runThirdLongsRight[10].nil?  
      rtlr11 = runThirdLongsRight[10].fullname 
    end
    unless runThirdLongsRight[11].nil?  
      rtlr12 = runThirdLongsRight[11].fullname 
    end

    #Pass Left Hash
    unless passThirdLongsLeft[0].nil?  
      ptll1 = passThirdLongsLeft[0].fullname 
    end
    unless passThirdLongsLeft[1].nil?  
      ptll2 = passThirdLongsLeft[1].fullname 
    end
    unless passThirdLongsLeft[2].nil?  
      ptll3 = passThirdLongsLeft[2].fullname 
    end
    unless passThirdLongsLeft[3].nil?  
      ptll4 = passThirdLongsLeft[3].fullname 
    end
    unless passThirdLongsLeft[4].nil?  
      ptll5 = passThirdLongsLeft[4].fullname 
    end
    unless passThirdLongsLeft[5].nil?  
      ptll6 = passThirdLongsLeft[5].fullname 
    end
    unless passThirdLongsLeft[6].nil?  
      ptll7 = passThirdLongsLeft[6].fullname 
    end
    unless passThirdLongsLeft[7].nil?  
      ptll8 = passThirdLongsLeft[7].fullname 
    end   
    unless passThirdLongsLeft[8].nil?  
      ptll9 = passThirdLongsLeft[8].fullname 
    end
    unless passThirdLongsLeft[9].nil?  
      ptll10 = passThirdLongsLeft[9].fullname 
    end
    unless passThirdLongsLeft[10].nil?  
      ptll11 = passThirdLongsLeft[10].fullname 
    end
    unless passThirdLongsLeft[11].nil?  
      ptll12 = passThirdLongsLeft[11].fullname 
    end         

    #Pass Right Hash
    unless passThirdLongsRight[0].nil?  
      ptlr1 = passThirdLongsRight[0].fullname 
    end
    unless passThirdLongsRight[1].nil?  
      ptlr2 = passThirdLongsRight[1].fullname 
    end
    unless passThirdLongsRight[2].nil?  
      ptlr3 = passThirdLongsRight[2].fullname 
    end
    unless passThirdLongsRight[3].nil?  
      ptlr4 = passThirdLongsRight[3].fullname 
    end
    unless passThirdLongsRight[4].nil?  
      ptlr5 = passThirdLongsRight[4].fullname 
    end
    unless passThirdLongsRight[5].nil?  
      ptlr6 = passThirdLongsRight[5].fullname 
    end
    unless passThirdLongsRight[6].nil?  
      ptlr7 = passThirdLongsRight[6].fullname 
    end
    unless passThirdLongsRight[7].nil?  
      ptlr8 = passThirdLongsRight[7].fullname 
    end     
    unless passThirdLongsRight[8].nil?  
      ptlr9 = passThirdLongsRight[8].fullname 
    end
    unless passThirdLongsRight[9].nil?  
      ptlr10 = passThirdLongsRight[9].fullname 
    end
    unless passThirdLongsRight[10].nil?  
      ptlr11 = passThirdLongsRight[10].fullname 
    end
    unless passThirdLongsRight[11].nil?  
      ptlr12 = passThirdLongsRight[11].fullname 
    end 

    #Number of user's run plays in situation 6
    num_thirdlg = self.user.s_name6_num_run

    #Left Hash
    # tll_s0 
    if num_thirdlg > 0
      tll_s0 = self.user.s_name6 + ' - Run'
    else
      tll_s0 = self.user.s_name6 + ' - Pass'
    end

    #tll_s1 
    if num_thirdlg > 0
      tll_s1 = rtll1
    else
      tll_s1 = ptll1
    end

    #tll_s2
    if num_thirdlg == 0
      tll_s2 = ptll2
    elsif num_thirdlg == 1
      tll_s2 = self.user.s_name6 + ' - Pass'
    else num_thirdlg > 1
      tll_s2 = rtll2
    end

    #tll_s3
    case num_thirdlg
      when 0 then tll_s3 = ptll3       
      when 1 then tll_s3 = ptll1
      when 2 then tll_s3 = self.user.s_name6 + ' - Pass'
      when 3..100 then tll_s3 = rtll3
    end

    #tll_s4
    case num_thirdlg
      when 0 then tll_s4 = ptll4       
      when 1 then tll_s4 = ptll2
      when 2 then tll_s4 = ptll1
      when 3 then tll_s4 = self.user.s_name6 + ' - Pass'
      when 4..100 then tll_s4 = rtll4
    end

    #tll_s5
    case num_thirdlg
      when 0 then tll_s5 = ptll5       
      when 1 then tll_s5 = ptll3
      when 2 then tll_s5 = ptll2
      when 3 then tll_s5 = ptll1
      when 4 then tll_s5 = self.user.s_name6 + ' - Pass'
      when 5..100 then tll_s5 = rtll5
    end

    #tll_s6
    case num_thirdlg
      when 0 then tll_s6 = ptll6      
      when 1 then tll_s6 = ptll4
      when 2 then tll_s6 = ptll3
      when 3 then tll_s6 = ptll2
      when 4 then tll_s6 = ptll1
      when 5 then tll_s6 = self.user.s_name6 + ' - Pass'
      when 6..100 then tll_s6 = rtll6
    end

    #tll_s7
    case num_thirdlg
      when 0 then tll_s7 = ptll7      
      when 1 then tll_s7 = ptll5
      when 2 then tll_s7 = ptll4
      when 3 then tll_s7 = ptll3
      when 4 then tll_s7 = ptll2
      when 5 then tll_s7 = ptll1
      when 6 then tll_s7 = self.user.s_name6 + ' - Pass'
      when 7..100 then tll_s7 = rtll7
    end

    #tll_s8
    case num_thirdlg
      when 0 then tll_s8 = ptll8      
      when 1 then tll_s8 = ptll6
      when 2 then tll_s8 = ptll5
      when 3 then tll_s8 = ptll4
      when 4 then tll_s8 = ptll3
      when 5 then tll_s8 = ptll2
      when 6 then tll_s8 = ptll1
      when 7 then tll_s8 = self.user.s_name6 + ' - Pass'
      when 8..100 then tll_s8 = rtll8
    end

    #tll_s9
    case num_thirdlg
      when 0 then tll_s9 = ptll9      
      when 1 then tll_s9 = ptll7
      when 2 then tll_s9 = ptll6
      when 3 then tll_s9 = ptll5
      when 4 then tll_s9 = ptll4
      when 5 then tll_s9 = ptll3
      when 6 then tll_s9 = ptll2
      when 7 then tll_s9 = ptll1
      when 8 then tll_s9 = self.user.s_name6 + ' - Pass'
      when 9..100 then tll_s9 = rtll9
    end

    #tll_s10
    case num_thirdlg
      when 0 then tll_s10 = ptll10     
      when 1 then tll_s10 = ptll8
      when 2 then tll_s10 = ptll7
      when 3 then tll_s10 = ptll6
      when 4 then tll_s10 = ptll5
      when 5 then tll_s10 = ptll4
      when 6 then tll_s10 = ptll3
      when 7 then tll_s10 = ptll2
      when 8 then tll_s10 = ptll1
      when 9 then tll_s10 = self.user.s_name6 + ' - Pass'
      when 10..100 then tll_s10 = rtll10
    end

    #tll_s11
    case num_thirdlg
      when 0 then tll_s11 = ptll11     
      when 1 then tll_s11 = ptll9
      when 2 then tll_s11 = ptll8
      when 3 then tll_s11 = ptll7
      when 4 then tll_s11 = ptll6
      when 5 then tll_s11 = ptll5
      when 6 then tll_s11 = ptll4
      when 7 then tll_s11 = ptll3
      when 8 then tll_s11 = ptll2
      when 9 then tll_s11 = ptll1
      when 10 then tll_s11 = self.user.s_name6 + ' - Pass'
      when 11..100 then tll_s11 = rtll11
    end

    #tll_s12
    case num_thirdlg
      when 0 then tll_s12 = ptll12    
      when 1 then tll_s12 = ptll10
      when 2 then tll_s12 = ptll9
      when 3 then tll_s12 = ptll8
      when 4 then tll_s12 = ptll7
      when 5 then tll_s12 = ptll6
      when 6 then tll_s12 = ptll5
      when 7 then tll_s12 = ptll4
      when 8 then tll_s12 = ptll3
      when 9 then tll_s12 = ptll2
      when 10 then tll_s12 = ptll1
      when 11..100 then tll_s12 = rtll12
    end

  
    #Right Hash
    # tlr_s0 would always be blank

    #tlr_s1 
    if num_thirdlg > 0
      tlr_s1 = rtlr1
    else
      tlr_s1 = ptlr1
    end

    #tlr_s2
    if num_thirdlg == 0
      tlr_s2 = ptlr2
    elsif num_thirdlg == 1
      tlr_s2 = ''
    else num_thirdlg > 1
      tlr_s2 = rtlr2
    end

    #tlr_s3
    case num_thirdlg
      when 0 then tlr_s3 = ptlr3       
      when 1 then tlr_s3 = ptlr1
      when 2 then tlr_s3 = ''
      when 3..100 then tlr_s3 = rtlr3
    end

    #tlr_s4
    case num_thirdlg
      when 0 then tlr_s4 = ptlr4       
      when 1 then tlr_s4 = ptlr2
      when 2 then tlr_s4 = ptlr1
      when 3 then ''
      when 4..100 then tlr_s4 = rtlr4
    end

    #tlr_s5
    case num_thirdlg
      when 0 then tlr_s5 = ptlr5       
      when 1 then tlr_s5 = ptlr3
      when 2 then tlr_s5 = ptlr2
      when 3 then tlr_s5 = ptlr1
      when 4 then tlr_s5 = ''
      when 5..100 then tlr_s5 = rtlr5
    end

    #tlr_s6
    case num_thirdlg
      when 0 then tlr_s6 = ptlr6      
      when 1 then tlr_s6 = ptlr4
      when 2 then tlr_s6 = ptlr3
      when 3 then tlr_s6 = ptlr2
      when 4 then tlr_s6 = ptlr1
      when 5 then tlr_s6 = ''
      when 6..100 then tlr_s6 = rtlr6
    end

    #tlr_s7
    case num_thirdlg
      when 0 then tlr_s7 = ptlr7      
      when 1 then tlr_s7 = ptlr5
      when 2 then tlr_s7 = ptlr4
      when 3 then tlr_s7 = ptlr3
      when 4 then tlr_s7 = ptlr2
      when 5 then tlr_s7 = ptlr1
      when 6 then tlr_s7 = ''
      when 7..100 then tlr_s7 = rtlr7
    end

    #tlr_s8
    case num_thirdlg
      when 0 then tlr_s8 = ptlr8      
      when 1 then tlr_s8 = ptlr6
      when 2 then tlr_s8 = ptlr5
      when 3 then tlr_s8 = ptlr4
      when 4 then tlr_s8 = ptlr3
      when 5 then tlr_s8 = ptlr2
      when 6 then tlr_s8 = ptlr1
      when 7 then tlr_s8 = ''
      when 8..100 then tlr_s8 = rtlr8
    end

    #tlr_s9
    case num_thirdlg
      when 0 then tlr_s9 = ptlr9      
      when 1 then tlr_s9 = ptlr7
      when 2 then tlr_s9 = ptlr6
      when 3 then tlr_s9 = ptlr5
      when 4 then tlr_s9 = ptlr4
      when 5 then tlr_s9 = ptlr3
      when 6 then tlr_s9 = ptlr2
      when 7 then tlr_s9 = ptlr1
      when 8 then tlr_s9 = ''
      when 9..100 then tlr_s9 = rtlr9
    end

    #tlr_s10
    case num_thirdlg
      when 0 then tlr_s10 = ptlr10     
      when 1 then tlr_s10 = ptlr8
      when 2 then tlr_s10 = ptlr7
      when 3 then tlr_s10 = ptlr6
      when 4 then tlr_s10 = ptlr5
      when 5 then tlr_s10 = ptlr4
      when 6 then tlr_s10 = ptlr3
      when 7 then tlr_s10 = ptlr2
      when 8 then tlr_s10 = ptlr1
      when 9 then tlr_s10 = ''
      when 10..100 then tlr_s10 = rtlr10
    end

    #tlr_s11
    case num_thirdlg
      when 0 then tlr_s11 = ptlr11     
      when 1 then tlr_s11 = ptlr9
      when 2 then tlr_s11 = ptlr8
      when 3 then tlr_s11 = ptlr7
      when 4 then tlr_s11 = ptlr6
      when 5 then tlr_s11 = ptlr5
      when 6 then tlr_s11 = ptlr4
      when 7 then tlr_s11 = ptlr3
      when 8 then tlr_s11 = ptlr2
      when 9 then tlr_s11 = ptlr1
      when 10 then tlr_s11 = ''
      when 11..100 then tlr_s11 = rtlr11
    end

    #tlr_s12
    case num_thirdlg
      when 0 then tlr_s12 = ptlr12    
      when 1 then tlr_s12 = ptlr10
      when 2 then tlr_s12 = ptlr9
      when 3 then tlr_s12 = ptlr8
      when 4 then tlr_s12 = ptlr7
      when 5 then tlr_s12 = ptlr6
      when 6 then tlr_s12 = ptlr5
      when 7 then tlr_s12 = ptlr4
      when 8 then tlr_s12 = ptlr3
      when 9 then tlr_s12 = ptlr2
      when 10 then tlr_s12 = ptlr1
      when 11..100 then tlr_s12 = rtlr12
    end    
    #----------End 3rd & Long----------    

    #----------2nd & Medium----------
    secondMediums = event.plays.where('situation4 = ?', true)
     
    runSecondMediums = secondMediums.where('play_type = ?', 'Run')
    runSecondMediumsLeft = runSecondMediums.where('hash_mark = ?', 'Left')
    runSecondMediumsRight = runSecondMediums.where('hash_mark = ?', 'Right')
     
    passSecondMediums = secondMediums.where('play_type = ?', 'Pass')
    passSecondMediumsLeft = passSecondMediums.where('hash_mark = ?', 'Left')
    passSecondMediumsRight = passSecondMediums.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondMediumsLeft[0].nil?  
      rsml1 = runSecondMediumsLeft[0].fullname 
    end
    unless runSecondMediumsLeft[1].nil?  
      rsml2 = runSecondMediumsLeft[1].fullname 
    end
    unless runSecondMediumsLeft[2].nil?  
      rsml3 = runSecondMediumsLeft[2].fullname 
    end
    unless runSecondMediumsLeft[3].nil?  
      rsml4 = runSecondMediumsLeft[3].fullname 
    end
    unless runSecondMediumsLeft[4].nil?  
      rsml5 = runSecondMediumsLeft[4].fullname
    end
    unless runSecondMediumsLeft[5].nil?  
      rsml6 = runSecondMediumsLeft[5].fullname 
    end
    unless runSecondMediumsLeft[6].nil?  
      rsml7 = runSecondMediumsLeft[6].fullname 
    end
    unless runSecondMediumsLeft[7].nil?  
      rsml8 = runSecondMediumsLeft[7].fullname 
    end
    unless runSecondMediumsLeft[8].nil?  
      rsml9 = runSecondMediumsLeft[8].fullname 
    end
    unless runSecondMediumsLeft[9].nil?  
      rsml10 = runSecondMediumsLeft[9].fullname
    end    
    unless runSecondMediumsLeft[10].nil?  
      rsml11 = runSecondMediumsLeft[10].fullname
    end 

    #Run Right Hash
    unless runSecondMediumsRight[0].nil?  
      rsmr1 = runSecondMediumsRight[0].fullname 
    end
    unless runSecondMediumsRight[1].nil?  
      rsmr2 = runSecondMediumsRight[1].fullname 
    end
    unless runSecondMediumsRight[2].nil?  
      rsmr3 = runSecondMediumsRight[2].fullname 
    end
    unless runSecondMediumsRight[3].nil?  
      rsmr4 = runSecondMediumsRight[3].fullname 
    end
    unless runSecondMediumsRight[4].nil?  
      rsmr5 = runSecondMediumsRight[4].fullname
    end
    unless runSecondMediumsRight[5].nil?  
      rsmr6 = runSecondMediumsRight[5].fullname 
    end
    unless runSecondMediumsRight[6].nil?  
      rsmr7 = runSecondMediumsRight[6].fullname 
    end
    unless runSecondMediumsRight[7].nil?  
      rsmr8 = runSecondMediumsRight[7].fullname 
    end
    unless runSecondMediumsRight[8].nil?  
      rsmr9 = runSecondMediumsRight[8].fullname 
    end
    unless runSecondMediumsRight[9].nil?  
      rsmr10 = runSecondMediumsRight[9].fullname
    end
    unless runSecondMediumsRight[10].nil?  
      rsmr11 = runSecondMediumsRight[10].fullname
    end

    #Pass Left Hash
    unless passSecondMediumsLeft[0].nil?  
      psml1 = passSecondMediumsLeft[0].fullname 
    end
    unless passSecondMediumsLeft[1].nil?  
      psml2 = passSecondMediumsLeft[1].fullname 
    end
    unless passSecondMediumsLeft[2].nil?  
      psml3 = passSecondMediumsLeft[2].fullname 
    end
    unless passSecondMediumsLeft[3].nil?  
      psml4 = passSecondMediumsLeft[3].fullname 
    end
    unless passSecondMediumsLeft[4].nil?  
      psml5 = passSecondMediumsLeft[4].fullname
    end
    unless passSecondMediumsLeft[5].nil?  
      psml6 = passSecondMediumsLeft[5].fullname 
    end
    unless passSecondMediumsLeft[6].nil?  
      psml7 = passSecondMediumsLeft[6].fullname 
    end
    unless passSecondMediumsLeft[7].nil?  
      psml8 = passSecondMediumsLeft[7].fullname 
    end
    unless passSecondMediumsLeft[8].nil?  
      psml9 = passSecondMediumsLeft[8].fullname 
    end
    unless passSecondMediumsLeft[9].nil?  
      psml10 = passSecondMediumsLeft[9].fullname
    end
    unless passSecondMediumsLeft[10].nil?  
      psml11 = passSecondMediumsLeft[10].fullname 
    end

    #Pass Right Hash
    unless passSecondMediumsRight[0].nil?  
      psmr1 = passSecondMediumsRight[0].fullname 
    end
    unless passSecondMediumsRight[1].nil?  
      psmr2 = passSecondMediumsRight[1].fullname 
    end
    unless passSecondMediumsRight[2].nil?  
      psmr3 = passSecondMediumsRight[2].fullname 
    end
    unless passSecondMediumsRight[3].nil?  
      psmr4 = passSecondMediumsRight[3].fullname 
    end
    unless passSecondMediumsRight[4].nil?  
      psmr5 = passSecondMediumsRight[4].fullname
    end
    unless passSecondMediumsRight[5].nil?  
      psmr6 = passSecondMediumsRight[5].fullname 
    end
    unless passSecondMediumsRight[6].nil?  
      psmr7 = passSecondMediumsRight[6].fullname 
    end
    unless passSecondMediumsRight[7].nil?  
      psmr8 = passSecondMediumsRight[7].fullname 
    end
    unless passSecondMediumsRight[8].nil?  
      psmr9 = passSecondMediumsRight[8].fullname 
    end
    unless passSecondMediumsRight[9].nil?  
      psmr10 = passSecondMediumsRight[9].fullname
    end
    unless passSecondMediumsRight[10].nil?  
      psmr11 = passSecondMediumsRight[10].fullname 
    end

    #Number of user's run plays in situation 4
    num_secondmd = self.user.s_name4_num_run

    #Left Hash
    # tll_s0 
    if num_secondmd > 0
      secondmdl_s0 = self.user.s_name4 + ' - Run'
    else
      secondmdl_s0 = self.user.s_name4 + ' - Pass'
    end

    #secondmdl_s1 
    if num_secondmd > 0
      secondmdl_s1 = rsml1
    else
      secondmdl_s1 = psml1
    end

    #secondmdl_s2
    if num_secondmd == 0
      secondmdl_s2 = psml2
    elsif num_secondmd == 1
      secondmdl_s2 = self.user.s_name4 + ' - Pass'
    else num_secondmd > 1
      secondmdl_s2 = rsml2
    end

    #secondmdl_s3
    case num_secondmd
      when 0 then secondmdl_s3 = psml3       
      when 1 then secondmdl_s3 = psml1
      when 2 then secondmdl_s3 = self.user.s_name4 + ' - Pass'
      when 3..100 then secondmdl_s3 = rsml3
    end

    #secondmdl_s4
    case num_secondmd
      when 0 then secondmdl_s4 = psml4       
      when 1 then secondmdl_s4 = psml2
      when 2 then secondmdl_s4 = psml1
      when 3 then secondmdl_s4 = self.user.s_name4 + ' - Pass'
      when 4..100 then secondmdl_s4 = rsml4
    end

    #secondmdl_s5
    case num_secondmd
      when 0 then secondmdl_s5 = psml5       
      when 1 then secondmdl_s5 = psml3
      when 2 then secondmdl_s5 = psml2
      when 3 then secondmdl_s5 = psml1
      when 4 then secondmdl_s5 = self.user.s_name4 + ' - Pass'
      when 5..100 then secondmdl_s5 = rsml5
    end

    #secondmdl_s6
    case num_secondmd
      when 0 then secondmdl_s6 = psml6      
      when 1 then secondmdl_s6 = psml4
      when 2 then secondmdl_s6 = psml3
      when 3 then secondmdl_s6 = psml2
      when 4 then secondmdl_s6 = psml1
      when 5 then secondmdl_s6 = self.user.s_name4 + ' - Pass'
      when 6..100 then secondmdl_s6 = rsml6
    end

    #secondmdl_s7
    case num_secondmd
      when 0 then secondmdl_s7 = psml7      
      when 1 then secondmdl_s7 = psml5
      when 2 then secondmdl_s7 = psml4
      when 3 then secondmdl_s7 = psml3
      when 4 then secondmdl_s7 = psml2
      when 5 then secondmdl_s7 = psml1
      when 6 then secondmdl_s7 = self.user.s_name4 + ' - Pass'
      when 7..100 then secondmdl_s7 = rsml7
    end

    #secondmdl_s8
    case num_secondmd
      when 0 then secondmdl_s8 = psml8      
      when 1 then secondmdl_s8 = psml6
      when 2 then secondmdl_s8 = psml5
      when 3 then secondmdl_s8 = psml4
      when 4 then secondmdl_s8 = psml3
      when 5 then secondmdl_s8 = psml2
      when 6 then secondmdl_s8 = psml1
      when 7 then secondmdl_s8 = self.user.s_name4 + ' - Pass'
      when 8..100 then secondmdl_s8 = rsml8
    end

    #secondmdl_s9
    case num_secondmd
      when 0 then secondmdl_s9 = psml9      
      when 1 then secondmdl_s9 = psml7
      when 2 then secondmdl_s9 = psml6
      when 3 then secondmdl_s9 = psml5
      when 4 then secondmdl_s9 = psml4
      when 5 then secondmdl_s9 = psml3
      when 6 then secondmdl_s9 = psml2
      when 7 then secondmdl_s9 = psml1
      when 8 then secondmdl_s9 = self.user.s_name4 + ' - Pass'
      when 9..100 then secondmdl_s9 = rsml9
    end

    #secondmdl_s10
    case num_secondmd
      when 0 then secondmdl_s10 = psml10     
      when 1 then secondmdl_s10 = psml8
      when 2 then secondmdl_s10 = psml7
      when 3 then secondmdl_s10 = psml6
      when 4 then secondmdl_s10 = psml5
      when 5 then secondmdl_s10 = psml4
      when 6 then secondmdl_s10 = psml3
      when 7 then secondmdl_s10 = psml2
      when 8 then secondmdl_s10 = psml1
      when 9 then secondmdl_s10 = self.user.s_name4 + ' - Pass'
      when 10..100 then secondmdl_s10 = rsml10
    end

    #secondmdl_s11
    case num_secondmd
      when 0 then secondmdl_s11 = psml11     
      when 1 then secondmdl_s11 = psml9
      when 2 then secondmdl_s11 = psml8
      when 3 then secondmdl_s11 = psml7
      when 4 then secondmdl_s11 = psml6
      when 5 then secondmdl_s11 = psml5
      when 6 then secondmdl_s11 = psml4
      when 7 then secondmdl_s11 = psml3
      when 8 then secondmdl_s11 = psml2
      when 9 then secondmdl_s11 = psml1
      when 10..100 then secondmdl_s11 = rsml11
    end
  
    #Right Hash
    # secondmdr_s0 would always be blank

    #secondmdr_s1 
    if num_secondmd > 0
      secondmdr_s1 = rsmr1
    else
      secondmdr_s1 = psmr1
    end

    #secondmdr_s2
    if num_secondmd == 0
      secondmdr_s2 = psmr2
    elsif num_secondmd == 1
      secondmdr_s2 = ''
    else num_secondmd > 1
      secondmdr_s2 = rsmr2
    end

    #secondmdr_s3
    case num_secondmd
      when 0 then secondmdr_s3 = psmr3       
      when 1 then secondmdr_s3 = psmr1
      when 2 then secondmdr_s3 = ''
      when 3..100 then secondmdr_s3 = rsmr3
    end

    #secondmdr_s4
    case num_secondmd
      when 0 then secondmdr_s4 = psmr4       
      when 1 then secondmdr_s4 = psmr2
      when 2 then secondmdr_s4 = psmr1
      when 3 then ''
      when 4..100 then secondmdr_s4 = rsmr4
    end

    #secondmdr_s5
    case num_secondmd
      when 0 then secondmdr_s5 = psmr5       
      when 1 then secondmdr_s5 = psmr3
      when 2 then secondmdr_s5 = psmr2
      when 3 then secondmdr_s5 = psmr1
      when 4 then secondmdr_s5 = ''
      when 5..100 then secondmdr_s5 = rsmr5
    end

    #secondmdr_s6
    case num_secondmd
      when 0 then secondmdr_s6 = psmr6      
      when 1 then secondmdr_s6 = psmr4
      when 2 then secondmdr_s6 = psmr3
      when 3 then secondmdr_s6 = psmr2
      when 4 then secondmdr_s6 = psmr1
      when 5 then secondmdr_s6 = ''
      when 6..100 then secondmdr_s6 = rsmr6
    end

    #secondmdr_s7
    case num_secondmd
      when 0 then secondmdr_s7 = psmr7      
      when 1 then secondmdr_s7 = psmr5
      when 2 then secondmdr_s7 = psmr4
      when 3 then secondmdr_s7 = psmr3
      when 4 then secondmdr_s7 = psmr2
      when 5 then secondmdr_s7 = psmr1
      when 6 then secondmdr_s7 = ''
      when 7..100 then secondmdr_s7 = rsmr7
    end

    #secondmdr_s8
    case num_secondmd
      when 0 then secondmdr_s8 = psmr8      
      when 1 then secondmdr_s8 = psmr6
      when 2 then secondmdr_s8 = psmr5
      when 3 then secondmdr_s8 = psmr4
      when 4 then secondmdr_s8 = psmr3
      when 5 then secondmdr_s8 = psmr2
      when 6 then secondmdr_s8 = psmr1
      when 7 then secondmdr_s8 = ''
      when 8..100 then secondmdr_s8 = rsmr8
    end

    #secondmdr_s9
    case num_secondmd
      when 0 then secondmdr_s9 = psmr9      
      when 1 then secondmdr_s9 = psmr7
      when 2 then secondmdr_s9 = psmr6
      when 3 then secondmdr_s9 = psmr5
      when 4 then secondmdr_s9 = psmr4
      when 5 then secondmdr_s9 = psmr3
      when 6 then secondmdr_s9 = psmr2
      when 7 then secondmdr_s9 = psmr1
      when 8 then secondmdr_s9 = ''
      when 9..100 then secondmdr_s9 = rsmr9
    end

    #secondmdr_s10
    case num_secondmd
      when 0 then secondmdr_s10 = psmr10     
      when 1 then secondmdr_s10 = psmr8
      when 2 then secondmdr_s10 = psmr7
      when 3 then secondmdr_s10 = psmr6
      when 4 then secondmdr_s10 = psmr5
      when 5 then secondmdr_s10 = psmr4
      when 6 then secondmdr_s10 = psmr3
      when 7 then secondmdr_s10 = psmr2
      when 8 then secondmdr_s10 = psmr1
      when 9 then secondmdr_s10 = ''
      when 10..100 then secondmdr_s10 = rsmr10
    end

    #secondmdr_s11
    case num_secondmd
      when 0 then secondmdr_s11 = psmr11     
      when 1 then secondmdr_s11 = psmr9
      when 2 then secondmdr_s11 = psmr8
      when 3 then secondmdr_s11 = psmr7
      when 4 then secondmdr_s11 = psmr6
      when 5 then secondmdr_s11 = psmr5
      when 6 then secondmdr_s11 = psmr4
      when 7 then secondmdr_s11 = psmr3
      when 8 then secondmdr_s11 = psmr2
      when 9 then secondmdr_s11 = psmr1
      when 10..100 then secondmdr_s11 = rsmr11
    end
   
    #----------End 2nd & Medium----------

    #----------3rd & Medium----------
    thirdMediums = event.plays.where('situation7 = ?', true)
     
    runThirdMediums = thirdMediums.where('play_type = ?', 'Run')
    runThirdMediumsLeft = runThirdMediums.where('hash_mark = ?', 'Left')
    runThirdMediumsRight = runThirdMediums.where('hash_mark = ?', 'Right')
     
    passThirdMediums = thirdMediums.where('play_type = ?', 'Pass')
    passThirdMediumsLeft = passThirdMediums.where('hash_mark = ?', 'Left')
    passThirdMediumsRight = passThirdMediums.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdMediumsLeft[0].nil?  
      rtml1 = runThirdMediumsLeft[0].fullname 
    end
    unless runThirdMediumsLeft[1].nil?  
      rtml2 = runThirdMediumsLeft[1].fullname 
    end
    unless runThirdMediumsLeft[2].nil?  
      rtml3 = runThirdMediumsLeft[2].fullname 
    end
    unless runThirdMediumsLeft[3].nil?  
      rtml4 = runThirdMediumsLeft[3].fullname 
    end
    unless runThirdMediumsLeft[4].nil?  
      rtml5 = runThirdMediumsLeft[4].fullname
    end
    unless runThirdMediumsLeft[5].nil?  
      rtml6 = runThirdMediumsLeft[5].fullname 
    end
    unless runThirdMediumsLeft[6].nil?  
      rtml7 = runThirdMediumsLeft[6].fullname 
    end
    unless runThirdMediumsLeft[7].nil?  
      rtml8 = runThirdMediumsLeft[7].fullname 
    end
    unless runThirdMediumsLeft[8].nil?  
      rtml9 = runThirdMediumsLeft[8].fullname 
    end
    unless runThirdMediumsLeft[9].nil?  
      rtml10 = runThirdMediumsLeft[9].fullname
    end
    unless runThirdMediumsLeft[10].nil?  
      rtml11 = runThirdMediumsLeft[10].fullname 
    end

    #Run Right Hash
    unless runThirdMediumsRight[0].nil?  
      rtmr1 = runThirdMediumsRight[0].fullname 
    end
    unless runThirdMediumsRight[1].nil?  
      rtmr2 = runThirdMediumsRight[1].fullname 
    end
    unless runThirdMediumsRight[2].nil?  
      rtmr3 = runThirdMediumsRight[2].fullname 
    end
    unless runThirdMediumsRight[3].nil?  
      rtmr4 = runThirdMediumsRight[3].fullname 
    end
    unless runThirdMediumsRight[4].nil?  
      rtmr5 = runThirdMediumsRight[4].fullname
    end
    unless runThirdMediumsRight[5].nil?  
      rtmr6 = runThirdMediumsRight[5].fullname 
    end
    unless runThirdMediumsRight[6].nil?  
      rtmr7 = runThirdMediumsRight[6].fullname 
    end
    unless runThirdMediumsRight[7].nil?  
      rtmr8 = runThirdMediumsRight[7].fullname 
    end
    unless runThirdMediumsRight[8].nil?  
      rtmr9 = runThirdMediumsRight[8].fullname 
    end
    unless runThirdMediumsRight[9].nil?  
      rtmr10 = runThirdMediumsRight[9].fullname
    end
    unless runThirdMediumsRight[10].nil?  
      rtmr11 = runThirdMediumsRight[10].fullname 
    end
    

    #Pass Left Hash
    unless passThirdMediumsLeft[0].nil?  
      ptml1 = passThirdMediumsLeft[0].fullname 
    end
    unless passThirdMediumsLeft[1].nil?  
      ptml2 = passThirdMediumsLeft[1].fullname 
    end
    unless passThirdMediumsLeft[2].nil?  
      ptml3 = passThirdMediumsLeft[2].fullname 
    end
    unless passThirdMediumsLeft[3].nil?  
      ptml4 = passThirdMediumsLeft[3].fullname 
    end
    unless passThirdMediumsLeft[4].nil?  
      ptml5 = passThirdMediumsLeft[4].fullname
    end
    unless passThirdMediumsLeft[5].nil?  
      ptml6 = passThirdMediumsLeft[5].fullname 
    end
    unless passThirdMediumsLeft[6].nil?  
      ptml7 = passThirdMediumsLeft[6].fullname 
    end
    unless passThirdMediumsLeft[7].nil?  
      ptml8 = passThirdMediumsLeft[7].fullname 
    end
    unless passThirdMediumsLeft[8].nil?  
      ptml9 = passThirdMediumsLeft[8].fullname 
    end
    unless passThirdMediumsLeft[9].nil?  
      ptml10 = passThirdMediumsLeft[9].fullname
    end
    unless passThirdMediumsLeft[10].nil?  
      ptml11 = passThirdMediumsLeft[10].fullname 
    end

    #Pass Right Hash
    unless passThirdMediumsRight[0].nil?  
      ptmr1 = passThirdMediumsRight[0].fullname 
    end
    unless passThirdMediumsRight[1].nil?  
      ptmr2 = passThirdMediumsRight[1].fullname 
    end
    unless passThirdMediumsRight[2].nil?  
      ptmr3 = passThirdMediumsRight[2].fullname 
    end
    unless passThirdMediumsRight[3].nil?  
      ptmr4 = passThirdMediumsRight[3].fullname 
    end
    unless passThirdMediumsRight[4].nil?  
      ptmr5 = passThirdMediumsRight[4].fullname
    end
    unless passThirdMediumsRight[5].nil?  
      ptmr6 = passThirdMediumsRight[5].fullname 
    end
    unless passThirdMediumsRight[6].nil?  
      ptmr7 = passThirdMediumsRight[6].fullname 
    end
    unless passThirdMediumsRight[7].nil?  
      ptmr8 = passThirdMediumsRight[7].fullname 
    end
    unless passThirdMediumsRight[8].nil?  
      ptmr9 = passThirdMediumsRight[8].fullname 
    end
    unless passThirdMediumsRight[9].nil?  
      ptmr10 = passThirdMediumsRight[9].fullname
    end
    unless passThirdMediumsRight[10].nil?  
      ptmr11 = passThirdMediumsRight[10].fullname 
    end
    

    #Number of user's run plays in situation 7
    num_thirdmd = self.user.s_name7_num_run

    #Left Hash
    # thirdmdl_s0 
    if num_thirdmd > 0
      thirdmdl_s0 = self.user.s_name7 + ' - Run'
    else
      thirdmdl_s0 = self.user.s_name7 + ' - Pass'
    end

    #thirdmdl_s1 
    if num_thirdmd > 0
      thirdmdl_s1 = rtml1
    else
      thirdmdl_s1 = ptml1
    end

    #thirdmdl_s2
    if num_thirdmd == 0
      thirdmdl_s2 = ptml2
    elsif num_thirdmd == 1
      thirdmdl_s2 = self.user.s_name7 + ' - Pass'
    else num_thirdmd > 1
      thirdmdl_s2 = rtml2
    end

    #thirdmdl_s3
    case num_thirdmd
      when 0 then thirdmdl_s3 = ptml3       
      when 1 then thirdmdl_s3 = ptml1
      when 2 then thirdmdl_s3 = self.user.s_name7 + ' - Pass'
      when 3..100 then thirdmdl_s3 = rtml3
    end

    #thirdmdl_s4
    case num_thirdmd
      when 0 then thirdmdl_s4 = ptml4       
      when 1 then thirdmdl_s4 = ptml2
      when 2 then thirdmdl_s4 = ptml1
      when 3 then thirdmdl_s4 = self.user.s_name7 + ' - Pass'
      when 4..100 then thirdmdl_s4 = rtml4
    end

    #thirdmdl_s5
    case num_thirdmd
      when 0 then thirdmdl_s5 = ptml5       
      when 1 then thirdmdl_s5 = ptml3
      when 2 then thirdmdl_s5 = ptml2
      when 3 then thirdmdl_s5 = ptml1
      when 4 then thirdmdl_s5 = self.user.s_name7 + ' - Pass'
      when 5..100 then thirdmdl_s5 = rtml5
    end

    #thirdmdl_s6
    case num_thirdmd
      when 0 then thirdmdl_s6 = ptml6      
      when 1 then thirdmdl_s6 = ptml4
      when 2 then thirdmdl_s6 = ptml3
      when 3 then thirdmdl_s6 = ptml2
      when 4 then thirdmdl_s6 = ptml1
      when 5 then thirdmdl_s6 = self.user.s_name7 + ' - Pass'
      when 6..100 then thirdmdl_s6 = rtml6
    end

    #thirdmdl_s7
    case num_thirdmd
      when 0 then thirdmdl_s7 = ptml7      
      when 1 then thirdmdl_s7 = ptml5
      when 2 then thirdmdl_s7 = ptml4
      when 3 then thirdmdl_s7 = ptml3
      when 4 then thirdmdl_s7 = ptml2
      when 5 then thirdmdl_s7 = ptml1
      when 6 then thirdmdl_s7 = self.user.s_name7 + ' - Pass'
      when 7..100 then thirdmdl_s7 = rtml7
    end

    #thirdmdl_s8
    case num_thirdmd
      when 0 then thirdmdl_s8 = ptml8      
      when 1 then thirdmdl_s8 = ptml6
      when 2 then thirdmdl_s8 = ptml5
      when 3 then thirdmdl_s8 = ptml4
      when 4 then thirdmdl_s8 = ptml3
      when 5 then thirdmdl_s8 = ptml2
      when 6 then thirdmdl_s8 = ptml1
      when 7 then thirdmdl_s8 = self.user.s_name7 + ' - Pass'
      when 8..100 then thirdmdl_s8 = rtml8
    end

    #thirdmdl_s9
    case num_thirdmd
      when 0 then thirdmdl_s9 = ptml9      
      when 1 then thirdmdl_s9 = ptml7
      when 2 then thirdmdl_s9 = ptml6
      when 3 then thirdmdl_s9 = ptml5
      when 4 then thirdmdl_s9 = ptml4
      when 5 then thirdmdl_s9 = ptml3
      when 6 then thirdmdl_s9 = ptml2
      when 7 then thirdmdl_s9 = ptml1
      when 8 then thirdmdl_s9 = self.user.s_name7 + ' - Pass'
      when 9..100 then thirdmdl_s9 = rtml9
    end

    #thirdmdl_s10
    case num_thirdmd
      when 0 then thirdmdl_s10 = ptml10     
      when 1 then thirdmdl_s10 = ptml8
      when 2 then thirdmdl_s10 = ptml7
      when 3 then thirdmdl_s10 = ptml6
      when 4 then thirdmdl_s10 = ptml5
      when 5 then thirdmdl_s10 = ptml4
      when 6 then thirdmdl_s10 = ptml3
      when 7 then thirdmdl_s10 = ptml2
      when 8 then thirdmdl_s10 = ptml1
      when 9 then thirdmdl_s10 = self.user.s_name7 + ' - Pass'
      when 10..100 then thirdmdl_s10 = rtml10
    end

    #thirdmdl_s11
    case num_thirdmd
      when 0 then thirdmdl_s11 = ptml11     
      when 1 then thirdmdl_s11 = ptml9
      when 2 then thirdmdl_s11 = ptml8
      when 3 then thirdmdl_s11 = ptml7
      when 4 then thirdmdl_s11 = ptml6
      when 5 then thirdmdl_s11 = ptml5
      when 6 then thirdmdl_s11 = ptml4
      when 7 then thirdmdl_s11 = ptml3
      when 8 then thirdmdl_s11 = ptml2
      when 9 then thirdmdl_s11 = ptml1
      when 10..100 then thirdmdl_s11 = rtml11
    end
  
    #Right Hash
    # thirdmdr_s0 would always be blank

    #thirdmdr_s1 
    if num_thirdmd > 0
      thirdmdr_s1 = rtmr1
    else
      thirdmdr_s1 = ptmr1
    end

    #thirdmdr_s2
    if num_thirdmd == 0
      thirdmdr_s2 = ptmr2
    elsif num_thirdmd == 1
      thirdmdr_s2 = ''
    else num_thirdmd > 1
      thirdmdr_s2 = rtmr2
    end

    #thirdmdr_s3
    case num_thirdmd
      when 0 then thirdmdr_s3 = ptmr3       
      when 1 then thirdmdr_s3 = ptmr1
      when 2 then thirdmdr_s3 = ''
      when 3..100 then thirdmdr_s3 = rtmr3
    end

    #thirdmdr_s4
    case num_thirdmd
      when 0 then thirdmdr_s4 = ptmr4       
      when 1 then thirdmdr_s4 = ptmr2
      when 2 then thirdmdr_s4 = ptmr1
      when 3 then ''
      when 4..100 then thirdmdr_s4 = rtmr4
    end

    #thirdmdr_s5
    case num_thirdmd
      when 0 then thirdmdr_s5 = ptmr5       
      when 1 then thirdmdr_s5 = ptmr3
      when 2 then thirdmdr_s5 = ptmr2
      when 3 then thirdmdr_s5 = ptmr1
      when 4 then thirdmdr_s5 = ''
      when 5..100 then thirdmdr_s5 = rtmr5
    end

    #thirdmdr_s6
    case num_thirdmd
      when 0 then thirdmdr_s6 = ptmr6      
      when 1 then thirdmdr_s6 = ptmr4
      when 2 then thirdmdr_s6 = ptmr3
      when 3 then thirdmdr_s6 = ptmr2
      when 4 then thirdmdr_s6 = ptmr1
      when 5 then thirdmdr_s6 = ''
      when 6..100 then thirdmdr_s6 = rtmr6
    end

    #thirdmdr_s7
    case num_thirdmd
      when 0 then thirdmdr_s7 = ptmr7      
      when 1 then thirdmdr_s7 = ptmr5
      when 2 then thirdmdr_s7 = ptmr4
      when 3 then thirdmdr_s7 = ptmr3
      when 4 then thirdmdr_s7 = ptmr2
      when 5 then thirdmdr_s7 = ptmr1
      when 6 then thirdmdr_s7 = ''
      when 7..100 then thirdmdr_s7 = rtmr7
    end

    #thirdmdr_s8
    case num_thirdmd
      when 0 then thirdmdr_s8 = ptmr8      
      when 1 then thirdmdr_s8 = ptmr6
      when 2 then thirdmdr_s8 = ptmr5
      when 3 then thirdmdr_s8 = ptmr4
      when 4 then thirdmdr_s8 = ptmr3
      when 5 then thirdmdr_s8 = ptmr2
      when 6 then thirdmdr_s8 = ptmr1
      when 7 then thirdmdr_s8 = ''
      when 8..100 then thirdmdr_s8 = rtmr8
    end

    #thirdmdr_s9
    case num_thirdmd
      when 0 then thirdmdr_s9 = ptmr9      
      when 1 then thirdmdr_s9 = ptmr7
      when 2 then thirdmdr_s9 = ptmr6
      when 3 then thirdmdr_s9 = ptmr5
      when 4 then thirdmdr_s9 = ptmr4
      when 5 then thirdmdr_s9 = ptmr3
      when 6 then thirdmdr_s9 = ptmr2
      when 7 then thirdmdr_s9 = ptmr1
      when 8 then thirdmdr_s9 = ''
      when 9..100 then thirdmdr_s9 = rtmr9
    end

    #thirdmdr_s10
    case num_thirdmd
      when 0 then thirdmdr_s10 = ptmr10     
      when 1 then thirdmdr_s10 = ptmr8
      when 2 then thirdmdr_s10 = ptmr7
      when 3 then thirdmdr_s10 = ptmr6
      when 4 then thirdmdr_s10 = ptmr5
      when 5 then thirdmdr_s10 = ptmr4
      when 6 then thirdmdr_s10 = ptmr3
      when 7 then thirdmdr_s10 = ptmr2
      when 8 then thirdmdr_s10 = ptmr1
      when 9 then thirdmdr_s10 = ''
      when 10..100 then thirdmdr_s10 = rtmr10
    end

    #thirdmdr_s11
    case num_thirdmd
      when 0 then thirdmdr_s11 = ptmr11     
      when 1 then thirdmdr_s11 = ptmr9
      when 2 then thirdmdr_s11 = ptmr8
      when 3 then thirdmdr_s11 = ptmr7
      when 4 then thirdmdr_s11 = ptmr6
      when 5 then thirdmdr_s11 = ptmr5
      when 6 then thirdmdr_s11 = ptmr4
      when 7 then thirdmdr_s11 = ptmr3
      when 8 then thirdmdr_s11 = ptmr2
      when 9 then thirdmdr_s11 = ptmr1
      when 10..100 then thirdmdr_s11 = rtmr11
    end
    #----------End 3rd & Medium----------

    #----------2nd & Short----------
    secondShorts = event.plays.where('situation5 = ?', true)
     
    runSecondShorts = secondShorts.where('play_type = ?', 'Run')
    runSecondShortsLeft = runSecondShorts.where('hash_mark = ?', 'Left')
    runSecondShortsRight = runSecondShorts.where('hash_mark = ?', 'Right')
     
    passSecondShorts = secondShorts.where('play_type = ?', 'Pass')
    passSecondShortsLeft = passSecondShorts.where('hash_mark = ?', 'Left')
    passSecondShortsRight = passSecondShorts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runSecondShortsLeft[0].nil?  
      rssl1 = runSecondShortsLeft[0].fullname 
    end
    unless runSecondShortsLeft[1].nil?  
      rssl2 = runSecondShortsLeft[1].fullname 
    end
    unless runSecondShortsLeft[2].nil?  
      rssl3 = runSecondShortsLeft[2].fullname 
    end
    unless runSecondShortsLeft[3].nil?  
      rssl4 = runSecondShortsLeft[3].fullname 
    end
    unless runSecondShortsLeft[4].nil?  
      rssl5 = runSecondShortsLeft[4].fullname
    end
    unless runSecondShortsLeft[5].nil?  
      rssl6 = runSecondShortsLeft[5].fullname 
    end
    unless runSecondShortsLeft[6].nil?  
      rssl7 = runSecondShortsLeft[6].fullname 
    end
    unless runSecondShortsLeft[7].nil?  
      rssl8 = runSecondShortsLeft[7].fullname 
    end
    unless runSecondShortsLeft[8].nil?  
      rssl9 = runSecondShortsLeft[8].fullname 
    end
    unless runSecondShortsLeft[9].nil?  
      rssl10 = runSecondShortsLeft[9].fullname
    end
    unless runSecondShortsLeft[10].nil?  
      rssl11 = runSecondShortsLeft[10].fullname
    end

    #Run Right Hash
    unless runSecondShortsRight[0].nil?  
      rssr1 = runSecondShortsRight[0].fullname 
    end
    unless runSecondShortsRight[1].nil?  
      rssr2 = runSecondShortsRight[1].fullname 
    end
    unless runSecondShortsRight[2].nil?  
      rssr3 = runSecondShortsRight[2].fullname 
    end
    unless runSecondShortsRight[3].nil?  
      rssr4 = runSecondShortsRight[3].fullname 
    end
    unless runSecondShortsRight[4].nil?  
      rssr5 = runSecondShortsRight[4].fullname
    end
    unless runSecondShortsRight[5].nil?  
      rssr6 = runSecondShortsRight[5].fullname 
    end
    unless runSecondShortsRight[6].nil?  
      rssr7 = runSecondShortsRight[6].fullname 
    end
    unless runSecondShortsRight[7].nil?  
      rssr8 = runSecondShortsRight[7].fullname 
    end
    unless runSecondShortsRight[8].nil?  
      rssr9 = runSecondShortsRight[8].fullname 
    end
    unless runSecondShortsRight[9].nil?  
      rssr10 = runSecondShortsRight[9].fullname
    end
    unless runSecondShortsRight[10].nil?  
      rssr11 = runSecondShortsRight[10].fullname
    end

    #Pass Left Hash
    unless passSecondShortsLeft[0].nil?  
      pssl1 = passSecondShortsLeft[0].fullname 
    end
    unless passSecondShortsLeft[1].nil?  
      pssl2 = passSecondShortsLeft[1].fullname 
    end
    unless passSecondShortsLeft[2].nil?  
      pssl3 = passSecondShortsLeft[2].fullname 
    end
    unless passSecondShortsLeft[3].nil?  
      pssl4 = passSecondShortsLeft[3].fullname 
    end
    unless passSecondShortsLeft[4].nil?  
      pssl5 = passSecondShortsLeft[4].fullname
    end
    unless passSecondShortsLeft[5].nil?  
      pssl6 = passSecondShortsLeft[5].fullname 
    end
    unless passSecondShortsLeft[6].nil?  
      pssl7 = passSecondShortsLeft[6].fullname 
    end
    unless passSecondShortsLeft[7].nil?  
      pssl8 = passSecondShortsLeft[7].fullname 
    end
    unless passSecondShortsLeft[8].nil?  
      pssl9 = passSecondShortsLeft[8].fullname 
    end
    unless passSecondShortsLeft[9].nil?  
      pssl10 = passSecondShortsLeft[9].fullname
    end
    unless passSecondShortsLeft[10].nil?  
      pssl11 = passSecondShortsLeft[10].fullname
    end

    #Pass Right Hash
    unless passSecondShortsRight[0].nil?  
      pssr1 = passSecondShortsRight[0].fullname 
    end
    unless passSecondShortsRight[1].nil?  
      pssr2 = passSecondShortsRight[1].fullname 
    end
    unless passSecondShortsRight[2].nil?  
      pssr3 = passSecondShortsRight[2].fullname 
    end
    unless passSecondShortsRight[3].nil?  
      pssr4 = passSecondShortsRight[3].fullname 
    end
    unless passSecondShortsRight[4].nil?  
      pssr5 = passSecondShortsRight[4].fullname
    end
    unless passSecondShortsRight[5].nil?  
      pssr6 = passSecondShortsRight[5].fullname 
    end
    unless passSecondShortsRight[6].nil?  
      pssr7 = passSecondShortsRight[6].fullname 
    end
    unless passSecondShortsRight[7].nil?  
      pssr8 = passSecondShortsRight[7].fullname 
    end
    unless passSecondShortsRight[8].nil?  
      pssr9 = passSecondShortsRight[8].fullname 
    end
    unless passSecondShortsRight[9].nil?  
      pssr10 = passSecondShortsRight[9].fullname
    end
    unless passSecondShortsRight[10].nil?  
      pssr11 = passSecondShortsRight[10].fullname
    end

    #Number of user's run plays in situation 5
    num_secondst = self.user.s_name5_num_run

    #Left Hash
    # secondstl_s0 
    if num_secondst > 0
      secondstl_s0 = self.user.s_name5 + ' - Run'
    else
      secondstl_s0 = self.user.s_name5 + ' - Pass'
    end

    #secondstl_s1 
    if num_secondst > 0
      secondstl_s1 = rssl1
    else
      secondstl_s1 = pssl1
    end

    #secondstl_s2
    if num_secondst == 0
      secondstl_s2 = pssl2
    elsif num_secondst == 1
      secondstl_s2 = self.user.s_name5 + ' - Pass'
    else num_secondst > 1
      secondstl_s2 = rssl2
    end

    #secondstl_s3
    case num_secondst
      when 0 then secondstl_s3 = pssl3       
      when 1 then secondstl_s3 = pssl1
      when 2 then secondstl_s3 = self.user.s_name5 + ' - Pass'
      when 3..100 then secondstl_s3 = rssl3
    end

    #secondstl_s4
    case num_secondst
      when 0 then secondstl_s4 = pssl4       
      when 1 then secondstl_s4 = pssl2
      when 2 then secondstl_s4 = pssl1
      when 3 then secondstl_s4 = self.user.s_name5 + ' - Pass'
      when 4..100 then secondstl_s4 = rssl4
    end

    #secondstl_s5
    case num_secondst
      when 0 then secondstl_s5 = pssl5       
      when 1 then secondstl_s5 = pssl3
      when 2 then secondstl_s5 = pssl2
      when 3 then secondstl_s5 = pssl1
      when 4 then secondstl_s5 = self.user.s_name5 + ' - Pass'
      when 5..100 then secondstl_s5 = rssl5
    end

    #secondstl_s6
    case num_secondst
      when 0 then secondstl_s6 = pssl6      
      when 1 then secondstl_s6 = pssl4
      when 2 then secondstl_s6 = pssl3
      when 3 then secondstl_s6 = pssl2
      when 4 then secondstl_s6 = pssl1
      when 5 then secondstl_s6 = self.user.s_name5 + ' - Pass'
      when 6..100 then secondstl_s6 = rssl6
    end

    #secondstl_s7
    case num_secondst
      when 0 then secondstl_s7 = pssl7      
      when 1 then secondstl_s7 = pssl5
      when 2 then secondstl_s7 = pssl4
      when 3 then secondstl_s7 = pssl3
      when 4 then secondstl_s7 = pssl2
      when 5 then secondstl_s7 = pssl1
      when 6 then secondstl_s7 = self.user.s_name5 + ' - Pass'
      when 7..100 then secondstl_s7 = rssl7
    end

    #secondstl_s8
    case num_secondst
      when 0 then secondstl_s8 = pssl8      
      when 1 then secondstl_s8 = pssl6
      when 2 then secondstl_s8 = pssl5
      when 3 then secondstl_s8 = pssl4
      when 4 then secondstl_s8 = pssl3
      when 5 then secondstl_s8 = pssl2
      when 6 then secondstl_s8 = pssl1
      when 7 then secondstl_s8 = self.user.s_name5 + ' - Pass'
      when 8..100 then secondstl_s8 = rssl8
    end

    #secondstl_s9
    case num_secondst
      when 0 then secondstl_s9 = pssl9      
      when 1 then secondstl_s9 = pssl7
      when 2 then secondstl_s9 = pssl6
      when 3 then secondstl_s9 = pssl5
      when 4 then secondstl_s9 = pssl4
      when 5 then secondstl_s9 = pssl3
      when 6 then secondstl_s9 = pssl2
      when 7 then secondstl_s9 = pssl1
      when 8 then secondstl_s9 = self.user.s_name5 + ' - Pass'
      when 9..100 then secondstl_s9 = rssl9
    end

    #secondstl_s10
    case num_secondst
      when 0 then secondstl_s10 = pssl10     
      when 1 then secondstl_s10 = pssl8
      when 2 then secondstl_s10 = pssl7
      when 3 then secondstl_s10 = pssl6
      when 4 then secondstl_s10 = pssl5
      when 5 then secondstl_s10 = pssl4
      when 6 then secondstl_s10 = pssl3
      when 7 then secondstl_s10 = pssl2
      when 8 then secondstl_s10 = pssl1
      when 9 then secondstl_s10 = self.user.s_name5 + ' - Pass'
      when 10..100 then secondstl_s10 = rssl10
    end

    #secondstl_s11
    case num_secondst
      when 0 then secondstl_s11 = pssl11     
      when 1 then secondstl_s11 = pssl9
      when 2 then secondstl_s11 = pssl8
      when 3 then secondstl_s11 = pssl7
      when 4 then secondstl_s11 = pssl6
      when 5 then secondstl_s11 = pssl5
      when 6 then secondstl_s11 = pssl4
      when 7 then secondstl_s11 = pssl3
      when 8 then secondstl_s11 = pssl2
      when 9 then secondstl_s11 = pssl1
      when 10..100 then secondstl_s11 = rssl11
    end
  
    #Right Hash
    # secondstr_s0 would always be blank

    #secondstr_s1 
    if num_secondst > 0
      secondstr_s1 = rssr1
    else
      secondstr_s1 = pssr1
    end

    #secondstr_s2
    if num_secondst == 0
      secondstr_s2 = pssr2
    elsif num_secondst == 1
      secondstr_s2 = ''
    else num_secondst > 1
      secondstr_s2 = rssr2
    end

    #secondstr_s3
    case num_secondst
      when 0 then secondstr_s3 = pssr3       
      when 1 then secondstr_s3 = pssr1
      when 2 then secondstr_s3 = ''
      when 3..100 then secondstr_s3 = rssr3
    end

    #secondstr_s4
    case num_secondst
      when 0 then secondstr_s4 = pssr4       
      when 1 then secondstr_s4 = pssr2
      when 2 then secondstr_s4 = pssr1
      when 3 then ''
      when 4..100 then secondstr_s4 = rssr4
    end

    #secondstr_s5
    case num_secondst
      when 0 then secondstr_s5 = pssr5       
      when 1 then secondstr_s5 = pssr3
      when 2 then secondstr_s5 = pssr2
      when 3 then secondstr_s5 = pssr1
      when 4 then secondstr_s5 = ''
      when 5..100 then secondstr_s5 = rssr5
    end

    #secondstr_s6
    case num_secondst
      when 0 then secondstr_s6 = pssr6      
      when 1 then secondstr_s6 = pssr4
      when 2 then secondstr_s6 = pssr3
      when 3 then secondstr_s6 = pssr2
      when 4 then secondstr_s6 = pssr1
      when 5 then secondstr_s6 = ''
      when 6..100 then secondstr_s6 = rssr6
    end

    #secondstr_s7
    case num_secondst
      when 0 then secondstr_s7 = pssr7      
      when 1 then secondstr_s7 = pssr5
      when 2 then secondstr_s7 = pssr4
      when 3 then secondstr_s7 = pssr3
      when 4 then secondstr_s7 = pssr2
      when 5 then secondstr_s7 = pssr1
      when 6 then secondstr_s7 = ''
      when 7..100 then secondstr_s7 = rssr7
    end

    #secondstr_s8
    case num_secondst
      when 0 then secondstr_s8 = pssr8      
      when 1 then secondstr_s8 = pssr6
      when 2 then secondstr_s8 = pssr5
      when 3 then secondstr_s8 = pssr4
      when 4 then secondstr_s8 = pssr3
      when 5 then secondstr_s8 = pssr2
      when 6 then secondstr_s8 = pssr1
      when 7 then secondstr_s8 = ''
      when 8..100 then secondstr_s8 = rssr8
    end

    #secondstr_s9
    case num_secondst
      when 0 then secondstr_s9 = pssr9      
      when 1 then secondstr_s9 = pssr7
      when 2 then secondstr_s9 = pssr6
      when 3 then secondstr_s9 = pssr5
      when 4 then secondstr_s9 = pssr4
      when 5 then secondstr_s9 = pssr3
      when 6 then secondstr_s9 = pssr2
      when 7 then secondstr_s9 = pssr1
      when 8 then secondstr_s9 = ''
      when 9..100 then secondstr_s9 = rssr9
    end

    #secondstr_s10
    case num_secondst
      when 0 then secondstr_s10 = pssr10     
      when 1 then secondstr_s10 = pssr8
      when 2 then secondstr_s10 = pssr7
      when 3 then secondstr_s10 = pssr6
      when 4 then secondstr_s10 = pssr5
      when 5 then secondstr_s10 = pssr4
      when 6 then secondstr_s10 = pssr3
      when 7 then secondstr_s10 = pssr2
      when 8 then secondstr_s10 = pssr1
      when 9 then secondstr_s10 = ''
      when 10..100 then secondstr_s10 = rssr10
    end

    #secondstr_s11
    case num_secondst
      when 0 then secondstr_s11 = pssr11     
      when 1 then secondstr_s11 = pssr9
      when 2 then secondstr_s11 = pssr8
      when 3 then secondstr_s11 = pssr7
      when 4 then secondstr_s11 = pssr6
      when 5 then secondstr_s11 = pssr5
      when 6 then secondstr_s11 = pssr4
      when 7 then secondstr_s11 = pssr3
      when 8 then secondstr_s11 = pssr2
      when 9 then secondstr_s11 = pssr1
      when 10..100 then secondstr_s11 = rssr11
    end    
    #----------End 2nd & Short----------

    #----------3rd & Short----------
    thirdShorts = event.plays.where('situation8 = ?', true)
     
    runThirdShorts = thirdShorts.where('play_type = ?', 'Run')
    runThirdShortsLeft = runThirdShorts.where('hash_mark = ?', 'Left')
    runThirdShortsRight = runThirdShorts.where('hash_mark = ?', 'Right')
     
    passThirdShorts = thirdShorts.where('play_type = ?', 'Pass')
    passThirdShortsLeft = passThirdShorts.where('hash_mark = ?', 'Left')
    passThirdShortsRight = passThirdShorts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runThirdShortsLeft[0].nil?  
      rtsl1 = runThirdShortsLeft[0].fullname 
    end
    unless runThirdShortsLeft[1].nil?  
      rtsl2 = runThirdShortsLeft[1].fullname 
    end
    unless runThirdShortsLeft[2].nil?  
      rtsl3 = runThirdShortsLeft[2].fullname 
    end
    unless runThirdShortsLeft[3].nil?  
      rtsl4 = runThirdShortsLeft[3].fullname 
    end
    unless runThirdShortsLeft[4].nil?  
      rtsl5 = runThirdShortsLeft[4].fullname
    end
    unless runThirdShortsLeft[5].nil?  
      rtsl6 = runThirdShortsLeft[5].fullname 
    end
    unless runThirdShortsLeft[6].nil?  
      rtsl7 = runThirdShortsLeft[6].fullname
    end    
    unless runThirdShortsLeft[7].nil?  
      rtsl8 = runThirdShortsLeft[7].fullname 
    end
    unless runThirdShortsLeft[8].nil?  
      rtsl9 = runThirdShortsLeft[8].fullname 
    end
    unless runThirdShortsLeft[9].nil?  
      rtsl10 = runThirdShortsLeft[9].fullname 
    end
    unless runThirdShortsLeft[10].nil?  
      rtsl11 = runThirdShortsLeft[10].fullname 
    end

    #Run Right Hash
    unless runThirdShortsRight[0].nil?  
      rtsr1 = runThirdShortsRight[0].fullname 
    end
    unless runThirdShortsRight[1].nil?  
      rtsr2 = runThirdShortsRight[1].fullname 
    end
    unless runThirdShortsRight[2].nil?  
      rtsr3 = runThirdShortsRight[2].fullname 
    end
    unless runThirdShortsRight[3].nil?  
      rtsr4 = runThirdShortsRight[3].fullname 
    end
    unless runThirdShortsRight[4].nil?  
      rtsr5 = runThirdShortsRight[4].fullname
    end
    unless runThirdShortsRight[5].nil?  
      rtsr6 = runThirdShortsRight[5].fullname 
    end
    unless runThirdShortsRight[6].nil?  
      rtsr7 = runThirdShortsRight[6].fullname
    end    
    unless runThirdShortsRight[7].nil?  
      rtsr8 = runThirdShortsRight[7].fullname 
    end
    unless runThirdShortsRight[8].nil?  
      rtsr9 = runThirdShortsRight[8].fullname
    end
    unless runThirdShortsRight[9].nil?  
      rtsr10 = runThirdShortsRight[9].fullname 
    end
    unless runThirdShortsRight[10].nil?  
      rtsr11 = runThirdShortsRight[10].fullname
    end 

    #Pass Left Hash
    unless passThirdShortsLeft[0].nil?  
      ptsl1 = passThirdShortsLeft[0].fullname 
    end
    unless passThirdShortsLeft[1].nil?  
      ptsl2 = passThirdShortsLeft[1].fullname 
    end
    unless passThirdShortsLeft[2].nil?  
      ptsl3 = passThirdShortsLeft[2].fullname 
    end
    unless passThirdShortsLeft[3].nil?  
      ptsl4 = passThirdShortsLeft[3].fullname 
    end
    unless passThirdShortsLeft[4].nil?  
      ptsl5 = passThirdShortsLeft[4].fullname 
    end
    unless passThirdShortsLeft[5].nil?  
      ptsl6 = passThirdShortsLeft[5].fullname 
    end
    unless passThirdShortsLeft[6].nil?  
      ptsl7 = passThirdShortsLeft[6].fullname 
    end
    unless passThirdShortsLeft[7].nil?  
      ptsl8 = passThirdShortsLeft[7].fullname 
    end
    unless passThirdShortsLeft[8].nil?  
      ptsl9 = passThirdShortsLeft[8].fullname 
    end
    unless passThirdShortsLeft[9].nil?  
      ptsl10 = passThirdShortsLeft[9].fullname 
    end
    unless passThirdShortsLeft[10].nil?  
      ptsl11 = passThirdShortsLeft[10].fullname 
    end

    #Pass Right Hash
    unless passThirdShortsRight[0].nil?  
      ptsr1 = passThirdShortsRight[0].fullname 
    end
    unless passThirdShortsRight[1].nil?  
      ptsr2 = passThirdShortsRight[1].fullname 
    end
    unless passThirdShortsRight[2].nil?  
      ptsr3 = passThirdShortsRight[2].fullname 
    end
    unless passThirdShortsRight[3].nil?  
      ptsr4 = passThirdShortsRight[3].fullname 
    end
    unless passThirdShortsRight[4].nil?  
      ptsr5 = passThirdShortsRight[4].fullname 
    end
    unless passThirdShortsRight[5].nil?  
      ptsr6 = passThirdShortsRight[5].fullname 
    end
    unless passThirdShortsRight[6].nil?  
      ptsr7 = passThirdShortsRight[6].fullname 
    end
    unless passThirdShortsRight[7].nil?  
      ptsr8 = passThirdShortsRight[7].fullname 
    end
    unless passThirdShortsRight[8].nil?  
      ptsr9 = passThirdShortsRight[8].fullname 
    end
    unless passThirdShortsRight[9].nil?  
      ptsr10 = passThirdShortsRight[9].fullname 
    end
    unless passThirdShortsRight[10].nil?  
      ptsr11 = passThirdShortsRight[10].fullname 
    end

    #Number of user's run plays in situation 8
    num_thirdst = self.user.s_name8_num_run

    #Left Hash
    # thirdstl_s0 
    if num_thirdst > 0
      thirdstl_s0 = self.user.s_name8 + ' - Run'
    else
      thirdstl_s0 = self.user.s_name8 + ' - Pass'
    end

    #thirdstl_s1 
    if num_thirdst > 0
      thirdstl_s1 = rtsl1
    else
      thirdstl_s1 = ptsl1
    end

    #thirdstl_s2
    if num_thirdst == 0
      thirdstl_s2 = ptsl2
    elsif num_thirdst == 1
      thirdstl_s2 = self.user.s_name8 + ' - Pass'
    else num_thirdst > 1
      thirdstl_s2 = rtsl2
    end

    #thirdstl_s3
    case num_thirdst
      when 0 then thirdstl_s3 = ptsl3       
      when 1 then thirdstl_s3 = ptsl1
      when 2 then thirdstl_s3 = self.user.s_name8 + ' - Pass'
      when 3..100 then thirdstl_s3 = rtsl3
    end

    #thirdstl_s4
    case num_thirdst
      when 0 then thirdstl_s4 = ptsl4       
      when 1 then thirdstl_s4 = ptsl2
      when 2 then thirdstl_s4 = ptsl1
      when 3 then thirdstl_s4 = self.user.s_name8 + ' - Pass'
      when 4..100 then thirdstl_s4 = rtsl4
    end

    #thirdstl_s5
    case num_thirdst
      when 0 then thirdstl_s5 = ptsl5       
      when 1 then thirdstl_s5 = ptsl3
      when 2 then thirdstl_s5 = ptsl2
      when 3 then thirdstl_s5 = ptsl1
      when 4 then thirdstl_s5 = self.user.s_name8 + ' - Pass'
      when 5..100 then thirdstl_s5 = rtsl5
    end

    #thirdstl_s6
    case num_thirdst
      when 0 then thirdstl_s6 = ptsl6      
      when 1 then thirdstl_s6 = ptsl4
      when 2 then thirdstl_s6 = ptsl3
      when 3 then thirdstl_s6 = ptsl2
      when 4 then thirdstl_s6 = ptsl1
      when 5 then thirdstl_s6 = self.user.s_name8 + ' - Pass'
      when 6..100 then thirdstl_s6 = rtsl6
    end

    #thirdstl_s7
    case num_thirdst
      when 0 then thirdstl_s7 = ptsl7      
      when 1 then thirdstl_s7 = ptsl5
      when 2 then thirdstl_s7 = ptsl4
      when 3 then thirdstl_s7 = ptsl3
      when 4 then thirdstl_s7 = ptsl2
      when 5 then thirdstl_s7 = ptsl1
      when 6 then thirdstl_s7 = self.user.s_name8 + ' - Pass'
      when 7..100 then thirdstl_s7 = rtsl7
    end

    #thirdstl_s8
    case num_thirdst
      when 0 then thirdstl_s8 = ptsl8      
      when 1 then thirdstl_s8 = ptsl6
      when 2 then thirdstl_s8 = ptsl5
      when 3 then thirdstl_s8 = ptsl4
      when 4 then thirdstl_s8 = ptsl3
      when 5 then thirdstl_s8 = ptsl2
      when 6 then thirdstl_s8 = ptsl1
      when 7 then thirdstl_s8 = self.user.s_name8 + ' - Pass'
      when 8..100 then thirdstl_s8 = rtsl8
    end

    #thirdstl_s9
    case num_thirdst
      when 0 then thirdstl_s9 = ptsl9      
      when 1 then thirdstl_s9 = ptsl7
      when 2 then thirdstl_s9 = ptsl6
      when 3 then thirdstl_s9 = ptsl5
      when 4 then thirdstl_s9 = ptsl4
      when 5 then thirdstl_s9 = ptsl3
      when 6 then thirdstl_s9 = ptsl2
      when 7 then thirdstl_s9 = ptsl1
      when 8 then thirdstl_s9 = self.user.s_name8 + ' - Pass'
      when 9..100 then thirdstl_s9 = rtsl9
    end

    #thirdstl_s10
    case num_thirdst
      when 0 then thirdstl_s10 = ptsl10     
      when 1 then thirdstl_s10 = ptsl8
      when 2 then thirdstl_s10 = ptsl7
      when 3 then thirdstl_s10 = ptsl6
      when 4 then thirdstl_s10 = ptsl5
      when 5 then thirdstl_s10 = ptsl4
      when 6 then thirdstl_s10 = ptsl3
      when 7 then thirdstl_s10 = ptsl2
      when 8 then thirdstl_s10 = ptsl1
      when 9 then thirdstl_s10 = self.user.s_name8 + ' - Pass'
      when 10..100 then thirdstl_s10 = rtsl10
    end

    #thirdstl_s11
    case num_thirdst
      when 0 then thirdstl_s11 = ptsl11     
      when 1 then thirdstl_s11 = ptsl9
      when 2 then thirdstl_s11 = ptsl8
      when 3 then thirdstl_s11 = ptsl7
      when 4 then thirdstl_s11 = ptsl6
      when 5 then thirdstl_s11 = ptsl5
      when 6 then thirdstl_s11 = ptsl4
      when 7 then thirdstl_s11 = ptsl3
      when 8 then thirdstl_s11 = ptsl2
      when 9 then thirdstl_s11 = ptsl1
      when 10..100 then thirdstl_s11 = rtsl11
    end
  
    #Right Hash
    # thirdstr_s0 would always be blank

    #thirdstr_s1 
    if num_thirdst > 0
      thirdstr_s1 = rtsr1
    else
      thirdstr_s1 = ptsr1
    end

    #thirdstr_s2
    if num_thirdst == 0
      thirdstr_s2 = ptsr2
    elsif num_thirdst == 1
      thirdstr_s2 = ''
    else num_thirdst > 1
      thirdstr_s2 = rtsr2
    end

    #thirdstr_s3
    case num_thirdst
      when 0 then thirdstr_s3 = ptsr3       
      when 1 then thirdstr_s3 = ptsr1
      when 2 then thirdstr_s3 = ''
      when 3..100 then thirdstr_s3 = rtsr3
    end

    #thirdstr_s4
    case num_thirdst
      when 0 then thirdstr_s4 = ptsr4       
      when 1 then thirdstr_s4 = ptsr2
      when 2 then thirdstr_s4 = ptsr1
      when 3 then ''
      when 4..100 then thirdstr_s4 = rtsr4
    end

    #thirdstr_s5
    case num_thirdst
      when 0 then thirdstr_s5 = ptsr5       
      when 1 then thirdstr_s5 = ptsr3
      when 2 then thirdstr_s5 = ptsr2
      when 3 then thirdstr_s5 = ptsr1
      when 4 then thirdstr_s5 = ''
      when 5..100 then thirdstr_s5 = rtsr5
    end

    #thirdstr_s6
    case num_thirdst
      when 0 then thirdstr_s6 = ptsr6      
      when 1 then thirdstr_s6 = ptsr4
      when 2 then thirdstr_s6 = ptsr3
      when 3 then thirdstr_s6 = ptsr2
      when 4 then thirdstr_s6 = ptsr1
      when 5 then thirdstr_s6 = ''
      when 6..100 then thirdstr_s6 = rtsr6
    end

    #thirdstr_s7
    case num_thirdst
      when 0 then thirdstr_s7 = ptsr7      
      when 1 then thirdstr_s7 = ptsr5
      when 2 then thirdstr_s7 = ptsr4
      when 3 then thirdstr_s7 = ptsr3
      when 4 then thirdstr_s7 = ptsr2
      when 5 then thirdstr_s7 = ptsr1
      when 6 then thirdstr_s7 = ''
      when 7..100 then thirdstr_s7 = rtsr7
    end

    #thirdstr_s8
    case num_thirdst
      when 0 then thirdstr_s8 = ptsr8      
      when 1 then thirdstr_s8 = ptsr6
      when 2 then thirdstr_s8 = ptsr5
      when 3 then thirdstr_s8 = ptsr4
      when 4 then thirdstr_s8 = ptsr3
      when 5 then thirdstr_s8 = ptsr2
      when 6 then thirdstr_s8 = ptsr1
      when 7 then thirdstr_s8 = ''
      when 8..100 then thirdstr_s8 = rtsr8
    end

    #thirdstr_s9
    case num_thirdst
      when 0 then thirdstr_s9 = ptsr9      
      when 1 then thirdstr_s9 = ptsr7
      when 2 then thirdstr_s9 = ptsr6
      when 3 then thirdstr_s9 = ptsr5
      when 4 then thirdstr_s9 = ptsr4
      when 5 then thirdstr_s9 = ptsr3
      when 6 then thirdstr_s9 = ptsr2
      when 7 then thirdstr_s9 = ptsr1
      when 8 then thirdstr_s9 = ''
      when 9..100 then thirdstr_s9 = rtsr9
    end

    #thirdstr_s10
    case num_thirdst
      when 0 then thirdstr_s10 = ptsr10     
      when 1 then thirdstr_s10 = ptsr8
      when 2 then thirdstr_s10 = ptsr7
      when 3 then thirdstr_s10 = ptsr6
      when 4 then thirdstr_s10 = ptsr5
      when 5 then thirdstr_s10 = ptsr4
      when 6 then thirdstr_s10 = ptsr3
      when 7 then thirdstr_s10 = ptsr2
      when 8 then thirdstr_s10 = ptsr1
      when 9 then thirdstr_s10 = ''
      when 10..100 then thirdstr_s10 = rtsr10
    end

    #thirdstr_s11
    case num_thirdst
      when 0 then thirdstr_s11 = ptsr11     
      when 1 then thirdstr_s11 = ptsr9
      when 2 then thirdstr_s11 = ptsr8
      when 3 then thirdstr_s11 = ptsr7
      when 4 then thirdstr_s11 = ptsr6
      when 5 then thirdstr_s11 = ptsr5
      when 6 then thirdstr_s11 = ptsr4
      when 7 then thirdstr_s11 = ptsr3
      when 8 then thirdstr_s11 = ptsr2
      when 9 then thirdstr_s11 = ptsr1
      when 10..100 then thirdstr_s11 = rtsr11
    end      
    #----------End 3rd & Short----------    

    #----------Redzone----------
    redzones = event.plays.where('situation9 = ?', true)
     
    runredzones = redzones.where('play_type = ?', 'Run')
    runredzonesLeft = runredzones.where('hash_mark = ?', 'Left')
    runredzonesRight = runredzones.where('hash_mark = ?', 'Right')
     
    passredzones = redzones.where('play_type = ?', 'Pass')
    passredzonesLeft = passredzones.where('hash_mark = ?', 'Left')
    passredzonesRight = passredzones.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runredzonesLeft[0].nil?  
      rrzl1 = runredzonesLeft[0].fullname 
    end
    unless runredzonesLeft[1].nil?  
      rrzl2 = runredzonesLeft[1].fullname 
    end
    unless runredzonesLeft[2].nil?  
      rrzl3 = runredzonesLeft[2].fullname 
    end
    unless runredzonesLeft[3].nil?  
      rrzl4 = runredzonesLeft[3].fullname 
    end
    unless runredzonesLeft[4].nil?  
      rrzl5 = runredzonesLeft[4].fullname
    end
    unless runredzonesLeft[5].nil?  
      rrzl6 = runredzonesLeft[5].fullname 
    end
    unless runredzonesLeft[6].nil?  
      rrzl7 = runredzonesLeft[6].fullname
    end    
    unless runredzonesLeft[7].nil?  
      rrzl8 = runredzonesLeft[7].fullname 
    end
    unless runredzonesLeft[8].nil?  
      rrzl9 = runredzonesLeft[8].fullname 
    end
    unless runredzonesLeft[9].nil?  
      rrzl10 = runredzonesLeft[9].fullname 
    end
    unless runredzonesLeft[10].nil?  
      rrzl11 = runredzonesLeft[10].fullname 
    end
    unless runredzonesLeft[11].nil?  
      rrzl12 = runredzonesLeft[11].fullname
    end
    unless runredzonesLeft[12].nil?  
      rrzl13 = runredzonesLeft[12].fullname 
    end
    unless runredzonesLeft[13].nil?  
      rrzl14 = runredzonesLeft[13].fullname
    end 
    unless runredzonesLeft[14].nil?  
      rrzl15 = runredzonesLeft[14].fullname
    end 

    #Run Right Hash
    unless runredzonesRight[0].nil?  
      rrzr1 = runredzonesRight[0].fullname 
    end
    unless runredzonesRight[1].nil?  
      rrzr2 = runredzonesRight[1].fullname 
    end
    unless runredzonesRight[2].nil?  
      rrzr3 = runredzonesRight[2].fullname 
    end
    unless runredzonesRight[3].nil?  
      rrzr4 = runredzonesRight[3].fullname 
    end
    unless runredzonesRight[4].nil?  
      rrzr5 = runredzonesRight[4].fullname
    end
    unless runredzonesRight[5].nil?  
      rrzr6 = runredzonesRight[5].fullname 
    end
    unless runredzonesRight[6].nil?  
      rrzr7 = runredzonesRight[6].fullname
    end    
    unless runredzonesRight[7].nil?  
      rrzr8 = runredzonesRight[7].fullname 
    end
    unless runredzonesRight[8].nil?  
      rrzr9 = runredzonesRight[8].fullname 
    end
    unless runredzonesRight[9].nil?  
      rrzr10 = runredzonesRight[9].fullname 
    end
    unless runredzonesRight[10].nil?  
      rrzr11 = runredzonesRight[10].fullname 
    end
    unless runredzonesRight[11].nil?  
      rrzr12 = runredzonesRight[11].fullname
    end
    unless runredzonesRight[12].nil?  
      rrzr13 = runredzonesRight[12].fullname 
    end
    unless runredzonesRight[13].nil?  
      rrzr14 = runredzonesRight[13].fullname
    end 
    unless runredzonesRight[14].nil?  
      rrzr15 = runredzonesRight[14].fullname
    end 

    #Pass Left Hash
    unless passredzonesLeft[0].nil?  
      przl1 = passredzonesLeft[0].fullname 
    end
    unless passredzonesLeft[1].nil?  
      przl2 = passredzonesLeft[1].fullname 
    end
    unless passredzonesLeft[2].nil?  
      przl3 = passredzonesLeft[2].fullname 
    end
    unless passredzonesLeft[3].nil?  
      przl4 = passredzonesLeft[3].fullname 
    end
    unless passredzonesLeft[4].nil?  
      przl5 = passredzonesLeft[4].fullname 
    end
    unless passredzonesLeft[5].nil?  
      przl6 = passredzonesLeft[5].fullname 
    end 
    unless passredzonesLeft[6].nil?  
      przl7 = passredzonesLeft[6].fullname 
    end       
    unless passredzonesLeft[7].nil?  
      przl8 = passredzonesLeft[7].fullname 
    end
    unless passredzonesLeft[8].nil?  
      przl9 = passredzonesLeft[8].fullname 
    end
    unless passredzonesLeft[9].nil?  
      przl10 = passredzonesLeft[9].fullname 
    end
    unless passredzonesLeft[10].nil?  
      przl11 = passredzonesLeft[10].fullname 
    end
    unless passredzonesLeft[11].nil?  
      przl12 = passredzonesLeft[11].fullname 
    end
    unless passredzonesLeft[12].nil?  
      przl13 = passredzonesLeft[12].fullname 
    end 
    unless passredzonesLeft[13].nil?  
      przl14 = passredzonesLeft[13].fullname 
    end 
    unless passredzonesLeft[14].nil?  
      przl15 = passredzonesLeft[14].fullname 
    end 

    #Pass Right Hash
    unless passredzonesRight[0].nil?  
      przr1 = passredzonesRight[0].fullname 
    end
    unless passredzonesRight[1].nil?  
      przr2 = passredzonesRight[1].fullname 
    end
    unless passredzonesRight[2].nil?  
      przr3 = passredzonesRight[2].fullname 
    end
    unless passredzonesRight[3].nil?  
      przr4 = passredzonesRight[3].fullname 
    end
    unless passredzonesRight[4].nil?  
      przr5 = passredzonesRight[4].fullname 
    end
    unless passredzonesRight[5].nil?  
      przr6 = passredzonesRight[5].fullname 
    end
    unless passredzonesRight[6].nil?  
      przr7 = passredzonesRight[6].fullname 
    end   
    unless passredzonesRight[7].nil?  
      przr8 = passredzonesRight[7].fullname 
    end
    unless passredzonesRight[8].nil?  
      przr9 = passredzonesRight[8].fullname 
    end
    unless passredzonesRight[9].nil?  
      przr10 = passredzonesRight[9].fullname 
    end
    unless passredzonesRight[10].nil?  
      przr11 = passredzonesRight[10].fullname 
    end
    unless passredzonesRight[11].nil?  
      przr12 = passredzonesRight[11].fullname 
    end
    unless passredzonesRight[12].nil?  
      przr13 = passredzonesRight[12].fullname 
    end
    unless passredzonesRight[13].nil?  
      przr14 = passredzonesRight[13].fullname 
    end     
    unless passredzonesRight[14].nil?  
      przr15 = passredzonesRight[14].fullname 
    end 

    #Number of user's run plays in situation 9
    num_rzoner = self.user.s_name9_num_run

    #Left Hash
    # rzonel_s0 
    if num_rzoner > 0
      rzonel_s0 = self.user.s_name9 + ' - Run'
    else
      rzonel_s0 = self.user.s_name9 + ' - Pass'
    end

    #rzonel_s1 
    if num_rzoner > 0
      rzonel_s1 = rrzl1
    else
      rzonel_s1 = przl1
    end

    #rzonel_s2
    if num_rzoner == 0
      rzonel_s2 = przl2
    elsif num_rzoner == 1
      rzonel_s2 = self.user.s_name9 + ' - Pass'
    else num_rzoner > 1
      rzonel_s2 = rrzl2
    end

    #rzonel_s3
    case num_rzoner
      when 0 then rzonel_s3 = przl3       
      when 1 then rzonel_s3 = przl1
      when 2 then rzonel_s3 = self.user.s_name9 + ' - Pass'
      when 3..100 then rzonel_s3 = rrzl3
    end

    #rzonel_s4
    case num_rzoner
      when 0 then rzonel_s4 = przl4       
      when 1 then rzonel_s4 = przl2
      when 2 then rzonel_s4 = przl1
      when 3 then rzonel_s4 = self.user.s_name9 + ' - Pass'
      when 4..100 then rzonel_s4 = rrzl4
    end

    #rzonel_s5
    case num_rzoner
      when 0 then rzonel_s5 = przl5       
      when 1 then rzonel_s5 = przl3
      when 2 then rzonel_s5 = przl2
      when 3 then rzonel_s5 = przl1
      when 4 then rzonel_s5 = self.user.s_name9 + ' - Pass'
      when 5..100 then rzonel_s5 = rrzl5
    end

    #rzonel_s6
    case num_rzoner
      when 0 then rzonel_s6 = przl6      
      when 1 then rzonel_s6 = przl4
      when 2 then rzonel_s6 = przl3
      when 3 then rzonel_s6 = przl2
      when 4 then rzonel_s6 = przl1
      when 5 then rzonel_s6 = self.user.s_name9 + ' - Pass'
      when 6..100 then rzonel_s6 = rrzl6
    end

    #rzonel_s7
    case num_rzoner
      when 0 then rzonel_s7 = przl7      
      when 1 then rzonel_s7 = przl5
      when 2 then rzonel_s7 = przl4
      when 3 then rzonel_s7 = przl3
      when 4 then rzonel_s7 = przl2
      when 5 then rzonel_s7 = przl1
      when 6 then rzonel_s7 = self.user.s_name9 + ' - Pass'
      when 7..100 then rzonel_s7 = rrzl7
    end

    #rzonel_s8
    case num_rzoner
      when 0 then rzonel_s8 = przl8      
      when 1 then rzonel_s8 = przl6
      when 2 then rzonel_s8 = przl5
      when 3 then rzonel_s8 = przl4
      when 4 then rzonel_s8 = przl3
      when 5 then rzonel_s8 = przl2
      when 6 then rzonel_s8 = przl1
      when 7 then rzonel_s8 = self.user.s_name9 + ' - Pass'
      when 8..100 then rzonel_s8 = rrzl8
    end

    #rzonel_s9
    case num_rzoner
      when 0 then rzonel_s9 = przl9      
      when 1 then rzonel_s9 = przl7
      when 2 then rzonel_s9 = przl6
      when 3 then rzonel_s9 = przl5
      when 4 then rzonel_s9 = przl4
      when 5 then rzonel_s9 = przl3
      when 6 then rzonel_s9 = przl2
      when 7 then rzonel_s9 = przl1
      when 8 then rzonel_s9 = self.user.s_name9 + ' - Pass'
      when 9..100 then rzonel_s9 = rrzl9
    end

    #rzonel_s10
    case num_rzoner
      when 0 then rzonel_s10 = przl10     
      when 1 then rzonel_s10 = przl8
      when 2 then rzonel_s10 = przl7
      when 3 then rzonel_s10 = przl6
      when 4 then rzonel_s10 = przl5
      when 5 then rzonel_s10 = przl4
      when 6 then rzonel_s10 = przl3
      when 7 then rzonel_s10 = przl2
      when 8 then rzonel_s10 = przl1
      when 9 then rzonel_s10 = self.user.s_name9 + ' - Pass'
      when 10..100 then rzonel_s10 = rrzl10
    end

    #rzonel_s11
    case num_rzoner
      when 0 then rzonel_s11 = przl11     
      when 1 then rzonel_s11 = przl9
      when 2 then rzonel_s11 = przl8
      when 3 then rzonel_s11 = przl7
      when 4 then rzonel_s11 = przl6
      when 5 then rzonel_s11 = przl5
      when 6 then rzonel_s11 = przl4
      when 7 then rzonel_s11 = przl3
      when 8 then rzonel_s11 = przl2
      when 9 then rzonel_s11 = przl1
      when 10 then rzonel_s11 = self.user.s_name9 + ' - Pass'
      when 11..100 then rzonel_s11 = rrzl11
    end

    #rzonel_s12
    case num_rzoner
      when 0 then rzonel_s12 = przl12    
      when 1 then rzonel_s12 = przl10
      when 2 then rzonel_s12 = przl9
      when 3 then rzonel_s12 = przl8
      when 4 then rzonel_s12 = przl7
      when 5 then rzonel_s12 = przl6
      when 6 then rzonel_s12 = przl5
      when 7 then rzonel_s12 = przl4
      when 8 then rzonel_s12 = przl3
      when 9 then rzonel_s12 = przl2
      when 10 then rzonel_s12 = przl1
      when 11 then rzonel_s12 = self.user.s_name9 + ' - Pass'
      when 12..100 then rzonel_s12 = rrzl12
    end

    #rzonel_s13
    case num_rzoner
      when 0 then rzonel_s13 = przl13    
      when 1 then rzonel_s13 = przl11
      when 2 then rzonel_s13 = przl10
      when 3 then rzonel_s13 = przl9
      when 4 then rzonel_s13 = przl8
      when 5 then rzonel_s13 = przl7
      when 6 then rzonel_s13 = przl6
      when 7 then rzonel_s13 = przl5
      when 8 then rzonel_s13 = przl4
      when 9 then rzonel_s13 = przl3
      when 10 then rzonel_s13 = przl2
      when 11 then rzonel_s13 = przl1
      when 12 then rzonel_s13 = self.user.s_name9 + ' - Pass'
      when 13..100 then rzonel_s13 = rrzl13
    end

    #rzonel_s14
    case num_rzoner
      when 0 then rzonel_s14 = przl14    
      when 1 then rzonel_s14 = przl12
      when 2 then rzonel_s14 = przl11
      when 3 then rzonel_s14 = przl10
      when 4 then rzonel_s14 = przl9
      when 5 then rzonel_s14 = przl8
      when 6 then rzonel_s14 = przl7
      when 7 then rzonel_s14 = przl6
      when 8 then rzonel_s14 = przl5
      when 9 then rzonel_s14 = przl4
      when 10 then rzonel_s14 = przl3
      when 11 then rzonel_s14 = przl2
      when 12 then rzonel_s14 = przl1  
      when 13 then rzonel_s14 = self.user.s_name9 + ' - Pass'
      when 14..100 then rzonel_s14 = rrzl14
    end

    #rzonel_s15
    case num_rzoner
      when 0 then rzonel_s15 = przl15    
      when 1 then rzonel_s15 = przl13
      when 2 then rzonel_s15 = przl12
      when 3 then rzonel_s15 = przl11
      when 4 then rzonel_s15 = przl10
      when 5 then rzonel_s15 = przl9
      when 6 then rzonel_s15 = przl8
      when 7 then rzonel_s15 = przl7
      when 8 then rzonel_s15 = przl6
      when 9 then rzonel_s15 = przl5
      when 10 then rzonel_s15 = przl4
      when 11 then rzonel_s15 = przl3
      when 12 then rzonel_s15 = przl2
      when 13 then rzonel_s15 = przl1  
      when 14..100 then rzonel_s15 = rrzl15
    end    


    #Right Hash
    # rzoner_s0 would always be blank

    #rzoner_s1 
    if num_rzoner > 0
      rzoner_s1 = rrzr1
    else
      rzoner_s1 = przr1
    end

    #rzoner_s2
    if num_rzoner == 0
      rzoner_s2 = przr2
    elsif num_rzoner == 1
      rzoner_s2 = ''
    else num_rzoner > 1
      rzoner_s2 = rrzr2
    end

    #rzoner_s3
    case num_rzoner
      when 0 then rzoner_s3 = przr3       
      when 1 then rzoner_s3 = przr1
      when 2 then rzoner_s3 = ''
      when 3..100 then rzoner_s3 = rrzr3
    end

    #rzoner_s4
    case num_rzoner
      when 0 then rzoner_s4 = przr4       
      when 1 then rzoner_s4 = przr2
      when 2 then rzoner_s4 = przr1
      when 3 then ''
      when 4..100 then rzoner_s4 = rrzr4
    end

    #rzoner_s5
    case num_rzoner
      when 0 then rzoner_s5 = przr5       
      when 1 then rzoner_s5 = przr3
      when 2 then rzoner_s5 = przr2
      when 3 then rzoner_s5 = przr1
      when 4 then rzoner_s5 = ''
      when 5..100 then rzoner_s5 = rrzr5
    end

    #rzoner_s6
    case num_rzoner
      when 0 then rzoner_s6 = przr6      
      when 1 then rzoner_s6 = przr4
      when 2 then rzoner_s6 = przr3
      when 3 then rzoner_s6 = przr2
      when 4 then rzoner_s6 = przr1
      when 5 then rzoner_s6 = ''
      when 6..100 then rzoner_s6 = rrzr6
    end

    #rzoner_s7
    case num_rzoner
      when 0 then rzoner_s7 = przr7      
      when 1 then rzoner_s7 = przr5
      when 2 then rzoner_s7 = przr4
      when 3 then rzoner_s7 = przr3
      when 4 then rzoner_s7 = przr2
      when 5 then rzoner_s7 = przr1
      when 6 then rzoner_s7 = ''
      when 7..100 then rzoner_s7 = rrzr7
    end

    #rzoner_s8
    case num_rzoner
      when 0 then rzoner_s8 = przr8      
      when 1 then rzoner_s8 = przr6
      when 2 then rzoner_s8 = przr5
      when 3 then rzoner_s8 = przr4
      when 4 then rzoner_s8 = przr3
      when 5 then rzoner_s8 = przr2
      when 6 then rzoner_s8 = przr1
      when 7 then rzoner_s8 = ''
      when 8..100 then rzoner_s8 = rrzr8
    end

    #rzoner_s9
    case num_rzoner
      when 0 then rzoner_s9 = przr9      
      when 1 then rzoner_s9 = przr7
      when 2 then rzoner_s9 = przr6
      when 3 then rzoner_s9 = przr5
      when 4 then rzoner_s9 = przr4
      when 5 then rzoner_s9 = przr3
      when 6 then rzoner_s9 = przr2
      when 7 then rzoner_s9 = przr1
      when 8 then rzoner_s9 = ''
      when 9..100 then rzoner_s9 = rrzr9
    end

    #rzoner_s10
    case num_rzoner
      when 0 then rzoner_s10 = przr10     
      when 1 then rzoner_s10 = przr8
      when 2 then rzoner_s10 = przr7
      when 3 then rzoner_s10 = przr6
      when 4 then rzoner_s10 = przr5
      when 5 then rzoner_s10 = przr4
      when 6 then rzoner_s10 = przr3
      when 7 then rzoner_s10 = przr2
      when 8 then rzoner_s10 = przr1
      when 9 then rzoner_s10 = ''
      when 10..100 then rzoner_s10 = rrzr10
    end

    #rzoner_s11
    case num_rzoner
      when 0 then rzoner_s11 = przr11     
      when 1 then rzoner_s11 = przr9
      when 2 then rzoner_s11 = przr8
      when 3 then rzoner_s11 = przr7
      when 4 then rzoner_s11 = przr6
      when 5 then rzoner_s11 = przr5
      when 6 then rzoner_s11 = przr4
      when 7 then rzoner_s11 = przr3
      when 8 then rzoner_s11 = przr2
      when 9 then rzoner_s11 = przr1
      when 10 then rzoner_s11 = ''
      when 11..100 then rzoner_s11 = rrzr11
    end

    #rzoner_s12
    case num_rzoner
      when 0 then rzoner_s12 = przr12    
      when 1 then rzoner_s12 = przr10
      when 2 then rzoner_s12 = przr9
      when 3 then rzoner_s12 = przr8
      when 4 then rzoner_s12 = przr7
      when 5 then rzoner_s12 = przr6
      when 6 then rzoner_s12 = przr5
      when 7 then rzoner_s12 = przr4
      when 8 then rzoner_s12 = przr3
      when 9 then rzoner_s12 = przr2
      when 10 then rzoner_s12 = przr1
      when 11 then rzoner_s12 = ''
      when 12..100 then rzoner_s12 = rrzr12
    end

    #rzoner_s13
    case num_rzoner
      when 0 then rzoner_s13 = przr13    
      when 1 then rzoner_s13 = przr11
      when 2 then rzoner_s13 = przr10
      when 3 then rzoner_s13 = przr9
      when 4 then rzoner_s13 = przr8
      when 5 then rzoner_s13 = przr7
      when 6 then rzoner_s13 = przr6
      when 7 then rzoner_s13 = przr5
      when 8 then rzoner_s13 = przr4
      when 9 then rzoner_s13 = przr3
      when 10 then rzoner_s13 = przr2
      when 11 then rzoner_s13 = przr1
      when 12 then rzoner_s13 = ''
      when 13..100 then rzoner_s13 = rrzr13
    end

    #rzoner_s14
    case num_rzoner
      when 0 then rzoner_s14 = przr14    
      when 1 then rzoner_s14 = przr12
      when 2 then rzoner_s14 = przr11
      when 3 then rzoner_s14 = przr10
      when 4 then rzoner_s14 = przr9
      when 5 then rzoner_s14 = przr8
      when 6 then rzoner_s14 = przr7
      when 7 then rzoner_s14 = przr6
      when 8 then rzoner_s14 = przr5
      when 9 then rzoner_s14 = przr4
      when 10 then rzoner_s14 = przr3
      when 11 then rzoner_s14 = przr2
      when 12 then rzoner_s14 = przr1  
      when 13 then rzoner_s14 = ''
      when 14..100 then rzoner_s14 = rrzr14
    end

    #rzoner_s15
    case num_rzoner
      when 0 then rzoner_s15 = przr15    
      when 1 then rzoner_s15 = przr13
      when 2 then rzoner_s15 = przr12
      when 3 then rzoner_s15 = przr11
      when 4 then rzoner_s15 = przr10
      when 5 then rzoner_s15 = przr9
      when 6 then rzoner_s15 = przr8
      when 7 then rzoner_s15 = przr7
      when 8 then rzoner_s15 = przr6
      when 9 then rzoner_s15 = przr5
      when 10 then rzoner_s15 = przr4
      when 11 then rzoner_s15 = przr3
      when 12 then rzoner_s15 = przr2
      when 13 then rzoner_s15 = przr1  
      when 14..100 then rzoner_s15 = rrzr15
    end

    #----------End Redzone---------- 

    #----------Goal Line----------
    goalines = event.plays.where('situation10 = ?', true)
     
    rungoalines = goalines.where('play_type = ?', 'Run')
    rungoalinesLeft = rungoalines.where('hash_mark = ?', 'Left')
    rungoalinesRight = rungoalines.where('hash_mark = ?', 'Right')
     
    passgoalines = goalines.where('play_type = ?', 'Pass')
    passgoalinesLeft = passgoalines.where('hash_mark = ?', 'Left')
    passgoalinesRight = passgoalines.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless rungoalinesLeft[0].nil?  
      rgll1 = rungoalinesLeft[0].fullname 
    end
    unless rungoalinesLeft[1].nil?  
      rgll2 = rungoalinesLeft[1].fullname 
    end
    unless rungoalinesLeft[2].nil?  
      rgll3 = rungoalinesLeft[2].fullname 
    end
    unless rungoalinesLeft[3].nil?  
      rgll4 = rungoalinesLeft[3].fullname 
    end
    unless rungoalinesLeft[4].nil?  
      rgll5 = rungoalinesLeft[4].fullname
    end
    unless rungoalinesLeft[5].nil?  
      rgll6 = rungoalinesLeft[5].fullname 
    end
    unless rungoalinesLeft[6].nil?  
      rgll7 = rungoalinesLeft[6].fullname
    end  
      unless rungoalinesLeft[7].nil?  
      rgll8 = rungoalinesLeft[7].fullname 
    end
    unless rungoalinesLeft[8].nil?  
      rgll9 = rungoalinesLeft[8].fullname 
    end
    unless rungoalinesLeft[9].nil?  
      rgll10 = rungoalinesLeft[9].fullname 
    end
    unless rungoalinesLeft[10].nil?  
      rgll11 = rungoalinesLeft[10].fullname 
    end
    unless rungoalinesLeft[11].nil?  
      rgll12 = rungoalinesLeft[11].fullname
    end
    unless rungoalinesLeft[12].nil?  
      rgll13 = rungoalinesLeft[12].fullname 
    end
    unless rungoalinesLeft[13].nil?  
      rgll14 = rungoalinesLeft[13].fullname
    end  
    unless rungoalinesLeft[14].nil?  
      rgll15 = rungoalinesLeft[14].fullname
    end

    #Run Right Hash
    unless rungoalinesRight[0].nil?  
      rglr1 = rungoalinesRight[0].fullname 
    end
    unless rungoalinesRight[1].nil?  
      rglr2 = rungoalinesRight[1].fullname 
    end
    unless rungoalinesRight[2].nil?  
      rglr3 = rungoalinesRight[2].fullname 
    end
    unless rungoalinesRight[3].nil?  
      rglr4 = rungoalinesRight[3].fullname 
    end
    unless rungoalinesRight[4].nil?  
      rglr5 = rungoalinesRight[4].fullname
    end
    unless rungoalinesRight[5].nil?  
      rglr6 = rungoalinesRight[5].fullname 
    end
    unless rungoalinesRight[6].nil?  
      rglr7 = rungoalinesRight[6].fullname
    end    
    unless rungoalinesRight[7].nil?  
      rglr8 = rungoalinesRight[7].fullname 
    end
    unless rungoalinesRight[8].nil?  
      rglr9 = rungoalinesRight[8].fullname 
    end
    unless rungoalinesRight[9].nil?  
      rglr10 = rungoalinesRight[9].fullname 
    end
    unless rungoalinesRight[10].nil?  
      rglr11 = rungoalinesRight[10].fullname 
    end
    unless rungoalinesRight[11].nil?  
      rglr12 = rungoalinesRight[11].fullname
    end
    unless rungoalinesRight[12].nil?  
      rglr13 = rungoalinesRight[12].fullname 
    end
    unless rungoalinesRight[13].nil?  
      rglr14 = rungoalinesRight[13].fullname
    end 
    unless rungoalinesRight[14].nil?  
      rglr15 = rungoalinesRight[14].fullname
    end 

    #Pass Left Hash
    unless passgoalinesLeft[0].nil?  
      pgll1 = passgoalinesLeft[0].fullname 
    end
    unless passgoalinesLeft[1].nil?  
      pgll2 = passgoalinesLeft[1].fullname 
    end
    unless passgoalinesLeft[2].nil?  
      pgll3 = passgoalinesLeft[2].fullname 
    end
    unless passgoalinesLeft[3].nil?  
      pgll4 = passgoalinesLeft[3].fullname 
    end
    unless passgoalinesLeft[4].nil?  
      pgll5 = passgoalinesLeft[4].fullname 
    end
    unless passgoalinesLeft[5].nil?  
      pgll6 = passgoalinesLeft[5].fullname 
    end 
    unless passgoalinesLeft[6].nil?  
      pgll7 = passgoalinesLeft[6].fullname 
    end       
    unless passgoalinesLeft[7].nil?  
      pgll8 = passgoalinesLeft[7].fullname 
    end
    unless passgoalinesLeft[8].nil?  
      pgll9 = passgoalinesLeft[8].fullname 
    end
    unless passgoalinesLeft[9].nil?  
      pgll10 = passgoalinesLeft[9].fullname 
    end
    unless passgoalinesLeft[10].nil?  
      pgll11 = passgoalinesLeft[10].fullname 
    end
    unless passgoalinesLeft[11].nil?  
      pgll12 = passgoalinesLeft[11].fullname 
    end
    unless passgoalinesLeft[12].nil?  
      pgll13 = passgoalinesLeft[12].fullname 
    end 
    unless passgoalinesLeft[13].nil?  
      pgll14 = passgoalinesLeft[13].fullname 
    end 
    unless passgoalinesLeft[14].nil?  
      pgll15 = passgoalinesLeft[14].fullname 
    end 

    #Pass Right Hash
    unless passgoalinesRight[0].nil?  
      pglr1 = passgoalinesRight[0].fullname 
    end
    unless passgoalinesRight[1].nil?  
      pglr2 = passgoalinesRight[1].fullname 
    end
    unless passgoalinesRight[2].nil?  
      pglr3 = passgoalinesRight[2].fullname 
    end
    unless passgoalinesRight[3].nil?  
      pglr4 = passgoalinesRight[3].fullname 
    end
    unless passgoalinesRight[4].nil?  
      pglr5 = passgoalinesRight[4].fullname 
    end
    unless passgoalinesRight[5].nil?  
      pglr6 = passgoalinesRight[5].fullname 
    end
    unless passgoalinesRight[6].nil?  
      pglr7 = passgoalinesRight[6].fullname 
    end    
    unless passgoalinesRight[7].nil?  
      pglr8 = passgoalinesRight[7].fullname 
    end
    unless passgoalinesRight[8].nil?  
      pglr9 = passgoalinesRight[8].fullname 
    end
    unless passgoalinesRight[9].nil?  
      pglr10 = passgoalinesRight[9].fullname 
    end
    unless passgoalinesRight[10].nil?  
      pglr11 = passgoalinesRight[10].fullname 
    end
    unless passgoalinesRight[11].nil?  
      pglr12 = passgoalinesRight[11].fullname 
    end
    unless passgoalinesRight[12].nil?  
      pglr13 = passgoalinesRight[12].fullname 
    end
    unless passgoalinesRight[13].nil?  
      pglr14 = passgoalinesRight[13].fullname 
    end 
    unless passgoalinesRight[14].nil?  
      pglr15 = passgoalinesRight[14].fullname 
    end 

    #Number of user's run plays in situation 10
    num_gliner = self.user.s_name10_num_run

    #Left Hash
    # glinel_s0 
    if num_gliner > 0
      glinel_s0 = self.user.s_name10 + ' - Run'
    else
      glinel_s0 = self.user.s_name10 + ' - Pass'
    end

    #glinel_s1 
    if num_gliner > 0
      glinel_s1 = rgll1
    else
      glinel_s1 = pgll1
    end

    #glinel_s2
    if num_gliner == 0
      glinel_s2 = pgll2
    elsif num_gliner == 1
      glinel_s2 = self.user.s_name10 + ' - Pass'
    else num_gliner > 1
      glinel_s2 = rgll2
    end

    #glinel_s3
    case num_gliner
      when 0 then glinel_s3 = pgll3       
      when 1 then glinel_s3 = pgll1
      when 2 then glinel_s3 = self.user.s_name10 + ' - Pass'
      when 3..100 then glinel_s3 = rgll3
    end

    #glinel_s4
    case num_gliner
      when 0 then glinel_s4 = pgll4       
      when 1 then glinel_s4 = pgll2
      when 2 then glinel_s4 = pgll1
      when 3 then glinel_s4 = self.user.s_name10 + ' - Pass'
      when 4..100 then glinel_s4 = rgll4
    end

    #glinel_s5
    case num_gliner
      when 0 then glinel_s5 = pgll5       
      when 1 then glinel_s5 = pgll3
      when 2 then glinel_s5 = pgll2
      when 3 then glinel_s5 = pgll1
      when 4 then glinel_s5 = self.user.s_name10 + ' - Pass'
      when 5..100 then glinel_s5 = rgll5
    end

    #glinel_s6
    case num_gliner
      when 0 then glinel_s6 = pgll6      
      when 1 then glinel_s6 = pgll4
      when 2 then glinel_s6 = pgll3
      when 3 then glinel_s6 = pgll2
      when 4 then glinel_s6 = pgll1
      when 5 then glinel_s6 = self.user.s_name10 + ' - Pass'
      when 6..100 then glinel_s6 = rgll6
    end

    #glinel_s7
    case num_gliner
      when 0 then glinel_s7 = pgll7      
      when 1 then glinel_s7 = pgll5
      when 2 then glinel_s7 = pgll4
      when 3 then glinel_s7 = pgll3
      when 4 then glinel_s7 = pgll2
      when 5 then glinel_s7 = pgll1
      when 6 then glinel_s7 = self.user.s_name10 + ' - Pass'
      when 7..100 then glinel_s7 = rgll7
    end

    #glinel_s8
    case num_gliner
      when 0 then glinel_s8 = pgll8      
      when 1 then glinel_s8 = pgll6
      when 2 then glinel_s8 = pgll5
      when 3 then glinel_s8 = pgll4
      when 4 then glinel_s8 = pgll3
      when 5 then glinel_s8 = pgll2
      when 6 then glinel_s8 = pgll1
      when 7 then glinel_s8 = self.user.s_name10 + ' - Pass'
      when 8..100 then glinel_s8 = rgll8
    end

    #glinel_s9
    case num_gliner
      when 0 then glinel_s9 = pgll9      
      when 1 then glinel_s9 = pgll7
      when 2 then glinel_s9 = pgll6
      when 3 then glinel_s9 = pgll5
      when 4 then glinel_s9 = pgll4
      when 5 then glinel_s9 = pgll3
      when 6 then glinel_s9 = pgll2
      when 7 then glinel_s9 = pgll1
      when 8 then glinel_s9 = self.user.s_name10 + ' - Pass'
      when 9..100 then glinel_s9 = rgll9
    end

    #glinel_s10
    case num_gliner
      when 0 then glinel_s10 = pgll10     
      when 1 then glinel_s10 = pgll8
      when 2 then glinel_s10 = pgll7
      when 3 then glinel_s10 = pgll6
      when 4 then glinel_s10 = pgll5
      when 5 then glinel_s10 = pgll4
      when 6 then glinel_s10 = pgll3
      when 7 then glinel_s10 = pgll2
      when 8 then glinel_s10 = pgll1
      when 9 then glinel_s10 = self.user.s_name10 + ' - Pass'
      when 10..100 then glinel_s10 = rgll10
    end

    #glinel_s11
    case num_gliner
      when 0 then glinel_s11 = pgll11     
      when 1 then glinel_s11 = pgll9
      when 2 then glinel_s11 = pgll8
      when 3 then glinel_s11 = pgll7
      when 4 then glinel_s11 = pgll6
      when 5 then glinel_s11 = pgll5
      when 6 then glinel_s11 = pgll4
      when 7 then glinel_s11 = pgll3
      when 8 then glinel_s11 = pgll2
      when 9 then glinel_s11 = pgll1
      when 10 then glinel_s11 = self.user.s_name10 + ' - Pass'
      when 11..100 then glinel_s11 = rgll11
    end

    #glinel_s12
    case num_gliner
      when 0 then glinel_s12 = pgll12    
      when 1 then glinel_s12 = pgll10
      when 2 then glinel_s12 = pgll9
      when 3 then glinel_s12 = pgll8
      when 4 then glinel_s12 = pgll7
      when 5 then glinel_s12 = pgll6
      when 6 then glinel_s12 = pgll5
      when 7 then glinel_s12 = pgll4
      when 8 then glinel_s12 = pgll3
      when 9 then glinel_s12 = pgll2
      when 10 then glinel_s12 = pgll1
      when 11 then glinel_s12 = self.user.s_name10 + ' - Pass'
      when 12..100 then glinel_s12 = rgll12
    end

    #glinel_s13
    case num_gliner
      when 0 then glinel_s13 = pgll13    
      when 1 then glinel_s13 = pgll11
      when 2 then glinel_s13 = pgll10
      when 3 then glinel_s13 = pgll9
      when 4 then glinel_s13 = pgll8
      when 5 then glinel_s13 = pgll7
      when 6 then glinel_s13 = pgll6
      when 7 then glinel_s13 = pgll5
      when 8 then glinel_s13 = pgll4
      when 9 then glinel_s13 = pgll3
      when 10 then glinel_s13 = pgll2
      when 11 then glinel_s13 = pgll1
      when 12 then glinel_s13 = self.user.s_name10 + ' - Pass'
      when 13..100 then glinel_s13 = rgll13
    end

    #glinel_s14
    case num_gliner
      when 0 then glinel_s14 = pgll14    
      when 1 then glinel_s14 = pgll12
      when 2 then glinel_s14 = pgll11
      when 3 then glinel_s14 = pgll10
      when 4 then glinel_s14 = pgll9
      when 5 then glinel_s14 = pgll8
      when 6 then glinel_s14 = pgll7
      when 7 then glinel_s14 = pgll6
      when 8 then glinel_s14 = pgll5
      when 9 then glinel_s14 = pgll4
      when 10 then glinel_s14 = pgll3
      when 11 then glinel_s14 = pgll2
      when 12 then glinel_s14 = pgll1  
      when 13 then glinel_s14 = self.user.s_name10 + ' - Pass'
      when 14..100 then glinel_s14 = rgll14
    end

    #glinel_s15
    case num_gliner
      when 0 then glinel_s15 = pgll15    
      when 1 then glinel_s15 = pgll13
      when 2 then glinel_s15 = pgll12
      when 3 then glinel_s15 = pgll11
      when 4 then glinel_s15 = pgll10
      when 5 then glinel_s15 = pgll9
      when 6 then glinel_s15 = pgll8
      when 7 then glinel_s15 = pgll7
      when 8 then glinel_s15 = pgll6
      when 9 then glinel_s15 = pgll5
      when 10 then glinel_s15 = pgll4
      when 11 then glinel_s15 = pgll3
      when 12 then glinel_s15 = pgll2
      when 13 then glinel_s15 = pgll1  
      when 14..100 then glinel_s15 = rgll15
    end    


    #Right Hash
    # gliner_s0 would always be blank

    #gliner_s1 
    if num_gliner > 0
      gliner_s1 = rglr1
    else
      gliner_s1 = pglr1
    end

    #gliner_s2
    if num_gliner == 0
      gliner_s2 = pglr2
    elsif num_gliner == 1
      gliner_s2 = ''
    else num_gliner > 1
      gliner_s2 = rglr2
    end

    #gliner_s3
    case num_gliner
      when 0 then gliner_s3 = pglr3       
      when 1 then gliner_s3 = pglr1
      when 2 then gliner_s3 = ''
      when 3..100 then gliner_s3 = rglr3
    end

    #gliner_s4
    case num_gliner
      when 0 then gliner_s4 = pglr4       
      when 1 then gliner_s4 = pglr2
      when 2 then gliner_s4 = pglr1
      when 3 then ''
      when 4..100 then gliner_s4 = rglr4
    end

    #gliner_s5
    case num_gliner
      when 0 then gliner_s5 = pglr5       
      when 1 then gliner_s5 = pglr3
      when 2 then gliner_s5 = pglr2
      when 3 then gliner_s5 = pglr1
      when 4 then gliner_s5 = ''
      when 5..100 then gliner_s5 = rglr5
    end

    #gliner_s6
    case num_gliner
      when 0 then gliner_s6 = pglr6      
      when 1 then gliner_s6 = pglr4
      when 2 then gliner_s6 = pglr3
      when 3 then gliner_s6 = pglr2
      when 4 then gliner_s6 = pglr1
      when 5 then gliner_s6 = ''
      when 6..100 then gliner_s6 = rglr6
    end

    #gliner_s7
    case num_gliner
      when 0 then gliner_s7 = pglr7      
      when 1 then gliner_s7 = pglr5
      when 2 then gliner_s7 = pglr4
      when 3 then gliner_s7 = pglr3
      when 4 then gliner_s7 = pglr2
      when 5 then gliner_s7 = pglr1
      when 6 then gliner_s7 = ''
      when 7..100 then gliner_s7 = rglr7
    end

    #gliner_s8
    case num_gliner
      when 0 then gliner_s8 = pglr8      
      when 1 then gliner_s8 = pglr6
      when 2 then gliner_s8 = pglr5
      when 3 then gliner_s8 = pglr4
      when 4 then gliner_s8 = pglr3
      when 5 then gliner_s8 = pglr2
      when 6 then gliner_s8 = pglr1
      when 7 then gliner_s8 = ''
      when 8..100 then gliner_s8 = rglr8
    end

    #gliner_s9
    case num_gliner
      when 0 then gliner_s9 = pglr9      
      when 1 then gliner_s9 = pglr7
      when 2 then gliner_s9 = pglr6
      when 3 then gliner_s9 = pglr5
      when 4 then gliner_s9 = pglr4
      when 5 then gliner_s9 = pglr3
      when 6 then gliner_s9 = pglr2
      when 7 then gliner_s9 = pglr1
      when 8 then gliner_s9 = ''
      when 9..100 then gliner_s9 = rglr9
    end

    #gliner_s10
    case num_gliner
      when 0 then gliner_s10 = pglr10     
      when 1 then gliner_s10 = pglr8
      when 2 then gliner_s10 = pglr7
      when 3 then gliner_s10 = pglr6
      when 4 then gliner_s10 = pglr5
      when 5 then gliner_s10 = pglr4
      when 6 then gliner_s10 = pglr3
      when 7 then gliner_s10 = pglr2
      when 8 then gliner_s10 = pglr1
      when 9 then gliner_s10 = ''
      when 10..100 then gliner_s10 = rglr10
    end

    #gliner_s11
    case num_gliner
      when 0 then gliner_s11 = pglr11     
      when 1 then gliner_s11 = pglr9
      when 2 then gliner_s11 = pglr8
      when 3 then gliner_s11 = pglr7
      when 4 then gliner_s11 = pglr6
      when 5 then gliner_s11 = pglr5
      when 6 then gliner_s11 = pglr4
      when 7 then gliner_s11 = pglr3
      when 8 then gliner_s11 = pglr2
      when 9 then gliner_s11 = pglr1
      when 10 then gliner_s11 = ''
      when 11..100 then gliner_s11 = rglr11
    end

    #gliner_s12
    case num_gliner
      when 0 then gliner_s12 = pglr12    
      when 1 then gliner_s12 = pglr10
      when 2 then gliner_s12 = pglr9
      when 3 then gliner_s12 = pglr8
      when 4 then gliner_s12 = pglr7
      when 5 then gliner_s12 = pglr6
      when 6 then gliner_s12 = pglr5
      when 7 then gliner_s12 = pglr4
      when 8 then gliner_s12 = pglr3
      when 9 then gliner_s12 = pglr2
      when 10 then gliner_s12 = pglr1
      when 11 then gliner_s12 = ''
      when 12..100 then gliner_s12 = rglr12
    end

    #gliner_s13
    case num_gliner
      when 0 then gliner_s13 = pglr13    
      when 1 then gliner_s13 = pglr11
      when 2 then gliner_s13 = pglr10
      when 3 then gliner_s13 = pglr9
      when 4 then gliner_s13 = pglr8
      when 5 then gliner_s13 = pglr7
      when 6 then gliner_s13 = pglr6
      when 7 then gliner_s13 = pglr5
      when 8 then gliner_s13 = pglr4
      when 9 then gliner_s13 = pglr3
      when 10 then gliner_s13 = pglr2
      when 11 then gliner_s13 = pglr1
      when 12 then gliner_s13 = ''
      when 13..100 then gliner_s13 = rglr13
    end

    #gliner_s14
    case num_gliner
      when 0 then gliner_s14 = pglr14    
      when 1 then gliner_s14 = pglr12
      when 2 then gliner_s14 = pglr11
      when 3 then gliner_s14 = pglr10
      when 4 then gliner_s14 = pglr9
      when 5 then gliner_s14 = pglr8
      when 6 then gliner_s14 = pglr7
      when 7 then gliner_s14 = pglr6
      when 8 then gliner_s14 = pglr5
      when 9 then gliner_s14 = pglr4
      when 10 then gliner_s14 = pglr3
      when 11 then gliner_s14 = pglr2
      when 12 then gliner_s14 = pglr1  
      when 13 then gliner_s14 = ''
      when 14..100 then gliner_s14 = rglr14
    end

    #gliner_s15
    case num_gliner
      when 0 then gliner_s15 = pglr15    
      when 1 then gliner_s15 = pglr13
      when 2 then gliner_s15 = pglr12
      when 3 then gliner_s15 = pglr11
      when 4 then gliner_s15 = pglr10
      when 5 then gliner_s15 = pglr9
      when 6 then gliner_s15 = pglr8
      when 7 then gliner_s15 = pglr7
      when 8 then gliner_s15 = pglr6
      when 9 then gliner_s15 = pglr5
      when 10 then gliner_s15 = pglr4
      when 11 then gliner_s15 = pglr3
      when 12 then gliner_s15 = pglr2
      when 13 then gliner_s15 = pglr1  
      when 14..100 then gliner_s15 = rglr15
    end        
    #----------End Goaline----------  

    #----------Coming Out----------
    comingOuts = event.plays.where('situation11 = ?', true)
     
    runComingOuts = comingOuts.where('play_type = ?', 'Run')
    runComingOutsLeft = runComingOuts.where('hash_mark = ?', 'Left')
    runComingOutsRight = runComingOuts.where('hash_mark = ?', 'Right')
     
    passComingOuts = comingOuts.where('play_type = ?', 'Pass')
    passComingOutsLeft = passComingOuts.where('hash_mark = ?', 'Left')
    passComingOutsRight = passComingOuts.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runComingOutsLeft[0].nil?  
      rcol1 = runComingOutsLeft[0].fullname 
    end
    unless runComingOutsLeft[1].nil?  
      rcol2 = runComingOutsLeft[1].fullname 
    end
    unless runComingOutsLeft[2].nil?  
      rcol3 = runComingOutsLeft[2].fullname 
    end
    unless runComingOutsLeft[3].nil?  
      rcol4 = runComingOutsLeft[3].fullname 
    end
    unless runComingOutsLeft[4].nil?  
      rcol5 = runComingOutsLeft[4].fullname
    end
    unless runComingOutsLeft[5].nil?  
      rcol6 = runComingOutsLeft[5].fullname 
    end
    unless runComingOutsLeft[6].nil?  
      rcol7 = runComingOutsLeft[6].fullname
    end    
    unless runComingOutsLeft[7].nil?  
      rcol8 = runComingOutsLeft[7].fullname 
    end
    unless runComingOutsLeft[8].nil?  
      rcol9 = runComingOutsLeft[8].fullname 
    end
    unless runComingOutsLeft[9].nil?  
      rcol10 = runComingOutsLeft[9].fullname 
    end
    unless runComingOutsLeft[10].nil?  
      rcol11 = runComingOutsLeft[10].fullname 
    end
    unless runComingOutsLeft[11].nil?  
      rcol12 = runComingOutsLeft[11].fullname
    end
    unless runComingOutsLeft[12].nil?  
      rcol13 = runComingOutsLeft[12].fullname 
    end
    unless runComingOutsLeft[13].nil?  
      rcol14 = runComingOutsLeft[13].fullname
    end  
    unless runComingOutsLeft[14].nil?  
      rcol15 = runComingOutsLeft[14].fullname
    end 

    #Run Right Hash
    unless runComingOutsRight[0].nil?  
      rcor1 = runComingOutsRight[0].fullname 
    end
    unless runComingOutsRight[1].nil?  
      rcor2 = runComingOutsRight[1].fullname 
    end
    unless runComingOutsRight[2].nil?  
      rcor3 = runComingOutsRight[2].fullname 
    end
    unless runComingOutsRight[3].nil?  
      rcor4 = runComingOutsRight[3].fullname 
    end
    unless runComingOutsRight[4].nil?  
      rcor5 = runComingOutsRight[4].fullname
    end
    unless runComingOutsRight[5].nil?  
      rcor6 = runComingOutsRight[5].fullname 
    end
    unless runComingOutsRight[6].nil?  
      rcor7 = runComingOutsRight[6].fullname
    end    
    unless runComingOutsRight[7].nil?  
      rcor8 = runComingOutsRight[7].fullname 
    end
    unless runComingOutsRight[8].nil?  
      rcor9 = runComingOutsRight[8].fullname 
    end
    unless runComingOutsRight[9].nil?  
      rcor10 = runComingOutsRight[9].fullname 
    end
    unless runComingOutsRight[10].nil?  
      rcor11 = runComingOutsRight[10].fullname 
    end
    unless runComingOutsRight[11].nil?  
      rcor12 = runComingOutsRight[11].fullname
    end
    unless runComingOutsRight[12].nil?  
      rcor13 = runComingOutsRight[12].fullname 
    end
    unless runComingOutsRight[13].nil?  
      rcor14 = runComingOutsRight[13].fullname
    end
    unless runComingOutsRight[14].nil?  
      rcor15 = runComingOutsRight[14].fullname
    end

    #Pass Left Hash
    unless passComingOutsLeft[0].nil?  
      pcol1 = passComingOutsLeft[0].fullname 
    end
    unless passComingOutsLeft[1].nil?  
      pcol2 = passComingOutsLeft[1].fullname 
    end
    unless passComingOutsLeft[2].nil?  
      pcol3 = passComingOutsLeft[2].fullname 
    end
    unless passComingOutsLeft[3].nil?  
      pcol4 = passComingOutsLeft[3].fullname 
    end
    unless passComingOutsLeft[4].nil?  
      pcol5 = passComingOutsLeft[4].fullname 
    end
    unless passComingOutsLeft[5].nil?  
      pcol6 = passComingOutsLeft[5].fullname 
    end 
    unless passComingOutsLeft[6].nil?  
      pcol7 = passComingOutsLeft[6].fullname 
    end       
    unless passComingOutsLeft[7].nil?  
      pcol8 = passComingOutsLeft[7].fullname 
    end
    unless passComingOutsLeft[8].nil?  
      pcol9 = passComingOutsLeft[8].fullname 
    end
    unless passComingOutsLeft[9].nil?  
      pcol10 = passComingOutsLeft[9].fullname 
    end
    unless passComingOutsLeft[10].nil?  
      pcol11 = passComingOutsLeft[10].fullname 
    end
    unless passComingOutsLeft[11].nil?  
      pcol12 = passComingOutsLeft[11].fullname 
    end
    unless passComingOutsLeft[12].nil?  
      pcol13 = passComingOutsLeft[12].fullname 
    end 
    unless passComingOutsLeft[13].nil?  
      pcol14 = passComingOutsLeft[13].fullname 
    end
    unless passComingOutsLeft[14].nil?  
      pcol15 = passComingOutsLeft[14].fullname 
    end

    #Pass Right Hash
    unless passComingOutsRight[0].nil?  
      pcor1 = passComingOutsRight[0].fullname 
    end
    unless passComingOutsRight[1].nil?  
      pcor2 = passComingOutsRight[1].fullname 
    end
    unless passComingOutsRight[2].nil?  
      pcor3 = passComingOutsRight[2].fullname 
    end
    unless passComingOutsRight[3].nil?  
      pcor4 = passComingOutsRight[3].fullname 
    end
    unless passComingOutsRight[4].nil?  
      pcor5 = passComingOutsRight[4].fullname 
    end
    unless passComingOutsRight[5].nil?  
      pcor6 = passComingOutsRight[5].fullname 
    end
    unless passComingOutsRight[6].nil?  
      pcor7 = passComingOutsRight[6].fullname 
    end     
    unless passComingOutsRight[7].nil?  
      pcor8 = passComingOutsRight[7].fullname 
    end
    unless passComingOutsRight[8].nil?  
      pcor9 = passComingOutsRight[8].fullname 
    end
    unless passComingOutsRight[9].nil?  
      pcor10 = passComingOutsRight[9].fullname 
    end
    unless passComingOutsRight[10].nil?  
      pcor11 = passComingOutsRight[10].fullname 
    end
    unless passComingOutsRight[11].nil?  
      pcor12 = passComingOutsRight[11].fullname 
    end
    unless passComingOutsRight[12].nil?  
      pcor13 = passComingOutsRight[12].fullname 
    end
    unless passComingOutsRight[13].nil?  
      pcor14 = passComingOutsRight[13].fullname 
    end   
    unless passComingOutsRight[14].nil?  
      pcor15 = passComingOutsRight[14].fullname 
    end  

    #Number of user's run plays in situation 11
    num_cor = self.user.s_name11_num_run

    #Left Hash
    # coutl_s0 
    if num_cor > 0
      coutl_s0 = self.user.s_name11 + ' - Run'
    else
      coutl_s0 = self.user.s_name11 + ' - Pass'
    end

    #coutl_s1 
    if num_cor > 0
      coutl_s1 = rcol1
    else
      coutl_s1 = pcol1
    end

    #coutl_s2
    if num_cor == 0
      coutl_s2 = pcol2
    elsif num_cor == 1
      coutl_s2 = self.user.s_name11 + ' - Pass'
    else num_cor > 1
      coutl_s2 = rcol2
    end

    #coutl_s3
    case num_cor
      when 0 then coutl_s3 = pcol3       
      when 1 then coutl_s3 = pcol1
      when 2 then coutl_s3 = self.user.s_name11 + ' - Pass'
      when 3..100 then coutl_s3 = rcol3
    end

    #coutl_s4
    case num_cor
      when 0 then coutl_s4 = pcol4       
      when 1 then coutl_s4 = pcol2
      when 2 then coutl_s4 = pcol1
      when 3 then coutl_s4 = self.user.s_name11 + ' - Pass'
      when 4..100 then coutl_s4 = rcol4
    end

    #coutl_s5
    case num_cor
      when 0 then coutl_s5 = pcol5       
      when 1 then coutl_s5 = pcol3
      when 2 then coutl_s5 = pcol2
      when 3 then coutl_s5 = pcol1
      when 4 then coutl_s5 = self.user.s_name11 + ' - Pass'
      when 5..100 then coutl_s5 = rcol5
    end

    #coutl_s6
    case num_cor
      when 0 then coutl_s6 = pcol6      
      when 1 then coutl_s6 = pcol4
      when 2 then coutl_s6 = pcol3
      when 3 then coutl_s6 = pcol2
      when 4 then coutl_s6 = pcol1
      when 5 then coutl_s6 = self.user.s_name11 + ' - Pass'
      when 6..100 then coutl_s6 = rcol6
    end

    #coutl_s7
    case num_cor
      when 0 then coutl_s7 = pcol7      
      when 1 then coutl_s7 = pcol5
      when 2 then coutl_s7 = pcol4
      when 3 then coutl_s7 = pcol3
      when 4 then coutl_s7 = pcol2
      when 5 then coutl_s7 = pcol1
      when 6 then coutl_s7 = self.user.s_name11 + ' - Pass'
      when 7..100 then coutl_s7 = rcol7
    end

    #coutl_s8
    case num_cor
      when 0 then coutl_s8 = pcol8      
      when 1 then coutl_s8 = pcol6
      when 2 then coutl_s8 = pcol5
      when 3 then coutl_s8 = pcol4
      when 4 then coutl_s8 = pcol3
      when 5 then coutl_s8 = pcol2
      when 6 then coutl_s8 = pcol1
      when 7 then coutl_s8 = self.user.s_name11 + ' - Pass'
      when 8..100 then coutl_s8 = rcol8
    end

    #coutl_s9
    case num_cor
      when 0 then coutl_s9 = pcol9      
      when 1 then coutl_s9 = pcol7
      when 2 then coutl_s9 = pcol6
      when 3 then coutl_s9 = pcol5
      when 4 then coutl_s9 = pcol4
      when 5 then coutl_s9 = pcol3
      when 6 then coutl_s9 = pcol2
      when 7 then coutl_s9 = pcol1
      when 8 then coutl_s9 = self.user.s_name11 + ' - Pass'
      when 9..100 then coutl_s9 = rcol9
    end

    #coutl_s10
    case num_cor
      when 0 then coutl_s10 = pcol10     
      when 1 then coutl_s10 = pcol8
      when 2 then coutl_s10 = pcol7
      when 3 then coutl_s10 = pcol6
      when 4 then coutl_s10 = pcol5
      when 5 then coutl_s10 = pcol4
      when 6 then coutl_s10 = pcol3
      when 7 then coutl_s10 = pcol2
      when 8 then coutl_s10 = pcol1
      when 9 then coutl_s10 = self.user.s_name11 + ' - Pass'
      when 10..100 then coutl_s10 = rcol10
    end

    #coutl_s11
    case num_cor
      when 0 then coutl_s11 = pcol11     
      when 1 then coutl_s11 = pcol9
      when 2 then coutl_s11 = pcol8
      when 3 then coutl_s11 = pcol7
      when 4 then coutl_s11 = pcol6
      when 5 then coutl_s11 = pcol5
      when 6 then coutl_s11 = pcol4
      when 7 then coutl_s11 = pcol3
      when 8 then coutl_s11 = pcol2
      when 9 then coutl_s11 = pcol1
      when 10 then coutl_s11 = self.user.s_name11 + ' - Pass'
      when 11..100 then coutl_s11 = rcol11
    end

    #coutl_s12
    case num_cor
      when 0 then coutl_s12 = pcol12    
      when 1 then coutl_s12 = pcol10
      when 2 then coutl_s12 = pcol9
      when 3 then coutl_s12 = pcol8
      when 4 then coutl_s12 = pcol7
      when 5 then coutl_s12 = pcol6
      when 6 then coutl_s12 = pcol5
      when 7 then coutl_s12 = pcol4
      when 8 then coutl_s12 = pcol3
      when 9 then coutl_s12 = pcol2
      when 10 then coutl_s12 = pcol1
      when 11 then coutl_s12 = self.user.s_name11 + ' - Pass'
      when 12..100 then coutl_s12 = rcol12
    end

    #coutl_s13
    case num_cor
      when 0 then coutl_s13 = pcol13    
      when 1 then coutl_s13 = pcol11
      when 2 then coutl_s13 = pcol10
      when 3 then coutl_s13 = pcol9
      when 4 then coutl_s13 = pcol8
      when 5 then coutl_s13 = pcol7
      when 6 then coutl_s13 = pcol6
      when 7 then coutl_s13 = pcol5
      when 8 then coutl_s13 = pcol4
      when 9 then coutl_s13 = pcol3
      when 10 then coutl_s13 = pcol2
      when 11 then coutl_s13 = pcol1
      when 12 then coutl_s13 = self.user.s_name11 + ' - Pass'
      when 13..100 then coutl_s13 = rcol13
    end

    #coutl_s14
    case num_cor
      when 0 then coutl_s14 = pcol14    
      when 1 then coutl_s14 = pcol12
      when 2 then coutl_s14 = pcol11
      when 3 then coutl_s14 = pcol10
      when 4 then coutl_s14 = pcol9
      when 5 then coutl_s14 = pcol8
      when 6 then coutl_s14 = pcol7
      when 7 then coutl_s14 = pcol6
      when 8 then coutl_s14 = pcol5
      when 9 then coutl_s14 = pcol4
      when 10 then coutl_s14 = pcol3
      when 11 then coutl_s14 = pcol2
      when 12 then coutl_s14 = pcol1  
      when 13 then coutl_s14 = self.user.s_name11 + ' - Pass'
      when 14..100 then coutl_s14 = rcol14
    end

    #coutl_s15
    case num_cor
      when 0 then coutl_s15 = pcol15    
      when 1 then coutl_s15 = pcol13
      when 2 then coutl_s15 = pcol12
      when 3 then coutl_s15 = pcol11
      when 4 then coutl_s15 = pcol10
      when 5 then coutl_s15 = pcol9
      when 6 then coutl_s15 = pcol8
      when 7 then coutl_s15 = pcol7
      when 8 then coutl_s15 = pcol6
      when 9 then coutl_s15 = pcol5
      when 10 then coutl_s15 = pcol4
      when 11 then coutl_s15 = pcol3
      when 12 then coutl_s15 = pcol2
      when 13 then coutl_s15 = pcol1  
      when 14..100 then coutl_s15 = rcol15
    end    


    #Right Hash
    # coutr_s0 would always be blank

    #coutr_s1 
    if num_cor > 0
      coutr_s1 = rcor1
    else
      coutr_s1 = pcor1
    end

    #coutr_s2
    if num_cor == 0
      coutr_s2 = pcor2
    elsif num_cor == 1
      coutr_s2 = ''
    else num_cor > 1
      coutr_s2 = rcor2
    end

    #coutr_s3
    case num_cor
      when 0 then coutr_s3 = pcor3       
      when 1 then coutr_s3 = pcor1
      when 2 then coutr_s3 = ''
      when 3..100 then coutr_s3 = rcor3
    end

    #coutr_s4
    case num_cor
      when 0 then coutr_s4 = pcor4       
      when 1 then coutr_s4 = pcor2
      when 2 then coutr_s4 = pcor1
      when 3 then ''
      when 4..100 then coutr_s4 = rcor4
    end

    #coutr_s5
    case num_cor
      when 0 then coutr_s5 = pcor5       
      when 1 then coutr_s5 = pcor3
      when 2 then coutr_s5 = pcor2
      when 3 then coutr_s5 = pcor1
      when 4 then coutr_s5 = ''
      when 5..100 then coutr_s5 = rcor5
    end

    #coutr_s6
    case num_cor
      when 0 then coutr_s6 = pcor6      
      when 1 then coutr_s6 = pcor4
      when 2 then coutr_s6 = pcor3
      when 3 then coutr_s6 = pcor2
      when 4 then coutr_s6 = pcor1
      when 5 then coutr_s6 = ''
      when 6..100 then coutr_s6 = rcor6
    end

    #coutr_s7
    case num_cor
      when 0 then coutr_s7 = pcor7      
      when 1 then coutr_s7 = pcor5
      when 2 then coutr_s7 = pcor4
      when 3 then coutr_s7 = pcor3
      when 4 then coutr_s7 = pcor2
      when 5 then coutr_s7 = pcor1
      when 6 then coutr_s7 = ''
      when 7..100 then coutr_s7 = rcor7
    end

    #coutr_s8
    case num_cor
      when 0 then coutr_s8 = pcor8      
      when 1 then coutr_s8 = pcor6
      when 2 then coutr_s8 = pcor5
      when 3 then coutr_s8 = pcor4
      when 4 then coutr_s8 = pcor3
      when 5 then coutr_s8 = pcor2
      when 6 then coutr_s8 = pcor1
      when 7 then coutr_s8 = ''
      when 8..100 then coutr_s8 = rcor8
    end

    #coutr_s9
    case num_cor
      when 0 then coutr_s9 = pcor9      
      when 1 then coutr_s9 = pcor7
      when 2 then coutr_s9 = pcor6
      when 3 then coutr_s9 = pcor5
      when 4 then coutr_s9 = pcor4
      when 5 then coutr_s9 = pcor3
      when 6 then coutr_s9 = pcor2
      when 7 then coutr_s9 = pcor1
      when 8 then coutr_s9 = ''
      when 9..100 then coutr_s9 = rcor9
    end

    #coutr_s10
    case num_cor
      when 0 then coutr_s10 = pcor10     
      when 1 then coutr_s10 = pcor8
      when 2 then coutr_s10 = pcor7
      when 3 then coutr_s10 = pcor6
      when 4 then coutr_s10 = pcor5
      when 5 then coutr_s10 = pcor4
      when 6 then coutr_s10 = pcor3
      when 7 then coutr_s10 = pcor2
      when 8 then coutr_s10 = pcor1
      when 9 then coutr_s10 = ''
      when 10..100 then coutr_s10 = rcor10
    end

    #coutr_s11
    case num_cor
      when 0 then coutr_s11 = pcor11     
      when 1 then coutr_s11 = pcor9
      when 2 then coutr_s11 = pcor8
      when 3 then coutr_s11 = pcor7
      when 4 then coutr_s11 = pcor6
      when 5 then coutr_s11 = pcor5
      when 6 then coutr_s11 = pcor4
      when 7 then coutr_s11 = pcor3
      when 8 then coutr_s11 = pcor2
      when 9 then coutr_s11 = pcor1
      when 10 then coutr_s11 = ''
      when 11..100 then coutr_s11 = rcor11
    end

    #coutr_s12
    case num_cor
      when 0 then coutr_s12 = pcor12    
      when 1 then coutr_s12 = pcor10
      when 2 then coutr_s12 = pcor9
      when 3 then coutr_s12 = pcor8
      when 4 then coutr_s12 = pcor7
      when 5 then coutr_s12 = pcor6
      when 6 then coutr_s12 = pcor5
      when 7 then coutr_s12 = pcor4
      when 8 then coutr_s12 = pcor3
      when 9 then coutr_s12 = pcor2
      when 10 then coutr_s12 = pcor1
      when 11 then coutr_s12 = ''
      when 12..100 then coutr_s12 = rcor12
    end

    #coutr_s13
    case num_cor
      when 0 then coutr_s13 = pcor13    
      when 1 then coutr_s13 = pcor11
      when 2 then coutr_s13 = pcor10
      when 3 then coutr_s13 = pcor9
      when 4 then coutr_s13 = pcor8
      when 5 then coutr_s13 = pcor7
      when 6 then coutr_s13 = pcor6
      when 7 then coutr_s13 = pcor5
      when 8 then coutr_s13 = pcor4
      when 9 then coutr_s13 = pcor3
      when 10 then coutr_s13 = pcor2
      when 11 then coutr_s13 = pcor1
      when 12 then coutr_s13 = ''
      when 13..100 then coutr_s13 = rcor13
    end

    #coutr_s14
    case num_cor
      when 0 then coutr_s14 = pcor14    
      when 1 then coutr_s14 = pcor12
      when 2 then coutr_s14 = pcor11
      when 3 then coutr_s14 = pcor10
      when 4 then coutr_s14 = pcor9
      when 5 then coutr_s14 = pcor8
      when 6 then coutr_s14 = pcor7
      when 7 then coutr_s14 = pcor6
      when 8 then coutr_s14 = pcor5
      when 9 then coutr_s14 = pcor4
      when 10 then coutr_s14 = pcor3
      when 11 then coutr_s14 = pcor2
      when 12 then coutr_s14 = pcor1  
      when 13 then coutr_s14 = ''
      when 14..100 then coutr_s14 = rcor14
    end

    #coutr_s15
    case num_cor
      when 0 then coutr_s15 = pcor15    
      when 1 then coutr_s15 = pcor13
      when 2 then coutr_s15 = pcor12
      when 3 then coutr_s15 = pcor11
      when 4 then coutr_s15 = pcor10
      when 5 then coutr_s15 = pcor9
      when 6 then coutr_s15 = pcor8
      when 7 then coutr_s15 = pcor7
      when 8 then coutr_s15 = pcor6
      when 9 then coutr_s15 = pcor5
      when 10 then coutr_s15 = pcor4
      when 11 then coutr_s15 = pcor3
      when 12 then coutr_s15 = pcor2
      when 13 then coutr_s15 = pcor1  
      when 14..100 then coutr_s15 = rcor15
    end 
    #----------End Coming Out---------- 

    #----------Custom 1----------
    customOnes = event.plays.where('situation12 = ?', true)
     
    runCustomOnes = customOnes.where('play_type = ?', 'Run')
    runCustomOnesLeft = runCustomOnes.where('hash_mark = ?', 'Left')
    runCustomOnesRight = runCustomOnes.where('hash_mark = ?', 'Right')
     
    passCustomOnes = customOnes.where('play_type = ?', 'Pass')
    passCustomOnesLeft = passCustomOnes.where('hash_mark = ?', 'Left')
    passCustomOnesRight = passCustomOnes.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runCustomOnesLeft[0].nil?  
      rcuol1 = runCustomOnesLeft[0].fullname 
    end
    unless runCustomOnesLeft[1].nil?  
      rcuol2 = runCustomOnesLeft[1].fullname 
    end
    unless runCustomOnesLeft[2].nil?  
      rcuol3 = runCustomOnesLeft[2].fullname 
    end
    unless runCustomOnesLeft[3].nil?  
      rcuol4 = runCustomOnesLeft[3].fullname 
    end
    unless runCustomOnesLeft[4].nil?  
      rcuol5 = runCustomOnesLeft[4].fullname
    end
    unless runCustomOnesLeft[5].nil?  
      rcuol6 = runCustomOnesLeft[5].fullname 
    end
    unless runCustomOnesLeft[6].nil?  
      rcuol7 = runCustomOnesLeft[6].fullname
    end    
    unless runCustomOnesLeft[7].nil?  
      rcuol8 = runCustomOnesLeft[7].fullname 
    end
    unless runCustomOnesLeft[8].nil?  
      rcuol9 = runCustomOnesLeft[8].fullname 
    end
    unless runCustomOnesLeft[9].nil?  
      rcuol10 = runCustomOnesLeft[9].fullname 
    end
    unless runCustomOnesLeft[10].nil?  
      rcuol11 = runCustomOnesLeft[10].fullname 
    end
    unless runCustomOnesLeft[11].nil?  
      rcuol12 = runCustomOnesLeft[11].fullname
    end
    unless runCustomOnesLeft[12].nil?  
      rcuol13 = runCustomOnesLeft[12].fullname 
    end
    unless runCustomOnesLeft[13].nil?  
      rcuol14 = runCustomOnesLeft[13].fullname
    end 
    unless runCustomOnesLeft[14].nil?  
      rcuol15 = runCustomOnesLeft[14].fullname
    end 

    #Run Right Hash
    unless runCustomOnesRight[0].nil?  
      rcuor1 = runCustomOnesRight[0].fullname 
    end
    unless runCustomOnesRight[1].nil?  
      rcuor2 = runCustomOnesRight[1].fullname 
    end
    unless runCustomOnesRight[2].nil?  
      rcuor3 = runCustomOnesRight[2].fullname 
    end
    unless runCustomOnesRight[3].nil?  
      rcuor4 = runCustomOnesRight[3].fullname 
    end
    unless runCustomOnesRight[4].nil?  
      rcuor5 = runCustomOnesRight[4].fullname
    end
    unless runCustomOnesRight[5].nil?  
      rcuor6 = runCustomOnesRight[5].fullname 
    end
    unless runCustomOnesRight[6].nil?  
      rcuor7 = runCustomOnesRight[6].fullname
    end    
    unless runCustomOnesRight[7].nil?  
      rcuor8 = runCustomOnesRight[7].fullname 
    end
    unless runCustomOnesRight[8].nil?  
      rcuor9 = runCustomOnesRight[8].fullname 
    end
    unless runCustomOnesRight[9].nil?  
      rcuor10 = runCustomOnesRight[9].fullname 
    end
    unless runCustomOnesRight[10].nil?  
      rcuor11 = runCustomOnesRight[10].fullname 
    end
    unless runCustomOnesRight[11].nil?  
      rcuor12 = runCustomOnesRight[11].fullname
    end
    unless runCustomOnesRight[12].nil?  
      rcuor13 = runCustomOnesRight[12].fullname 
    end
    unless runCustomOnesRight[13].nil?  
      rcuor14 = runCustomOnesRight[13].fullname
    end 
    unless runCustomOnesRight[14].nil?  
      rcuor15 = runCustomOnesRight[14].fullname
    end 

    #Pass Left Hash
    unless passCustomOnesLeft[0].nil?  
      pcuol1 = passCustomOnesLeft[0].fullname 
    end
    unless passCustomOnesLeft[1].nil?  
      pcuol2 = passCustomOnesLeft[1].fullname 
    end
    unless passCustomOnesLeft[2].nil?  
      pcuol3 = passCustomOnesLeft[2].fullname 
    end
    unless passCustomOnesLeft[3].nil?  
      pcuol4 = passCustomOnesLeft[3].fullname 
    end
    unless passCustomOnesLeft[4].nil?  
      pcuol5 = passCustomOnesLeft[4].fullname 
    end
    unless passCustomOnesLeft[5].nil?  
      pcuol6 = passCustomOnesLeft[5].fullname 
    end 
    unless passCustomOnesLeft[6].nil?  
      pcuol7 = passCustomOnesLeft[6].fullname 
    end       
    unless passCustomOnesLeft[7].nil?  
      pcuol8 = passCustomOnesLeft[7].fullname 
    end
    unless passCustomOnesLeft[8].nil?  
      pcuol9 = passCustomOnesLeft[8].fullname 
    end
    unless passCustomOnesLeft[9].nil?  
      pcuol10 = passCustomOnesLeft[9].fullname 
    end
    unless passCustomOnesLeft[10].nil?  
      pcuol11 = passCustomOnesLeft[10].fullname 
    end
    unless passCustomOnesLeft[11].nil?  
      pcuol12 = passCustomOnesLeft[11].fullname 
    end
    unless passCustomOnesLeft[12].nil?  
      pcuol13 = passCustomOnesLeft[12].fullname 
    end 
    unless passCustomOnesLeft[13].nil?  
      pcuol14 = passCustomOnesLeft[13].fullname 
    end 
    unless passCustomOnesLeft[14].nil?  
      pcuol15 = passCustomOnesLeft[14].fullname 
    end 

    #Pass Right Hash
    unless passCustomOnesRight[0].nil?  
      pcuor1 = passCustomOnesRight[0].fullname 
    end
    unless passCustomOnesRight[1].nil?  
      pcuor2 = passCustomOnesRight[1].fullname 
    end
    unless passCustomOnesRight[2].nil?  
      pcuor3 = passCustomOnesRight[2].fullname 
    end
    unless passCustomOnesRight[3].nil?  
      pcuor4 = passCustomOnesRight[3].fullname 
    end
    unless passCustomOnesRight[4].nil?  
      pcuor5 = passCustomOnesRight[4].fullname 
    end
    unless passCustomOnesRight[5].nil?  
      pcuor6 = passCustomOnesRight[5].fullname 
    end
    unless passCustomOnesRight[6].nil?  
      pcuor7 = passCustomOnesRight[6].fullname 
    end    
    unless passCustomOnesRight[7].nil?  
      pcuor8 = passCustomOnesRight[7].fullname 
    end
    unless passCustomOnesRight[8].nil?  
      pcuor9 = passCustomOnesRight[8].fullname 
    end
    unless passCustomOnesRight[9].nil?  
      pcuor10 = passCustomOnesRight[9].fullname 
    end
    unless passCustomOnesRight[10].nil?  
      pcuor11 = passCustomOnesRight[10].fullname 
    end
    unless passCustomOnesRight[11].nil?  
      pcuor12 = passCustomOnesRight[11].fullname 
    end
    unless passCustomOnesRight[12].nil?  
      pcuor13 = passCustomOnesRight[12].fullname 
    end
    unless passCustomOnesRight[13].nil?  
      pcuor14 = passCustomOnesRight[13].fullname 
    end       
    unless passCustomOnesRight[14].nil?  
      pcuor15 = passCustomOnesRight[14].fullname 
    end    

    #Number of user's run plays in situation 12
    num_cus1r = self.user.s_name12_num_run

    #Left Hash
    # cus1l_s0 
    if num_cus1r > 0
      cus1l_s0 = self.user.s_name12 + ' - Run'
    else
      cus1l_s0 = self.user.s_name12 + ' - Pass'
    end

    #cus1l_s1 
    if num_cus1r > 0
      cus1l_s1 = rcuol1
    else
      cus1l_s1 = pcuol1
    end

    #cus1l_s2
    if num_cus1r == 0
      cus1l_s2 = pcuol2
    elsif num_cus1r == 1
      cus1l_s2 = self.user.s_name12 + ' - Pass'
    else num_cus1r > 1
      cus1l_s2 = rcuol2
    end

    #cus1l_s3
    case num_cus1r
      when 0 then cus1l_s3 = pcuol3       
      when 1 then cus1l_s3 = pcuol1
      when 2 then cus1l_s3 = self.user.s_name12 + ' - Pass'
      when 3..100 then cus1l_s3 = rcuol3
    end

    #cus1l_s4
    case num_cus1r
      when 0 then cus1l_s4 = pcuol4       
      when 1 then cus1l_s4 = pcuol2
      when 2 then cus1l_s4 = pcuol1
      when 3 then cus1l_s4 = self.user.s_name12 + ' - Pass'
      when 4..100 then cus1l_s4 = rcuol4
    end

    #cus1l_s5
    case num_cus1r
      when 0 then cus1l_s5 = pcuol5       
      when 1 then cus1l_s5 = pcuol3
      when 2 then cus1l_s5 = pcuol2
      when 3 then cus1l_s5 = pcuol1
      when 4 then cus1l_s5 = self.user.s_name12 + ' - Pass'
      when 5..100 then cus1l_s5 = rcuol5
    end

    #cus1l_s6
    case num_cus1r
      when 0 then cus1l_s6 = pcuol6      
      when 1 then cus1l_s6 = pcuol4
      when 2 then cus1l_s6 = pcuol3
      when 3 then cus1l_s6 = pcuol2
      when 4 then cus1l_s6 = pcuol1
      when 5 then cus1l_s6 = self.user.s_name12 + ' - Pass'
      when 6..100 then cus1l_s6 = rcuol6
    end

    #cus1l_s7
    case num_cus1r
      when 0 then cus1l_s7 = pcuol7      
      when 1 then cus1l_s7 = pcuol5
      when 2 then cus1l_s7 = pcuol4
      when 3 then cus1l_s7 = pcuol3
      when 4 then cus1l_s7 = pcuol2
      when 5 then cus1l_s7 = pcuol1
      when 6 then cus1l_s7 = self.user.s_name12 + ' - Pass'
      when 7..100 then cus1l_s7 = rcuol7
    end

    #cus1l_s8
    case num_cus1r
      when 0 then cus1l_s8 = pcuol8      
      when 1 then cus1l_s8 = pcuol6
      when 2 then cus1l_s8 = pcuol5
      when 3 then cus1l_s8 = pcuol4
      when 4 then cus1l_s8 = pcuol3
      when 5 then cus1l_s8 = pcuol2
      when 6 then cus1l_s8 = pcuol1
      when 7 then cus1l_s8 = self.user.s_name12 + ' - Pass'
      when 8..100 then cus1l_s8 = rcuol8
    end

    #cus1l_s9
    case num_cus1r
      when 0 then cus1l_s9 = pcuol9      
      when 1 then cus1l_s9 = pcuol7
      when 2 then cus1l_s9 = pcuol6
      when 3 then cus1l_s9 = pcuol5
      when 4 then cus1l_s9 = pcuol4
      when 5 then cus1l_s9 = pcuol3
      when 6 then cus1l_s9 = pcuol2
      when 7 then cus1l_s9 = pcuol1
      when 8 then cus1l_s9 = self.user.s_name12 + ' - Pass'
      when 9..100 then cus1l_s9 = rcuol9
    end

    #cus1l_s10
    case num_cus1r
      when 0 then cus1l_s10 = pcuol10     
      when 1 then cus1l_s10 = pcuol8
      when 2 then cus1l_s10 = pcuol7
      when 3 then cus1l_s10 = pcuol6
      when 4 then cus1l_s10 = pcuol5
      when 5 then cus1l_s10 = pcuol4
      when 6 then cus1l_s10 = pcuol3
      when 7 then cus1l_s10 = pcuol2
      when 8 then cus1l_s10 = pcuol1
      when 9 then cus1l_s10 = self.user.s_name12 + ' - Pass'
      when 10..100 then cus1l_s10 = rcuol10
    end

    #cus1l_s11
    case num_cus1r
      when 0 then cus1l_s11 = pcuol11     
      when 1 then cus1l_s11 = pcuol9
      when 2 then cus1l_s11 = pcuol8
      when 3 then cus1l_s11 = pcuol7
      when 4 then cus1l_s11 = pcuol6
      when 5 then cus1l_s11 = pcuol5
      when 6 then cus1l_s11 = pcuol4
      when 7 then cus1l_s11 = pcuol3
      when 8 then cus1l_s11 = pcuol2
      when 9 then cus1l_s11 = pcuol1
      when 10 then cus1l_s11 = self.user.s_name12 + ' - Pass'
      when 11..100 then cus1l_s11 = rcuol11
    end

    #cus1l_s12
    case num_cus1r
      when 0 then cus1l_s12 = pcuol12    
      when 1 then cus1l_s12 = pcuol10
      when 2 then cus1l_s12 = pcuol9
      when 3 then cus1l_s12 = pcuol8
      when 4 then cus1l_s12 = pcuol7
      when 5 then cus1l_s12 = pcuol6
      when 6 then cus1l_s12 = pcuol5
      when 7 then cus1l_s12 = pcuol4
      when 8 then cus1l_s12 = pcuol3
      when 9 then cus1l_s12 = pcuol2
      when 10 then cus1l_s12 = pcuol1
      when 11 then cus1l_s12 = self.user.s_name12 + ' - Pass'
      when 12..100 then cus1l_s12 = rcuol12
    end

    #cus1l_s13
    case num_cus1r
      when 0 then cus1l_s13 = pcuol13    
      when 1 then cus1l_s13 = pcuol11
      when 2 then cus1l_s13 = pcuol10
      when 3 then cus1l_s13 = pcuol9
      when 4 then cus1l_s13 = pcuol8
      when 5 then cus1l_s13 = pcuol7
      when 6 then cus1l_s13 = pcuol6
      when 7 then cus1l_s13 = pcuol5
      when 8 then cus1l_s13 = pcuol4
      when 9 then cus1l_s13 = pcuol3
      when 10 then cus1l_s13 = pcuol2
      when 11 then cus1l_s13 = pcuol1
      when 12 then cus1l_s13 = self.user.s_name12 + ' - Pass'
      when 13..100 then cus1l_s13 = rcuol13
    end

    #cus1l_s14
    case num_cus1r
      when 0 then cus1l_s14 = pcuol14    
      when 1 then cus1l_s14 = pcuol12
      when 2 then cus1l_s14 = pcuol11
      when 3 then cus1l_s14 = pcuol10
      when 4 then cus1l_s14 = pcuol9
      when 5 then cus1l_s14 = pcuol8
      when 6 then cus1l_s14 = pcuol7
      when 7 then cus1l_s14 = pcuol6
      when 8 then cus1l_s14 = pcuol5
      when 9 then cus1l_s14 = pcuol4
      when 10 then cus1l_s14 = pcuol3
      when 11 then cus1l_s14 = pcuol2
      when 12 then cus1l_s14 = pcuol1  
      when 13 then cus1l_s14 = self.user.s_name12 + ' - Pass'
      when 14..100 then cus1l_s14 = rcuol14
    end

    #cus1l_s15
    case num_cus1r
      when 0 then cus1l_s15 = pcuol15    
      when 1 then cus1l_s15 = pcuol13
      when 2 then cus1l_s15 = pcuol12
      when 3 then cus1l_s15 = pcuol11
      when 4 then cus1l_s15 = pcuol10
      when 5 then cus1l_s15 = pcuol9
      when 6 then cus1l_s15 = pcuol8
      when 7 then cus1l_s15 = pcuol7
      when 8 then cus1l_s15 = pcuol6
      when 9 then cus1l_s15 = pcuol5
      when 10 then cus1l_s15 = pcuol4
      when 11 then cus1l_s15 = pcuol3
      when 12 then cus1l_s15 = pcuol2
      when 13 then cus1l_s15 = pcuol1  
      when 14..100 then cus1l_s15 = rcuol15
    end    


    #Right Hash
    # cus1r_s0 would always be blank

    #cus1r_s1 
    if num_cus1r > 0
      cus1r_s1 = rcuor1
    else
      cus1r_s1 = pcuor1
    end

    #cus1r_s2
    if num_cus1r == 0
      cus1r_s2 = pcuor2
    elsif num_cus1r == 1
      cus1r_s2 = ''
    else num_cus1r > 1
      cus1r_s2 = rcuor2
    end

    #cus1r_s3
    case num_cus1r
      when 0 then cus1r_s3 = pcuor3       
      when 1 then cus1r_s3 = pcuor1
      when 2 then cus1r_s3 = ''
      when 3..100 then cus1r_s3 = rcuor3
    end

    #cus1r_s4
    case num_cus1r
      when 0 then cus1r_s4 = pcuor4       
      when 1 then cus1r_s4 = pcuor2
      when 2 then cus1r_s4 = pcuor1
      when 3 then ''
      when 4..100 then cus1r_s4 = rcuor4
    end

    #cus1r_s5
    case num_cus1r
      when 0 then cus1r_s5 = pcuor5       
      when 1 then cus1r_s5 = pcuor3
      when 2 then cus1r_s5 = pcuor2
      when 3 then cus1r_s5 = pcuor1
      when 4 then cus1r_s5 = ''
      when 5..100 then cus1r_s5 = rcuor5
    end

    #cus1r_s6
    case num_cus1r
      when 0 then cus1r_s6 = pcuor6      
      when 1 then cus1r_s6 = pcuor4
      when 2 then cus1r_s6 = pcuor3
      when 3 then cus1r_s6 = pcuor2
      when 4 then cus1r_s6 = pcuor1
      when 5 then cus1r_s6 = ''
      when 6..100 then cus1r_s6 = rcuor6
    end

    #cus1r_s7
    case num_cus1r
      when 0 then cus1r_s7 = pcuor7      
      when 1 then cus1r_s7 = pcuor5
      when 2 then cus1r_s7 = pcuor4
      when 3 then cus1r_s7 = pcuor3
      when 4 then cus1r_s7 = pcuor2
      when 5 then cus1r_s7 = pcuor1
      when 6 then cus1r_s7 = ''
      when 7..100 then cus1r_s7 = rcuor7
    end

    #cus1r_s8
    case num_cus1r
      when 0 then cus1r_s8 = pcuor8      
      when 1 then cus1r_s8 = pcuor6
      when 2 then cus1r_s8 = pcuor5
      when 3 then cus1r_s8 = pcuor4
      when 4 then cus1r_s8 = pcuor3
      when 5 then cus1r_s8 = pcuor2
      when 6 then cus1r_s8 = pcuor1
      when 7 then cus1r_s8 = ''
      when 8..100 then cus1r_s8 = rcuor8
    end

    #cus1r_s9
    case num_cus1r
      when 0 then cus1r_s9 = pcuor9      
      when 1 then cus1r_s9 = pcuor7
      when 2 then cus1r_s9 = pcuor6
      when 3 then cus1r_s9 = pcuor5
      when 4 then cus1r_s9 = pcuor4
      when 5 then cus1r_s9 = pcuor3
      when 6 then cus1r_s9 = pcuor2
      when 7 then cus1r_s9 = pcuor1
      when 8 then cus1r_s9 = ''
      when 9..100 then cus1r_s9 = rcuor9
    end

    #cus1r_s10
    case num_cus1r
      when 0 then cus1r_s10 = pcuor10     
      when 1 then cus1r_s10 = pcuor8
      when 2 then cus1r_s10 = pcuor7
      when 3 then cus1r_s10 = pcuor6
      when 4 then cus1r_s10 = pcuor5
      when 5 then cus1r_s10 = pcuor4
      when 6 then cus1r_s10 = pcuor3
      when 7 then cus1r_s10 = pcuor2
      when 8 then cus1r_s10 = pcuor1
      when 9 then cus1r_s10 = ''
      when 10..100 then cus1r_s10 = rcuor10
    end

    #cus1r_s11
    case num_cus1r
      when 0 then cus1r_s11 = pcuor11     
      when 1 then cus1r_s11 = pcuor9
      when 2 then cus1r_s11 = pcuor8
      when 3 then cus1r_s11 = pcuor7
      when 4 then cus1r_s11 = pcuor6
      when 5 then cus1r_s11 = pcuor5
      when 6 then cus1r_s11 = pcuor4
      when 7 then cus1r_s11 = pcuor3
      when 8 then cus1r_s11 = pcuor2
      when 9 then cus1r_s11 = pcuor1
      when 10 then cus1r_s11 = ''
      when 11..100 then cus1r_s11 = rcuor11
    end

    #cus1r_s12
    case num_cus1r
      when 0 then cus1r_s12 = pcuor12    
      when 1 then cus1r_s12 = pcuor10
      when 2 then cus1r_s12 = pcuor9
      when 3 then cus1r_s12 = pcuor8
      when 4 then cus1r_s12 = pcuor7
      when 5 then cus1r_s12 = pcuor6
      when 6 then cus1r_s12 = pcuor5
      when 7 then cus1r_s12 = pcuor4
      when 8 then cus1r_s12 = pcuor3
      when 9 then cus1r_s12 = pcuor2
      when 10 then cus1r_s12 = pcuor1
      when 11 then cus1r_s12 = ''
      when 12..100 then cus1r_s12 = rcuor12
    end

    #cus1r_s13
    case num_cus1r
      when 0 then cus1r_s13 = pcuor13    
      when 1 then cus1r_s13 = pcuor11
      when 2 then cus1r_s13 = pcuor10
      when 3 then cus1r_s13 = pcuor9
      when 4 then cus1r_s13 = pcuor8
      when 5 then cus1r_s13 = pcuor7
      when 6 then cus1r_s13 = pcuor6
      when 7 then cus1r_s13 = pcuor5
      when 8 then cus1r_s13 = pcuor4
      when 9 then cus1r_s13 = pcuor3
      when 10 then cus1r_s13 = pcuor2
      when 11 then cus1r_s13 = pcuor1
      when 12 then cus1r_s13 = ''
      when 13..100 then cus1r_s13 = rcuor13
    end

    #cus1r_s14
    case num_cus1r
      when 0 then cus1r_s14 = pcuor14    
      when 1 then cus1r_s14 = pcuor12
      when 2 then cus1r_s14 = pcuor11
      when 3 then cus1r_s14 = pcuor10
      when 4 then cus1r_s14 = pcuor9
      when 5 then cus1r_s14 = pcuor8
      when 6 then cus1r_s14 = pcuor7
      when 7 then cus1r_s14 = pcuor6
      when 8 then cus1r_s14 = pcuor5
      when 9 then cus1r_s14 = pcuor4
      when 10 then cus1r_s14 = pcuor3
      when 11 then cus1r_s14 = pcuor2
      when 12 then cus1r_s14 = pcuor1  
      when 13 then cus1r_s14 = ''
      when 14..100 then cus1r_s14 = rcuor14
    end

    #cus1r_s15
    case num_cus1r
      when 0 then cus1r_s15 = pcuor15    
      when 1 then cus1r_s15 = pcuor13
      when 2 then cus1r_s15 = pcuor12
      when 3 then cus1r_s15 = pcuor11
      when 4 then cus1r_s15 = pcuor10
      when 5 then cus1r_s15 = pcuor9
      when 6 then cus1r_s15 = pcuor8
      when 7 then cus1r_s15 = pcuor7
      when 8 then cus1r_s15 = pcuor6
      when 9 then cus1r_s15 = pcuor5
      when 10 then cus1r_s15 = pcuor4
      when 11 then cus1r_s15 = pcuor3
      when 12 then cus1r_s15 = pcuor2
      when 13 then cus1r_s15 = pcuor1  
      when 14..100 then cus1r_s15 = rcuor15
    end     
    #----------End Custom 1----------   

    #----------Custom 2----------
    customTwos = event.plays.where('situation13 = ?', true)
     
    runCustomTwos = customTwos.where('play_type = ?', 'Run')
    runCustomTwosLeft = runCustomTwos.where('hash_mark = ?', 'Left')
    runCustomTwosRight = runCustomTwos.where('hash_mark = ?', 'Right')
     
    passCustomTwos = customTwos.where('play_type = ?', 'Pass')
    passCustomTwosLeft = passCustomTwos.where('hash_mark = ?', 'Left')
    passCustomTwosRight = passCustomTwos.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runCustomTwosLeft[0].nil?  
      rcutl1 = runCustomTwosLeft[0].fullname 
    end
    unless runCustomTwosLeft[1].nil?  
      rcutl2 = runCustomTwosLeft[1].fullname 
    end
    unless runCustomTwosLeft[2].nil?  
      rcutl3 = runCustomTwosLeft[2].fullname 
    end
    unless runCustomTwosLeft[3].nil?  
      rcutl4 = runCustomTwosLeft[3].fullname 
    end
    unless runCustomTwosLeft[4].nil?  
      rcutl5 = runCustomTwosLeft[4].fullname
    end
    unless runCustomTwosLeft[5].nil?  
      rcutl6 = runCustomTwosLeft[5].fullname 
    end
    unless runCustomTwosLeft[6].nil?  
      rcutl7 = runCustomTwosLeft[6].fullname
    end    
    unless runCustomTwosLeft[7].nil?  
      rcutl8 = runCustomTwosLeft[7].fullname 
    end
    unless runCustomTwosLeft[8].nil?  
      rcutl9 = runCustomTwosLeft[8].fullname 
    end
    unless runCustomTwosLeft[9].nil?  
      rcutl10 = runCustomTwosLeft[9].fullname 
    end
    unless runCustomTwosLeft[10].nil?  
      rcutl11 = runCustomTwosLeft[10].fullname 
    end
    unless runCustomTwosLeft[11].nil?  
      rcutl12 = runCustomTwosLeft[11].fullname
    end
    unless runCustomTwosLeft[12].nil?  
      rcutl13 = runCustomTwosLeft[12].fullname 
    end
    unless runCustomTwosLeft[13].nil?  
      rcutl14 = runCustomTwosLeft[13].fullname
    end 
    unless runCustomTwosLeft[14].nil?  
      rcutl15 = runCustomTwosLeft[14].fullname
    end

    #Run Right Hash
    unless runCustomTwosRight[0].nil?  
      rcutr1 = runCustomTwosRight[0].fullname 
    end
    unless runCustomTwosRight[1].nil?  
      rcutr2 = runCustomTwosRight[1].fullname 
    end
    unless runCustomTwosRight[2].nil?  
      rcutr3 = runCustomTwosRight[2].fullname 
    end
    unless runCustomTwosRight[3].nil?  
      rcutr4 = runCustomTwosRight[3].fullname 
    end
    unless runCustomTwosRight[4].nil?  
      rcutr5 = runCustomTwosRight[4].fullname
    end
    unless runCustomTwosRight[5].nil?  
      rcutr6 = runCustomTwosRight[5].fullname 
    end
    unless runCustomTwosRight[6].nil?  
      rcutr7 = runCustomTwosRight[6].fullname
    end    
    unless runCustomTwosRight[7].nil?  
      rcutr8 = runCustomTwosRight[7].fullname 
    end
    unless runCustomTwosRight[8].nil?  
      rcutr9 = runCustomTwosRight[8].fullname 
    end
    unless runCustomTwosRight[9].nil?  
      rcutr10 = runCustomTwosRight[9].fullname 
    end
    unless runCustomTwosRight[10].nil?  
      rcutr11 = runCustomTwosRight[10].fullname 
    end
    unless runCustomTwosRight[11].nil?  
      rcutr12 = runCustomTwosRight[11].fullname
    end
    unless runCustomTwosRight[12].nil?  
      rcutr13 = runCustomTwosRight[12].fullname 
    end
    unless runCustomTwosRight[13].nil?  
      rcutr14 = runCustomTwosRight[13].fullname
    end 
    unless runCustomTwosRight[14].nil?  
      rcutr15 = runCustomTwosRight[14].fullname
    end 

    #Pass Left Hash
    unless passCustomTwosLeft[0].nil?  
      pcutl1 = passCustomTwosLeft[0].fullname 
    end
    unless passCustomTwosLeft[1].nil?  
      pcutl2 = passCustomTwosLeft[1].fullname 
    end
    unless passCustomTwosLeft[2].nil?  
      pcutl3 = passCustomTwosLeft[2].fullname 
    end
    unless passCustomTwosLeft[3].nil?  
      pcutl4 = passCustomTwosLeft[3].fullname 
    end
    unless passCustomTwosLeft[4].nil?  
      pcutl5 = passCustomTwosLeft[4].fullname 
    end
    unless passCustomTwosLeft[5].nil?  
      pcutl6 = passCustomTwosLeft[5].fullname 
    end 
    unless passCustomTwosLeft[6].nil?  
      pcutl7 = passCustomTwosLeft[6].fullname 
    end       
    unless passCustomTwosLeft[7].nil?  
      pcutl8 = passCustomTwosLeft[7].fullname 
    end
    unless passCustomTwosLeft[8].nil?  
      pcutl9 = passCustomTwosLeft[8].fullname 
    end
    unless passCustomTwosLeft[9].nil?  
      pcutl10 = passCustomTwosLeft[9].fullname 
    end
    unless passCustomTwosLeft[10].nil?  
      pcutl11 = passCustomTwosLeft[10].fullname 
    end
    unless passCustomTwosLeft[11].nil?  
      pcutl12 = passCustomTwosLeft[11].fullname 
    end
    unless passCustomTwosLeft[12].nil?  
      pcutl13 = passCustomTwosLeft[12].fullname 
    end 
    unless passCustomTwosLeft[13].nil?  
      pcutl14 = passCustomTwosLeft[13].fullname 
    end 
    unless passCustomTwosLeft[14].nil?  
      pcutl15 = passCustomTwosLeft[14].fullname 
    end 

    #Pass Right Hash
    unless passCustomTwosRight[0].nil?  
      pcutr1 = passCustomTwosRight[0].fullname 
    end
    unless passCustomTwosRight[1].nil?  
      pcutr2 = passCustomTwosRight[1].fullname 
    end
    unless passCustomTwosRight[2].nil?  
      pcutr3 = passCustomTwosRight[2].fullname 
    end
    unless passCustomTwosRight[3].nil?  
      pcutr4 = passCustomTwosRight[3].fullname 
    end
    unless passCustomTwosRight[4].nil?  
      pcutr5 = passCustomTwosRight[4].fullname 
    end
    unless passCustomTwosRight[5].nil?  
      pcutr6 = passCustomTwosRight[5].fullname 
    end
    unless passCustomTwosRight[6].nil?  
      pcutr7 = passCustomTwosRight[6].fullname 
    end      
    unless passCustomTwosRight[7].nil?  
      pcutr8 = passCustomTwosRight[7].fullname 
    end
    unless passCustomTwosRight[8].nil?  
      pcutr9 = passCustomTwosRight[8].fullname 
    end
    unless passCustomTwosRight[9].nil?  
      pcutr10 = passCustomTwosRight[9].fullname 
    end
    unless passCustomTwosRight[10].nil?  
      pcutr11 = passCustomTwosRight[10].fullname 
    end
    unless passCustomTwosRight[11].nil?  
      pcutr12 = passCustomTwosRight[11].fullname 
    end
    unless passCustomTwosRight[12].nil?  
      pcutr13 = passCustomTwosRight[12].fullname 
    end
    unless passCustomTwosRight[13].nil?  
      pcutr14 = passCustomTwosRight[13].fullname 
    end   
    unless passCustomTwosRight[14].nil?  
      pcutr15 = passCustomTwosRight[14].fullname 
    end          

    #Number of user's run plays in situation 13
    num_cus2r = self.user.s_name13_num_run

    #Left Hash
    # cus2l_s0 
    if num_cus2r > 0
      cus2l_s0 = self.user.s_name13 + ' - Run'
    else
      cus2l_s0 = self.user.s_name13 + ' - Pass'
    end

    #cus2l_s1 
    if num_cus2r > 0
      cus2l_s1 = rcutl1
    else
      cus2l_s1 = pcutl1
    end

    #cus2l_s2
    if num_cus2r == 0
      cus2l_s2 = pcutl2
    elsif num_cus2r == 1
      cus2l_s2 = self.user.s_name13 + ' - Pass'
    else num_cus2r > 1
      cus2l_s2 = rcutl2
    end

    #cus2l_s3
    case num_cus2r
      when 0 then cus2l_s3 = pcutl3       
      when 1 then cus2l_s3 = pcutl1
      when 2 then cus2l_s3 = self.user.s_name13 + ' - Pass'
      when 3..100 then cus2l_s3 = rcutl3
    end

    #cus2l_s4
    case num_cus2r
      when 0 then cus2l_s4 = pcutl4       
      when 1 then cus2l_s4 = pcutl2
      when 2 then cus2l_s4 = pcutl1
      when 3 then cus2l_s4 = self.user.s_name13 + ' - Pass'
      when 4..100 then cus2l_s4 = rcutl4
    end

    #cus2l_s5
    case num_cus2r
      when 0 then cus2l_s5 = pcutl5       
      when 1 then cus2l_s5 = pcutl3
      when 2 then cus2l_s5 = pcutl2
      when 3 then cus2l_s5 = pcutl1
      when 4 then cus2l_s5 = self.user.s_name13 + ' - Pass'
      when 5..100 then cus2l_s5 = rcutl5
    end

    #cus2l_s6
    case num_cus2r
      when 0 then cus2l_s6 = pcutl6      
      when 1 then cus2l_s6 = pcutl4
      when 2 then cus2l_s6 = pcutl3
      when 3 then cus2l_s6 = pcutl2
      when 4 then cus2l_s6 = pcutl1
      when 5 then cus2l_s6 = self.user.s_name13 + ' - Pass'
      when 6..100 then cus2l_s6 = rcutl6
    end

    #cus2l_s7
    case num_cus2r
      when 0 then cus2l_s7 = pcutl7      
      when 1 then cus2l_s7 = pcutl5
      when 2 then cus2l_s7 = pcutl4
      when 3 then cus2l_s7 = pcutl3
      when 4 then cus2l_s7 = pcutl2
      when 5 then cus2l_s7 = pcutl1
      when 6 then cus2l_s7 = self.user.s_name13 + ' - Pass'
      when 7..100 then cus2l_s7 = rcutl7
    end

    #cus2l_s8
    case num_cus2r
      when 0 then cus2l_s8 = pcutl8      
      when 1 then cus2l_s8 = pcutl6
      when 2 then cus2l_s8 = pcutl5
      when 3 then cus2l_s8 = pcutl4
      when 4 then cus2l_s8 = pcutl3
      when 5 then cus2l_s8 = pcutl2
      when 6 then cus2l_s8 = pcutl1
      when 7 then cus2l_s8 = self.user.s_name13 + ' - Pass'
      when 8..100 then cus2l_s8 = rcutl8
    end

    #cus2l_s9
    case num_cus2r
      when 0 then cus2l_s9 = pcutl9      
      when 1 then cus2l_s9 = pcutl7
      when 2 then cus2l_s9 = pcutl6
      when 3 then cus2l_s9 = pcutl5
      when 4 then cus2l_s9 = pcutl4
      when 5 then cus2l_s9 = pcutl3
      when 6 then cus2l_s9 = pcutl2
      when 7 then cus2l_s9 = pcutl1
      when 8 then cus2l_s9 = self.user.s_name13 + ' - Pass'
      when 9..100 then cus2l_s9 = rcutl9
    end

    #cus2l_s10
    case num_cus2r
      when 0 then cus2l_s10 = pcutl10     
      when 1 then cus2l_s10 = pcutl8
      when 2 then cus2l_s10 = pcutl7
      when 3 then cus2l_s10 = pcutl6
      when 4 then cus2l_s10 = pcutl5
      when 5 then cus2l_s10 = pcutl4
      when 6 then cus2l_s10 = pcutl3
      when 7 then cus2l_s10 = pcutl2
      when 8 then cus2l_s10 = pcutl1
      when 9 then cus2l_s10 = self.user.s_name13 + ' - Pass'
      when 10..100 then cus2l_s10 = rcutl10
    end

    #cus2l_s11
    case num_cus2r
      when 0 then cus2l_s11 = pcutl11     
      when 1 then cus2l_s11 = pcutl9
      when 2 then cus2l_s11 = pcutl8
      when 3 then cus2l_s11 = pcutl7
      when 4 then cus2l_s11 = pcutl6
      when 5 then cus2l_s11 = pcutl5
      when 6 then cus2l_s11 = pcutl4
      when 7 then cus2l_s11 = pcutl3
      when 8 then cus2l_s11 = pcutl2
      when 9 then cus2l_s11 = pcutl1
      when 10 then cus2l_s11 = self.user.s_name13 + ' - Pass'
      when 11..100 then cus2l_s11 = rcutl11
    end

    #cus2l_s12
    case num_cus2r
      when 0 then cus2l_s12 = pcutl12    
      when 1 then cus2l_s12 = pcutl10
      when 2 then cus2l_s12 = pcutl9
      when 3 then cus2l_s12 = pcutl8
      when 4 then cus2l_s12 = pcutl7
      when 5 then cus2l_s12 = pcutl6
      when 6 then cus2l_s12 = pcutl5
      when 7 then cus2l_s12 = pcutl4
      when 8 then cus2l_s12 = pcutl3
      when 9 then cus2l_s12 = pcutl2
      when 10 then cus2l_s12 = pcutl1
      when 11 then cus2l_s12 = self.user.s_name13 + ' - Pass'
      when 12..100 then cus2l_s12 = rcutl12
    end

    #cus2l_s13
    case num_cus2r
      when 0 then cus2l_s13 = pcutl13    
      when 1 then cus2l_s13 = pcutl11
      when 2 then cus2l_s13 = pcutl10
      when 3 then cus2l_s13 = pcutl9
      when 4 then cus2l_s13 = pcutl8
      when 5 then cus2l_s13 = pcutl7
      when 6 then cus2l_s13 = pcutl6
      when 7 then cus2l_s13 = pcutl5
      when 8 then cus2l_s13 = pcutl4
      when 9 then cus2l_s13 = pcutl3
      when 10 then cus2l_s13 = pcutl2
      when 11 then cus2l_s13 = pcutl1
      when 12 then cus2l_s13 = self.user.s_name13 + ' - Pass'
      when 13..100 then cus2l_s13 = rcutl13
    end

    #cus2l_s14
    case num_cus2r
      when 0 then cus2l_s14 = pcutl14    
      when 1 then cus2l_s14 = pcutl12
      when 2 then cus2l_s14 = pcutl11
      when 3 then cus2l_s14 = pcutl10
      when 4 then cus2l_s14 = pcutl9
      when 5 then cus2l_s14 = pcutl8
      when 6 then cus2l_s14 = pcutl7
      when 7 then cus2l_s14 = pcutl6
      when 8 then cus2l_s14 = pcutl5
      when 9 then cus2l_s14 = pcutl4
      when 10 then cus2l_s14 = pcutl3
      when 11 then cus2l_s14 = pcutl2
      when 12 then cus2l_s14 = pcutl1  
      when 13 then cus2l_s14 = self.user.s_name13 + ' - Pass'
      when 14..100 then cus2l_s14 = rcutl14
    end

    #cus2l_s15
    case num_cus2r
      when 0 then cus2l_s15 = pcutl15    
      when 1 then cus2l_s15 = pcutl13
      when 2 then cus2l_s15 = pcutl12
      when 3 then cus2l_s15 = pcutl11
      when 4 then cus2l_s15 = pcutl10
      when 5 then cus2l_s15 = pcutl9
      when 6 then cus2l_s15 = pcutl8
      when 7 then cus2l_s15 = pcutl7
      when 8 then cus2l_s15 = pcutl6
      when 9 then cus2l_s15 = pcutl5
      when 10 then cus2l_s15 = pcutl4
      when 11 then cus2l_s15 = pcutl3
      when 12 then cus2l_s15 = pcutl2
      when 13 then cus2l_s15 = pcutl1  
      when 14..100 then cus2l_s15 = rcutl15
    end    


    #Right Hash
    # cus2r_s0 would always be blank

    #cus2r_s1 
    if num_cus2r > 0
      cus2r_s1 = rcutr1
    else
      cus2r_s1 = pcutr1
    end

    #cus2r_s2
    if num_cus2r == 0
      cus2r_s2 = pcutr2
    elsif num_cus2r == 1
      cus2r_s2 = ''
    else num_cus2r > 1
      cus2r_s2 = rcutr2
    end

    #cus2r_s3
    case num_cus2r
      when 0 then cus2r_s3 = pcutr3       
      when 1 then cus2r_s3 = pcutr1
      when 2 then cus2r_s3 = ''
      when 3..100 then cus2r_s3 = rcutr3
    end

    #cus2r_s4
    case num_cus2r
      when 0 then cus2r_s4 = pcutr4       
      when 1 then cus2r_s4 = pcutr2
      when 2 then cus2r_s4 = pcutr1
      when 3 then ''
      when 4..100 then cus2r_s4 = rcutr4
    end

    #cus2r_s5
    case num_cus2r
      when 0 then cus2r_s5 = pcutr5       
      when 1 then cus2r_s5 = pcutr3
      when 2 then cus2r_s5 = pcutr2
      when 3 then cus2r_s5 = pcutr1
      when 4 then cus2r_s5 = ''
      when 5..100 then cus2r_s5 = rcutr5
    end

    #cus2r_s6
    case num_cus2r
      when 0 then cus2r_s6 = pcutr6      
      when 1 then cus2r_s6 = pcutr4
      when 2 then cus2r_s6 = pcutr3
      when 3 then cus2r_s6 = pcutr2
      when 4 then cus2r_s6 = pcutr1
      when 5 then cus2r_s6 = ''
      when 6..100 then cus2r_s6 = rcutr6
    end

    #cus2r_s7
    case num_cus2r
      when 0 then cus2r_s7 = pcutr7      
      when 1 then cus2r_s7 = pcutr5
      when 2 then cus2r_s7 = pcutr4
      when 3 then cus2r_s7 = pcutr3
      when 4 then cus2r_s7 = pcutr2
      when 5 then cus2r_s7 = pcutr1
      when 6 then cus2r_s7 = ''
      when 7..100 then cus2r_s7 = rcutr7
    end

    #cus2r_s8
    case num_cus2r
      when 0 then cus2r_s8 = pcutr8      
      when 1 then cus2r_s8 = pcutr6
      when 2 then cus2r_s8 = pcutr5
      when 3 then cus2r_s8 = pcutr4
      when 4 then cus2r_s8 = pcutr3
      when 5 then cus2r_s8 = pcutr2
      when 6 then cus2r_s8 = pcutr1
      when 7 then cus2r_s8 = ''
      when 8..100 then cus2r_s8 = rcutr8
    end

    #cus2r_s9
    case num_cus2r
      when 0 then cus2r_s9 = pcutr9      
      when 1 then cus2r_s9 = pcutr7
      when 2 then cus2r_s9 = pcutr6
      when 3 then cus2r_s9 = pcutr5
      when 4 then cus2r_s9 = pcutr4
      when 5 then cus2r_s9 = pcutr3
      when 6 then cus2r_s9 = pcutr2
      when 7 then cus2r_s9 = pcutr1
      when 8 then cus2r_s9 = ''
      when 9..100 then cus2r_s9 = rcutr9
    end

    #cus2r_s10
    case num_cus2r
      when 0 then cus2r_s10 = pcutr10     
      when 1 then cus2r_s10 = pcutr8
      when 2 then cus2r_s10 = pcutr7
      when 3 then cus2r_s10 = pcutr6
      when 4 then cus2r_s10 = pcutr5
      when 5 then cus2r_s10 = pcutr4
      when 6 then cus2r_s10 = pcutr3
      when 7 then cus2r_s10 = pcutr2
      when 8 then cus2r_s10 = pcutr1
      when 9 then cus2r_s10 = ''
      when 10..100 then cus2r_s10 = rcutr10
    end

    #cus2r_s11
    case num_cus2r
      when 0 then cus2r_s11 = pcutr11     
      when 1 then cus2r_s11 = pcutr9
      when 2 then cus2r_s11 = pcutr8
      when 3 then cus2r_s11 = pcutr7
      when 4 then cus2r_s11 = pcutr6
      when 5 then cus2r_s11 = pcutr5
      when 6 then cus2r_s11 = pcutr4
      when 7 then cus2r_s11 = pcutr3
      when 8 then cus2r_s11 = pcutr2
      when 9 then cus2r_s11 = pcutr1
      when 10 then cus2r_s11 = ''
      when 11..100 then cus2r_s11 = rcutr11
    end

    #cus2r_s12
    case num_cus2r
      when 0 then cus2r_s12 = pcutr12    
      when 1 then cus2r_s12 = pcutr10
      when 2 then cus2r_s12 = pcutr9
      when 3 then cus2r_s12 = pcutr8
      when 4 then cus2r_s12 = pcutr7
      when 5 then cus2r_s12 = pcutr6
      when 6 then cus2r_s12 = pcutr5
      when 7 then cus2r_s12 = pcutr4
      when 8 then cus2r_s12 = pcutr3
      when 9 then cus2r_s12 = pcutr2
      when 10 then cus2r_s12 = pcutr1
      when 11 then cus2r_s12 = ''
      when 12..100 then cus2r_s12 = rcutr12
    end

    #cus2r_s13
    case num_cus2r
      when 0 then cus2r_s13 = pcutr13    
      when 1 then cus2r_s13 = pcutr11
      when 2 then cus2r_s13 = pcutr10
      when 3 then cus2r_s13 = pcutr9
      when 4 then cus2r_s13 = pcutr8
      when 5 then cus2r_s13 = pcutr7
      when 6 then cus2r_s13 = pcutr6
      when 7 then cus2r_s13 = pcutr5
      when 8 then cus2r_s13 = pcutr4
      when 9 then cus2r_s13 = pcutr3
      when 10 then cus2r_s13 = pcutr2
      when 11 then cus2r_s13 = pcutr1
      when 12 then cus2r_s13 = ''
      when 13..100 then cus2r_s13 = rcutr13
    end

    #cus2r_s14
    case num_cus2r
      when 0 then cus2r_s14 = pcutr14    
      when 1 then cus2r_s14 = pcutr12
      when 2 then cus2r_s14 = pcutr11
      when 3 then cus2r_s14 = pcutr10
      when 4 then cus2r_s14 = pcutr9
      when 5 then cus2r_s14 = pcutr8
      when 6 then cus2r_s14 = pcutr7
      when 7 then cus2r_s14 = pcutr6
      when 8 then cus2r_s14 = pcutr5
      when 9 then cus2r_s14 = pcutr4
      when 10 then cus2r_s14 = pcutr3
      when 11 then cus2r_s14 = pcutr2
      when 12 then cus2r_s14 = pcutr1  
      when 13 then cus2r_s14 = ''
      when 14..100 then cus2r_s14 = rcutr14
    end

    #cus2r_s15
    case num_cus2r
      when 0 then cus2r_s15 = pcutr15    
      when 1 then cus2r_s15 = pcutr13
      when 2 then cus2r_s15 = pcutr12
      when 3 then cus2r_s15 = pcutr11
      when 4 then cus2r_s15 = pcutr10
      when 5 then cus2r_s15 = pcutr9
      when 6 then cus2r_s15 = pcutr8
      when 7 then cus2r_s15 = pcutr7
      when 8 then cus2r_s15 = pcutr6
      when 9 then cus2r_s15 = pcutr5
      when 10 then cus2r_s15 = pcutr4
      when 11 then cus2r_s15 = pcutr3
      when 12 then cus2r_s15 = pcutr2
      when 13 then cus2r_s15 = pcutr1  
      when 14..100 then cus2r_s15 = rcutr15
    end       
    #----------End Custom 2---------- 

    #----------Custom 3----------
    customThrees = event.plays.where('situation14 = ?', true)
    customThreesLeft = customThrees.where('hash_mark = ?', 'Left')
    customThreesRight = customThrees.where('hash_mark = ?', 'Right')
     
    #Left Hash
    unless customThreesLeft[0].nil?  
      cuthl1 = customThreesLeft[0].fullname 
    end
    unless customThreesLeft[1].nil?  
      cuthl2 = customThreesLeft[1].fullname 
    end
    unless customThreesLeft[2].nil?  
      cuthl3 = customThreesLeft[2].fullname 
    end
    unless customThreesLeft[3].nil?  
      cuthl4 = customThreesLeft[3].fullname 
    end
    unless customThreesLeft[4].nil?  
      cuthl5 = customThreesLeft[4].fullname
    end
    unless customThreesLeft[5].nil?  
      cuthl6 = customThreesLeft[5].fullname 
    end
    unless customThreesLeft[6].nil?  
      cuthl7 = customThreesLeft[6].fullname
    end    
    unless customThreesLeft[7].nil?  
      cuthl8 = customThreesLeft[7].fullname 
    end
    unless customThreesLeft[8].nil?  
      cuthl9 = customThreesLeft[8].fullname 
    end
    unless customThreesLeft[9].nil?  
      cuthl10 = customThreesLeft[9].fullname 
    end
    unless customThreesLeft[10].nil?  
      cuthl11 = customThreesLeft[10].fullname 
    end
    unless customThreesLeft[11].nil?  
      cuthl12 = customThreesLeft[11].fullname
    end
    unless customThreesLeft[12].nil?  
      cuthl13 = customThreesLeft[12].fullname 
    end
    unless customThreesLeft[13].nil?  
      cuthl14 = customThreesLeft[13].fullname
    end   
    unless customThreesLeft[14].nil?  
      cuthl15 = customThreesLeft[14].fullname
    end 

    #Right Hash
    unless customThreesRight[0].nil?  
      cuthr1 = customThreesRight[0].fullname 
    end
    unless customThreesRight[1].nil?  
      cuthr2 = customThreesRight[1].fullname 
    end
    unless customThreesRight[2].nil?  
      cuthr3 = customThreesRight[2].fullname 
    end
    unless customThreesRight[3].nil?  
      cuthr4 = customThreesRight[3].fullname 
    end
    unless customThreesRight[4].nil?  
      cuthr5 = customThreesRight[4].fullname
    end
    unless customThreesRight[5].nil?  
      cuthr6 = customThreesRight[5].fullname 
    end
    unless customThreesRight[6].nil?  
      cuthr7 = customThreesRight[6].fullname
    end    
    unless customThreesRight[7].nil?  
      cuthr8 = customThreesRight[7].fullname 
    end
    unless customThreesRight[8].nil?  
      cuthr9 = customThreesRight[8].fullname 
    end
    unless customThreesRight[9].nil?  
      cuthr10 = customThreesRight[9].fullname 
    end
    unless customThreesRight[10].nil?  
      cuthr11 = customThreesRight[10].fullname 
    end
    unless customThreesRight[11].nil?  
      cuthr12 = customThreesRight[11].fullname
    end
    unless customThreesRight[12].nil?  
      cuthr13 = customThreesRight[12].fullname 
    end
    unless customThreesRight[13].nil?  
      cuthr14 = customThreesRight[13].fullname
    end 
    unless customThreesRight[14].nil?  
      cuthr15 = customThreesRight[14].fullname
    end 
    #----------End Custom 3----------                 

    self.update :gdata => "[
    ['#{title}', '', '', ''],
    ['#{self.user.s_name1}', '', '#{ftl_s0}', ''],
    ['#{openl1}', '#{openr1}', '#{ftl_s1}', '#{ftr_s1}'],
    ['#{openl2}', '#{openr2}', '#{ftl_s2}', '#{ftr_s2}'],
    ['#{openl3}', '#{openr3}', '#{ftl_s3}', '#{ftr_s3}'],
    ['#{openl4}', '#{openr4}', '#{ftl_s4}', '#{ftr_s4}'],
    ['#{openl5}', '#{openr5}', '#{ftl_s5}', '#{ftr_s5}'],
    ['#{openl6}', '#{openr6}', '#{ftl_s6}', '#{ftr_s6}'],
    ['#{openl7}', '#{openr7}', '#{ftl_s7}', '#{ftr_s7}'],    
    ['#{openl8}', '#{openr8}', '#{ftl_s8}', '#{ftr_s8}'],
    ['#{openl9}', '#{openr9}', '#{ftl_s9}', '#{ftr_s9}'],
    ['#{openl10}', '#{openr10}', '#{ftl_s10}', '#{ftr_s10}'],
    ['#{openl11}', '#{openr11}', '#{ftl_s11}', '#{ftr_s11}'],
    ['#{openl12}', '#{openr12}', '#{ftl_s12}', '#{ftr_s12}'],
    ['#{openl13}', '#{openr13}', '#{ftl_s13}', '#{ftr_s13}'],
    ['#{openl14}', '#{openr14}', '#{ftl_s14}', '#{ftr_s14}'],
    ['#{openl15}', '#{openr15}', '#{ftl_s15}', '#{ftr_s15}'],
    ['#{sll_s0}', '', '#{tll_s0}', ''],
    ['#{sll_s1}', '#{slr_s1}', '#{tll_s1}', '#{tlr_s1}'],
    ['#{sll_s2}', '#{slr_s2}', '#{tll_s2}', '#{tlr_s2}'],
    ['#{sll_s3}', '#{slr_s3}', '#{tll_s3}', '#{tlr_s3}'],
    ['#{sll_s4}', '#{slr_s4}', '#{tll_s4}', '#{tlr_s4}'],
    ['#{sll_s5}', '#{slr_s5}', '#{tll_s5}', '#{tlr_s5}'],
    ['#{sll_s6}', '#{slr_s6}', '#{tll_s6}', '#{tlr_s6}'],
    ['#{sll_s7}', '#{slr_s7}', '#{tll_s7}', '#{tlr_s7}'],
    ['#{sll_s8}', '#{slr_s8}', '#{tll_s8}', '#{tlr_s8}'],
    ['#{sll_s9}', '#{slr_s9}', '#{tll_s9}', '#{tlr_s9}'],
    ['#{sll_s10}', '#{slr_s10}', '#{tll_s10}', '#{tlr_s10}'],
    ['#{sll_s11}', '#{slr_s11}', '#{tll_s11}', '#{tlr_s11}'],
    ['#{sll_s12}', '#{slr_s12}', '#{tll_s12}', '#{tlr_s12}'],
    ['#{secondmdl_s0}', '', '#{thirdmdl_s0 }', ''],
    ['#{secondmdl_s1}', '#{secondmdr_s1}', '#{thirdmdl_s1 }', '#{thirdmdr_s1}'],
    ['#{secondmdl_s2}', '#{secondmdr_s2}', '#{thirdmdl_s2}', '#{thirdmdr_s2}'],
    ['#{secondmdl_s3}', '#{secondmdr_s3}', '#{thirdmdl_s3}', '#{thirdmdr_s3}'],
    ['#{secondmdl_s4}', '#{secondmdr_s4}', '#{thirdmdl_s4}', '#{thirdmdr_s4}'],
    ['#{secondmdl_s5}', '#{secondmdr_s5}', '#{thirdmdl_s5}', '#{thirdmdr_s5}'],
    ['#{secondmdl_s6}', '#{secondmdr_s6}', '#{thirdmdl_s6}', '#{thirdmdr_s6}'],
    ['#{secondmdl_s7}', '#{secondmdr_s7}', '#{thirdmdl_s7}', '#{thirdmdr_s7}'],
    ['#{secondmdl_s8}', '#{secondmdr_s8}', '#{thirdmdl_s8}', '#{thirdmdr_s8}'],
    ['#{secondmdl_s9}', '#{secondmdr_s9}', '#{thirdmdl_s9}', '#{thirdmdr_s9}'],
    ['#{secondmdl_s10}', '#{secondmdr_s10}', '#{thirdmdl_s10}', '#{thirdmdr_s10}'],
    ['#{secondmdl_s11}', '#{secondmdr_s11}', '#{thirdmdl_s11}', '#{thirdmdr_s11}'],
    ['#{secondstl_s0}', '', '#{thirdstl_s0}', ''],
    ['#{secondstl_s1}', '#{secondstr_s1}', '#{thirdstl_s1}', '#{thirdstr_s1}'],
    ['#{secondstl_s2}', '#{secondstr_s2}', '#{thirdstl_s2}', '#{thirdstr_s2}'],
    ['#{secondstl_s3}', '#{secondstr_s3}', '#{thirdstl_s3}', '#{thirdstr_s3}'],
    ['#{secondstl_s4}', '#{secondstr_s4}', '#{thirdstl_s4}', '#{thirdstr_s4}'],
    ['#{secondstl_s5}', '#{secondstr_s5}', '#{thirdstl_s5}', '#{thirdstr_s5}'],
    ['#{secondstl_s6}', '#{secondstr_s6}', '#{thirdstl_s6}', '#{thirdstr_s6}'],
    ['#{secondstl_s7}', '#{secondstr_s7}', '#{thirdstl_s7}', '#{thirdstr_s7}'],
    ['#{secondstl_s8}', '#{secondstr_s8}', '#{thirdstl_s8}', '#{thirdstr_s8}'],
    ['#{secondstl_s9}', '#{secondstr_s9}', '#{thirdstl_s9}', '#{thirdstr_s9}'],
    ['#{secondstl_s10}', '#{secondstr_s10}', '#{thirdstl_s10}', '#{thirdstr_s10}'],
    ['#{secondstl_s11}', '#{secondstr_s11}', '#{thirdstl_s11}', '#{thirdstr_s11}']
    ]"

    self.update :gdata2 => "[ 
    ['Page Two', '', '', ''],
    ['#{rzonel_s0}', '', '#{glinel_s0}', ''],
    ['#{rzonel_s1}', '#{rzoner_s1}', '#{glinel_s1}', '#{gliner_s1}'],
    ['#{rzonel_s2}', '#{rzoner_s2}', '#{glinel_s2}', '#{gliner_s2}'],
    ['#{rzonel_s3}', '#{rzoner_s3}', '#{glinel_s3}', '#{gliner_s3}'],
    ['#{rzonel_s4}', '#{rzoner_s4}', '#{glinel_s4}', '#{gliner_s4}'],
    ['#{rzonel_s5}', '#{rzoner_s5}', '#{glinel_s5}', '#{gliner_s5}'],
    ['#{rzonel_s6}', '#{rzoner_s6}', '#{glinel_s6}', '#{gliner_s6}'],
    ['#{rzonel_s7}', '#{rzoner_s7}', '#{glinel_s7}', '#{gliner_s7}'],
    ['#{rzonel_s8}', '#{rzoner_s8}', '#{glinel_s8}', '#{gliner_s8}'],
    ['#{rzonel_s9}', '#{rzoner_s9}', '#{glinel_s9}', '#{gliner_s9}'],
    ['#{rzonel_s10}', '#{rzoner_s10}', '#{glinel_s10}', '#{gliner_s10}'],
    ['#{rzonel_s11}', '#{rzoner_s11}', '#{glinel_s11}', '#{gliner_s11}'],
    ['#{rzonel_s12}', '#{rzoner_s12}', '#{glinel_s12}', '#{gliner_s12}'],
    ['#{rzonel_s13}', '#{rzoner_s13}', '#{glinel_s13}', '#{gliner_s13}'],
    ['#{rzonel_s14}', '#{rzoner_s14}', '#{glinel_s14}', '#{gliner_s14}'],
    ['#{rzonel_s15}', '#{rzoner_s15}', '#{glinel_s15}', '#{gliner_s15}'],
    ['#{coutl_s0}', '', '#{cus1l_s0}', ''],
    ['#{coutl_s1}', '#{coutr_s1}', '#{cus1l_s1}', '#{cus1r_s1}'],
    ['#{coutl_s2}', '#{coutr_s2}', '#{cus1l_s2}', '#{cus1r_s2}'],
    ['#{coutl_s3}', '#{coutr_s3}', '#{cus1l_s3}', '#{cus1r_s3}'],
    ['#{coutl_s4}', '#{coutr_s4}', '#{cus1l_s4}', '#{cus1r_s4}'],
    ['#{coutl_s5}', '#{coutr_s5}', '#{cus1l_s5}', '#{cus1r_s5}'],
    ['#{coutl_s6}', '#{coutr_s6}', '#{cus1l_s6}', '#{cus1r_s6}'],
    ['#{coutl_s7}', '#{coutr_s7}', '#{cus1l_s7}', '#{cus1r_s7}'],
    ['#{coutl_s8}', '#{coutr_s8}', '#{cus1l_s8}', '#{cus1r_s8}'],
    ['#{coutl_s9}', '#{coutr_s9}', '#{cus1l_s9}', '#{cus1r_s9}'],
    ['#{coutl_s10}', '#{coutr_s10}', '#{cus1l_s10}', '#{cus1r_s10}'],
    ['#{coutl_s11}', '#{coutr_s11}', '#{cus1l_s11}', '#{cus1r_s11}'],
    ['#{coutl_s12}', '#{coutr_s12}', '#{cus1l_s12}', '#{cus1r_s12}'],
    ['#{coutl_s13}', '#{coutr_s13}', '#{cus1l_s13}', '#{cus1r_s13}'],
    ['#{coutl_s14}', '#{coutr_s14}', '#{cus1l_s14}', '#{cus1r_s14}'],
    ['#{coutl_s15}', '#{coutr_s15}', '#{cus1l_s15}', '#{cus1r_s15}'],
    ['#{cus2l_s0}', '', '#{self.user.s_name14}', ''],
    ['#{cus2l_s1}', '#{cus2r_s1}', '#{cuthl1}', '#{cuthr1}'],
    ['#{cus2l_s2}', '#{cus2r_s2}', '#{cuthl2}', '#{cuthr2}'],
    ['#{cus2l_s3}', '#{cus2r_s3}', '#{cuthl3}', '#{cuthr3}'],
    ['#{cus2l_s4}', '#{cus2r_s4}', '#{cuthl4}', '#{cuthr4}'],
    ['#{cus2l_s5}', '#{cus2r_s5}', '#{cuthl5}', '#{cuthr5}'],
    ['#{cus2l_s6}', '#{cus2r_s6}', '#{cuthl6}', '#{cuthr6}'],
    ['#{cus2l_s7}', '#{cus2r_s7}', '#{cuthl7}', '#{cuthr7}'],
    ['#{cus2l_s8}', '#{cus2r_s8}', '#{cuthl8}', '#{cuthr8}'],
    ['#{cus2l_s9}', '#{cus2r_s9}', '#{cuthl9}', '#{cuthr9}'],
    ['#{cus2l_s10}', '#{cus2r_s10}', '#{cuthl10}', '#{cuthr10}'],
    ['#{cus2l_s11}', '#{cus2r_s11}', '#{cuthl11}', '#{cuthr11}'],
    ['#{cus2l_s12}', '#{cus2r_s12}', '#{cuthl12}', '#{cuthr12}'],
    ['#{cus2l_s13}', '#{cus2r_s13}', '#{cuthl13}', '#{cuthr13}'],
    ['#{cus2l_s14}', '#{cus2r_s14}', '#{cuthl14}', '#{cuthr14}'],
    ['#{cus2l_s15}', '#{cus2r_s15}', '#{cuthl15}', '#{cuthr15}']
    ]"   
  end

end
