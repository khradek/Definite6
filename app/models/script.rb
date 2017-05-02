class Script < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s-_@#&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  validates :start_time, :end_time, :presence => true	
  
	belongs_to :event
	belongs_to :user

	after_create :make_event
  after_create :use_default_script, if: :standard_template
  after_create :use_custom_script, if: :custom_template
  after_create :use_custom_script2, if: :custom_template2
  after_create :use_custom_script3, if: :custom_template3  
	before_update :update_event
	after_destroy :delete_event

  before_validation :set_end_time
 

  def standard_template
    script_template == "Standard"
  end 

  def custom_template
    script_template == "Custom"
  end

  def custom_template2
    script_template == "Custom2"
  end

  def custom_template3
    script_template == "Custom3"
  end

  #Sets the initial end date to equal the start date
  def set_end_time
    if end_time.nil?
      self.end_time = start_time
    end
  end

	#Creates an event in the calendar for the script
	def make_event
		Event.create :user_id => self.user_id, :script_tag => self.id, :install_event_id => self.event_id, :title => self.title, :start_time => self.start_time, :end_time => self.end_time, :event_type => "Script"
	end

	#Updates the calendar event when the script is updated
	def update_event
		cal_event = Event.find_by(script_tag: self.id)
		if cal_event.title != self.title || cal_event.start_time != self.start_time || cal_event.end_time != self.end_time
			cal_event.update :title => self.title, :start_time => self.start_time, :end_time => self.start_time 
		end	 		 
	end

	#Deletes the calendar event when the script is deleted
	def delete_event
		cal_event = Event.find_by(script_tag: self.id)
		cal_event.destroy if cal_event
	end

  #Sets the initial script (custom1) when created
  def use_custom_script
    event = Event.find_by(id: self.event_id)
    default_script = DefaultScript.find_by(user_id: self.user_id)
    run_plays = event.plays.where('play_type = ?', "Run")
    pass_plays = event.plays.where('play_type = ?', "Pass")
    new_data = default_script.us_data

    unless run_plays[0].nil?
      run_play1 = run_plays[0].fullname
    end
    unless run_plays[1].nil?
      run_play2 = run_plays[1].fullname
    end
    unless run_plays[2].nil?
      run_play3 = run_plays[2].fullname
    end
    unless run_plays[3].nil?
      run_play4 = run_plays[3].fullname
    end
    unless run_plays[4].nil?
      run_play5 = run_plays[4].fullname
    end
    unless run_plays[5].nil?
      run_play6 = run_plays[5].fullname
    end
    unless run_plays[6].nil?
      run_play7 = run_plays[6].fullname
    end
    unless run_plays[7].nil?
      run_play8 = run_plays[7].fullname
    end        
    unless run_plays[8].nil?
      run_play9 = run_plays[8].fullname
    end
    unless run_plays[9].nil?
      run_play10 = run_plays[9].fullname
    end
    unless run_plays[10].nil?
      run_play11 = run_plays[10].fullname
    end 
    unless run_plays[11].nil?
      run_play12 = run_plays[11].fullname
    end
    unless run_plays[12].nil?
      run_play13 = run_plays[12].fullname
    end
    unless run_plays[13].nil?
      run_play14 = run_plays[13].fullname
    end
    unless run_plays[14].nil?
      run_play15 = run_plays[14].fullname
    end
    unless run_plays[15].nil?
      run_play16 = run_plays[15].fullname
    end
    unless run_plays[16].nil?
      run_play17 = run_plays[16].fullname
    end
    unless run_plays[17].nil?
      run_play18 = run_plays[17].fullname
    end
    unless run_plays[18].nil?
      run_play19 = run_plays[18].fullname
    end        
    unless run_plays[19].nil?
      run_play20 = run_plays[19].fullname
    end
    unless run_plays[20].nil?
      run_play21 = run_plays[20].fullname
    end
    unless run_plays[21].nil?
      run_play22 = run_plays[21].fullname
    end
    unless run_plays[22].nil?
      run_play23 = run_plays[22].fullname
    end 
    unless run_plays[23].nil?
      run_play24 = run_plays[23].fullname
    end
    unless run_plays[24].nil?
      run_play25 = run_plays[24].fullname
    end
    unless run_plays[25].nil?
      run_play26 = run_plays[25].fullname
    end
    unless run_plays[26].nil?
      run_play27 = run_plays[26].fullname
    end
    unless run_plays[27].nil?
      run_play28 = run_plays[27].fullname
    end
    unless run_plays[28].nil?
      run_play29 = run_plays[28].fullname
    end
    unless run_plays[29].nil?
      run_play30 = run_plays[29].fullname
    end
    unless run_plays[30].nil?
      run_play31 = run_plays[30].fullname
    end        
    unless run_plays[31].nil?
      run_play32 = run_plays[31].fullname
    end
    unless run_plays[32].nil?
      run_play33 = run_plays[32].fullname
    end
    unless run_plays[33].nil?
      run_play34 = run_plays[33].fullname
    end
    unless run_plays[34].nil?
      run_play35 = run_plays[34].fullname
    end        
    unless run_plays[35].nil?
      run_play36 = run_plays[35].fullname
    end
    unless run_plays[36].nil?
      run_play37 = run_plays[36].fullname
    end
    unless run_plays[37].nil?
      run_play38 = run_plays[37].fullname
    end
    unless run_plays[38].nil?
      run_play39 = run_plays[38].fullname
    end 
    unless run_plays[39].nil?
      run_play40 = run_plays[39].fullname
    end
    unless run_plays[40].nil?
      run_play41 = run_plays[40].fullname
    end
    unless run_plays[41].nil?
      run_play42 = run_plays[41].fullname
    end
    unless run_plays[42].nil?
      run_play43 = run_plays[42].fullname
    end
    unless run_plays[43].nil?
      run_play44 = run_plays[43].fullname
    end
    unless run_plays[44].nil?
      run_play45 = run_plays[44].fullname
    end
    unless run_plays[45].nil?
      run_play46 = run_plays[45].fullname
    end
    unless run_plays[46].nil?
      run_play47 = run_plays[46].fullname
    end        
    unless run_plays[47].nil?
      run_play48 = run_plays[47].fullname
    end
    unless run_plays[48].nil?
      run_play49 = run_plays[48].fullname
    end
    unless run_plays[49].nil?
      run_play50 = run_plays[49].fullname
    end
    unless run_plays[50].nil?
      run_play51 = run_plays[50].fullname
    end
    unless run_plays[51].nil?
      run_play52 = run_plays[51].fullname
    end
    unless pass_plays[0].nil?
      pass_play1 = pass_plays[0].fullname
    end
    unless pass_plays[1].nil?
      pass_play2 = pass_plays[1].fullname
    end
    unless pass_plays[2].nil?
      pass_play3 = pass_plays[2].fullname
    end
    unless pass_plays[3].nil?
      pass_play4 = pass_plays[3].fullname
    end
    unless pass_plays[4].nil?
      pass_play5 = pass_plays[4].fullname
    end
    unless pass_plays[5].nil?
      pass_play6 = pass_plays[5].fullname
    end
    unless pass_plays[6].nil?
      pass_play7 = pass_plays[6].fullname
    end
    unless pass_plays[7].nil?
      pass_play8 = pass_plays[7].fullname
    end        
    unless pass_plays[8].nil?
      pass_play9 = pass_plays[8].fullname
    end
    unless pass_plays[9].nil?
      pass_play10 = pass_plays[9].fullname
    end
    unless pass_plays[10].nil?
      pass_play11 = pass_plays[10].fullname
    end 
    unless pass_plays[11].nil?
      pass_play12 = pass_plays[11].fullname
    end
    unless pass_plays[12].nil?
      pass_play13 = pass_plays[12].fullname
    end
    unless pass_plays[13].nil?
      pass_play14 = pass_plays[13].fullname
    end
    unless pass_plays[14].nil?
      pass_play15 = pass_plays[14].fullname
    end
    unless pass_plays[15].nil?
      pass_play16 = pass_plays[15].fullname
    end
    unless pass_plays[16].nil?
      pass_play17 = pass_plays[16].fullname
    end
    unless pass_plays[17].nil?
      pass_play18 = pass_plays[17].fullname
    end
    unless pass_plays[18].nil?
      pass_play19 = pass_plays[18].fullname
    end        
    unless pass_plays[19].nil?
      pass_play20 = pass_plays[19].fullname
    end
    unless pass_plays[20].nil?
      pass_play21 = pass_plays[20].fullname
    end
    unless pass_plays[21].nil?
      pass_play22 = pass_plays[21].fullname
    end
    unless pass_plays[22].nil?
      pass_play23 = pass_plays[22].fullname
    end 
    unless pass_plays[23].nil?
      pass_play24 = pass_plays[23].fullname
    end
    unless pass_plays[24].nil?
      pass_play25 = pass_plays[24].fullname
    end
    unless pass_plays[25].nil?
      pass_play26 = pass_plays[25].fullname
    end
    unless pass_plays[26].nil?
      pass_play27 = pass_plays[26].fullname
    end
    unless pass_plays[27].nil?
      pass_play28 = pass_plays[27].fullname
    end
    unless pass_plays[28].nil?
      pass_play29 = pass_plays[28].fullname
    end
    unless pass_plays[29].nil?
      pass_play30 = pass_plays[29].fullname
    end
    unless pass_plays[30].nil?
      pass_play31 = pass_plays[30].fullname
    end        
    unless pass_plays[31].nil?
      pass_play32 = pass_plays[31].fullname
    end
    unless pass_plays[32].nil?
      pass_play33 = pass_plays[32].fullname
    end
    unless pass_plays[33].nil?
      pass_play34 = pass_plays[33].fullname
    end
    unless pass_plays[34].nil?
      pass_play35 = pass_plays[34].fullname
    end        
    unless pass_plays[35].nil?
      pass_play36 = pass_plays[35].fullname
    end
    unless pass_plays[36].nil?
      pass_play37 = pass_plays[36].fullname
    end
    unless pass_plays[37].nil?
      pass_play38 = pass_plays[37].fullname
    end
    unless pass_plays[38].nil?
      pass_play39 = pass_plays[38].fullname
    end 
    unless pass_plays[39].nil?
      pass_play40 = pass_plays[39].fullname
    end
    unless pass_plays[40].nil?
      pass_play41 = pass_plays[40].fullname
    end
    unless pass_plays[41].nil?
      pass_play42 = pass_plays[41].fullname
    end
    unless pass_plays[42].nil?
      pass_play43 = pass_plays[42].fullname
    end
    unless pass_plays[43].nil?
      pass_play44 = pass_plays[43].fullname
    end
    unless pass_plays[44].nil?
      pass_play45 = pass_plays[44].fullname
    end
    unless pass_plays[45].nil?
      pass_play46 = pass_plays[45].fullname
    end
    unless pass_plays[46].nil?
      pass_play47 = pass_plays[46].fullname
    end        
    unless pass_plays[47].nil?
      pass_play48 = pass_plays[47].fullname
    end
    unless pass_plays[48].nil?
      pass_play49 = pass_plays[48].fullname
    end
    unless pass_plays[49].nil?
      pass_play50 = pass_plays[49].fullname
    end
    unless pass_plays[50].nil?
      pass_play51 = pass_plays[50].fullname
    end
    unless pass_plays[51].nil?
      pass_play52 = pass_plays[51].fullname
    end
    

    if run_play1.nil?
      new_data.gsub! /Run Play 1\b/, " "
    else
      new_data.gsub! /Run Play 1\b/, run_play1 
    end 
    if run_play2.nil?
      new_data.gsub! /Run Play 2\b/, " "
    else
      new_data.gsub! /Run Play 2\b/, run_play2 
    end   
    if run_play3.nil?
      new_data.gsub! /Run Play 3\b/, " "
    else
      new_data.gsub! /Run Play 3\b/, run_play3 
    end 
    if run_play4.nil?
      new_data.gsub! /Run Play 4\b/, " "
    else
      new_data.gsub! /Run Play 4\b/, run_play4 
    end 
    if run_play5.nil?
      new_data.gsub! /Run Play 5\b/, " "
    else
      new_data.gsub! /Run Play 5\b/, run_play5 
    end 
    if run_play6.nil?
      new_data.gsub! /Run Play 6\b/, " "
    else
      new_data.gsub! /Run Play 6\b/, run_play6 
    end 
    if run_play7.nil?
      new_data.gsub! /Run Play 7\b/, " "
    else
      new_data.gsub! /Run Play 7\b/, run_play7 
    end                     
    if run_play8.nil?
      new_data.gsub! /Run Play 8\b/, " "
    else
      new_data.gsub! /Run Play 8\b/, run_play8
    end    
    if run_play9.nil?
      new_data.gsub! /Run Play 9\b/, " "
    else
      new_data.gsub! /Run Play 9\b/, run_play9 
    end    
    if run_play10.nil?
      new_data.gsub! /Run Play 10\b/, " "
    else
      new_data.gsub! /Run Play 10\b/, run_play10 
    end 
    if run_play11.nil?
      new_data.gsub! /Run Play 11\b/, " "
    else
      new_data.gsub! /Run Play 11\b/, run_play11 
    end 
    if run_play12.nil?
      new_data.gsub! /Run Play 12\b/, " "
    else
      new_data.gsub! /Run Play 12\b/, run_play12 
    end   
    if run_play13.nil?
      new_data.gsub! /Run Play 13\b/, " "
    else
      new_data.gsub! /Run Play 13\b/, run_play13 
    end 
    if run_play14.nil?
      new_data.gsub! /Run Play 14\b/, " "
    else
      new_data.gsub! /Run Play 14\b/, run_play14 
    end 
    if run_play15.nil?
      new_data.gsub! /Run Play 15\b/, " "
    else
      new_data.gsub! /Run Play 15\b/, run_play15 
    end 
    if run_play16.nil?
      new_data.gsub! /Run Play 16\b/, " "
    else
      new_data.gsub! /Run Play 16\b/, run_play16 
    end 
    if run_play17.nil?
      new_data.gsub! /Run Play 17\b/, " "
    else
      new_data.gsub! /Run Play 17\b/, run_play17 
    end                     
    if run_play18.nil?
      new_data.gsub! /Run Play 18\b/, " "
    else
      new_data.gsub! /Run Play 18\b/, run_play18
    end    
    if run_play19.nil?
      new_data.gsub! /Run Play 19\b/, " "
    else
      new_data.gsub! /Run Play 19\b/, run_play19 
    end    
    if run_play20.nil?
      new_data.gsub! /Run Play 20\b/, " "
    else
      new_data.gsub! /Run Play 20\b/, run_play20 
    end 
    if run_play21.nil?
      new_data.gsub! /Run Play 21\b/, " "
    else
      new_data.gsub! /Run Play 21\b/, run_play21 
    end 
    if run_play22.nil?
      new_data.gsub! /Run Play 22\b/, " "
    else
      new_data.gsub! /Run Play 22\b/, run_play22 
    end   
    if run_play23.nil?
      new_data.gsub! /Run Play 23\b/, " "
    else
      new_data.gsub! /Run Play 23\b/, run_play23 
    end 
    if run_play24.nil?
      new_data.gsub! /Run Play 24\b/, " "
    else
      new_data.gsub! /Run Play 24\b/, run_play24 
    end 
    if run_play25.nil?
      new_data.gsub! /Run Play 25\b/, " "
    else
      new_data.gsub! /Run Play 25\b/, run_play25 
    end 
    if run_play26.nil?
      new_data.gsub! /Run Play 26\b/, " "
    else
      new_data.gsub! /Run Play 26\b/, run_play26 
    end 
    if run_play27.nil?
      new_data.gsub! /Run Play 27\b/, " "
    else
      new_data.gsub! /Run Play 27\b/, run_play27 
    end                     
    if run_play28.nil?
      new_data.gsub! /Run Play 28\b/, " "
    else
      new_data.gsub! /Run Play 28\b/, run_play28
    end    
    if run_play29.nil?
      new_data.gsub! /Run Play 29\b/, " "
    else
      new_data.gsub! /Run Play 29\b/, run_play29 
    end 
    if run_play30.nil?
      new_data.gsub! /Run Play 30\b/, " "
    else
      new_data.gsub! /Run Play 30\b/, run_play30 
    end 
    if run_play31.nil?
      new_data.gsub! /Run Play 31\b/, " "
    else
      new_data.gsub! /Run Play 31\b/, run_play31 
    end 
    if run_play32.nil?
      new_data.gsub! /Run Play 32\b/, " "
    else
      new_data.gsub! /Run Play 32\b/, run_play32 
    end    
    if run_play33.nil?
      new_data.gsub! /Run Play 33\b/, " "
    else
      new_data.gsub! /Run Play 33\b/, run_play33 
    end 
    if run_play34.nil?
      new_data.gsub! /Run Play 34\b/, " "
    else
      new_data.gsub! /Run Play 34\b/, run_play34 
    end 
    if run_play35.nil?
      new_data.gsub! /Run Play 35\b/, " "
    else
      new_data.gsub! /Run Play 35\b/, run_play35 
    end 
    if run_play36.nil?
      new_data.gsub! /Run Play 36\b/, " "
    else
      new_data.gsub! /Run Play 36\b/, run_play36 
    end 
    if run_play37.nil?
      new_data.gsub! /Run Play 37\b/, " "
    else
      new_data.gsub! /Run Play 37\b/, run_play37 
    end                     
    if run_play38.nil?
      new_data.gsub! /Run Play 38\b/, " "
    else
      new_data.gsub! /Run Play 38\b/, run_play38
    end    
    if run_play39.nil?
      new_data.gsub! /Run Play 39\b/, " "
    else
      new_data.gsub! /Run Play 39\b/, run_play39 
    end  
    if run_play40.nil?
      new_data.gsub! /Run Play 40\b/, " "
    else
      new_data.gsub! /Run Play 40\b/, run_play40 
    end 
    if run_play41.nil?
      new_data.gsub! /Run Play 41\b/, " "
    else
      new_data.gsub! /Run Play 41\b/, run_play41 
    end 
    if run_play42.nil?
      new_data.gsub! /Run Play 42\b/, " "
    else
      new_data.gsub! /Run Play 42\b/, run_play42 
    end    
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play45.nil?
      new_data.gsub! /Run Play 45\b/, " "
    else
      new_data.gsub! /Run Play 45\b/, run_play45 
    end 
    if run_play46.nil?
      new_data.gsub! /Run Play 46\b/, " "
    else
      new_data.gsub! /Run Play 46\b/, run_play46 
    end 
    if run_play47.nil?
      new_data.gsub! /Run Play 47\b/, " "
    else
      new_data.gsub! /Run Play 47\b/, run_play47 
    end                     
    if run_play48.nil?
      new_data.gsub! /Run Play 48\b/, " "
    else
      new_data.gsub! /Run Play 48\b/, run_play48
    end    
    if run_play49.nil?
      new_data.gsub! /Run Play 49\b/, " "
    else
      new_data.gsub! /Run Play 49\b/, run_play49 
    end 
    if run_play50.nil?
      new_data.gsub! /Run Play 50\b/, " "
    else
      new_data.gsub! /Run Play 50\b/, run_play50 
    end 
    if run_play51.nil?
      new_data.gsub! /Run Play 51\b/, " "
    else
      new_data.gsub! /Run Play 51\b/, run_play51 
    end 
    if run_play52.nil?
      new_data.gsub! /Run Play 52\b/, " "
    else
      new_data.gsub! /Run Play 52\b/, run_play52 
    end    
    if pass_play1.nil?
      new_data.gsub! /Pass Play 1\b/, " "
    else
      new_data.gsub! /Pass Play 1\b/, pass_play1 
    end 
    if pass_play2.nil?
      new_data.gsub! /Pass Play 2\b/, " "
    else
      new_data.gsub! /Pass Play 2\b/, pass_play2 
    end   
    if pass_play3.nil?
      new_data.gsub! /Pass Play 3\b/, " "
    else
      new_data.gsub! /Pass Play 3\b/, pass_play3 
    end 
    if pass_play4.nil?
      new_data.gsub! /Pass Play 4\b/, " "
    else
      new_data.gsub! /Pass Play 4\b/, pass_play4 
    end 
    if pass_play5.nil?
      new_data.gsub! /Pass Play 5\b/, " "
    else
      new_data.gsub! /Pass Play 5\b/, pass_play5 
    end 
    if pass_play6.nil?
      new_data.gsub! /Pass Play 6\b/, " "
    else
      new_data.gsub! /Pass Play 6\b/, pass_play6 
    end 
    if pass_play7.nil?
      new_data.gsub! /Pass Play 7\b/, " "
    else
      new_data.gsub! /Pass Play 7\b/, pass_play7 
    end                     
    if pass_play8.nil?
      new_data.gsub! /Pass Play 8\b/, " "
    else
      new_data.gsub! /Pass Play 8\b/, pass_play8
    end    
    if pass_play9.nil?
      new_data.gsub! /Pass Play 9\b/, " "
    else
      new_data.gsub! /Pass Play 9\b/, pass_play9 
    end    
    if pass_play10.nil?
      new_data.gsub! /Pass Play 10\b/, " "
    else
      new_data.gsub! /Pass Play 10\b/, pass_play10 
    end 
    if pass_play11.nil?
      new_data.gsub! /Pass Play 11\b/, " "
    else
      new_data.gsub! /Pass Play 11\b/, pass_play11 
    end 
    if pass_play12.nil?
      new_data.gsub! /Pass Play 12\b/, " "
    else
      new_data.gsub! /Pass Play 12\b/, pass_play12 
    end   
    if pass_play13.nil?
      new_data.gsub! /Pass Play 13\b/, " "
    else
      new_data.gsub! /Pass Play 13\b/, pass_play13 
    end 
    if pass_play14.nil?
      new_data.gsub! /Pass Play 14\b/, " "
    else
      new_data.gsub! /Pass Play 14\b/, pass_play14 
    end 
    if pass_play15.nil?
      new_data.gsub! /Pass Play 15\b/, " "
    else
      new_data.gsub! /Pass Play 15\b/, pass_play15 
    end 
    if pass_play16.nil?
      new_data.gsub! /Pass Play 16\b/, " "
    else
      new_data.gsub! /Pass Play 16\b/, pass_play16 
    end 
    if pass_play17.nil?
      new_data.gsub! /Pass Play 17\b/, " "
    else
      new_data.gsub! /Pass Play 17\b/, pass_play17 
    end                     
    if pass_play18.nil?
      new_data.gsub! /Pass Play 18\b/, " "
    else
      new_data.gsub! /Pass Play 18\b/, pass_play18
    end    
    if pass_play19.nil?
      new_data.gsub! /Pass Play 19\b/, " "
    else
      new_data.gsub! /Pass Play 19\b/, pass_play19 
    end    
    if pass_play20.nil?
      new_data.gsub! /Pass Play 20\b/, " "
    else
      new_data.gsub! /Pass Play 20\b/, pass_play20 
    end 
    if pass_play21.nil?
      new_data.gsub! /Pass Play 21\b/, " "
    else
      new_data.gsub! /Pass Play 21\b/, pass_play21 
    end 
    if pass_play22.nil?
      new_data.gsub! /Pass Play 22\b/, " "
    else
      new_data.gsub! /Pass Play 22\b/, pass_play22 
    end   
    if pass_play23.nil?
      new_data.gsub! /Pass Play 23\b/, " "
    else
      new_data.gsub! /Pass Play 23\b/, pass_play23 
    end 
    if pass_play24.nil?
      new_data.gsub! /Pass Play 24\b/, " "
    else
      new_data.gsub! /Pass Play 24\b/, pass_play24 
    end 
    if pass_play25.nil?
      new_data.gsub! /Pass Play 25\b/, " "
    else
      new_data.gsub! /Pass Play 25\b/, pass_play25 
    end 
    if pass_play26.nil?
      new_data.gsub! /Pass Play 26\b/, " "
    else
      new_data.gsub! /Pass Play 26\b/, pass_play26 
    end 
    if pass_play27.nil?
      new_data.gsub! /Pass Play 27\b/, " "
    else
      new_data.gsub! /Pass Play 27\b/, pass_play27 
    end                     
    if pass_play28.nil?
      new_data.gsub! /Pass Play 28\b/, " "
    else
      new_data.gsub! /Pass Play 28\b/, pass_play28
    end    
    if pass_play29.nil?
      new_data.gsub! /Pass Play 29\b/, " "
    else
      new_data.gsub! /Pass Play 29\b/, pass_play29 
    end 
    if pass_play30.nil?
      new_data.gsub! /Pass Play 30\b/, " "
    else
      new_data.gsub! /Pass Play 30\b/, pass_play30 
    end 
    if pass_play31.nil?
      new_data.gsub! /Pass Play 31\b/, " "
    else
      new_data.gsub! /Pass Play 31\b/, pass_play31 
    end 
    if pass_play32.nil?
      new_data.gsub! /Pass Play 32\b/, " "
    else
      new_data.gsub! /Pass Play 32\b/, pass_play32 
    end    
    if pass_play33.nil?
      new_data.gsub! /Pass Play 33\b/, " "
    else
      new_data.gsub! /Pass Play 33\b/, pass_play33 
    end 
    if pass_play34.nil?
      new_data.gsub! /Pass Play 34\b/, " "
    else
      new_data.gsub! /Pass Play 34\b/, pass_play34 
    end 
    if pass_play35.nil?
      new_data.gsub! /Pass Play 35\b/, " "
    else
      new_data.gsub! /Pass Play 35\b/, pass_play35 
    end 
    if pass_play36.nil?
      new_data.gsub! /Pass Play 36\b/, " "
    else
      new_data.gsub! /Pass Play 36\b/, pass_play36 
    end 
    if pass_play37.nil?
      new_data.gsub! /Pass Play 37\b/, " "
    else
      new_data.gsub! /Pass Play 37\b/, pass_play37 
    end                     
    if pass_play38.nil?
      new_data.gsub! /Pass Play 38\b/, " "
    else
      new_data.gsub! /Pass Play 38\b/, pass_play38
    end    
    if pass_play39.nil?
      new_data.gsub! /Pass Play 39\b/, " "
    else
      new_data.gsub! /Pass Play 39\b/, pass_play39 
    end  
    if pass_play40.nil?
      new_data.gsub! /Pass Play 40\b/, " "
    else
      new_data.gsub! /Pass Play 40\b/, pass_play40 
    end 
    if pass_play41.nil?
      new_data.gsub! /Pass Play 41\b/, " "
    else
      new_data.gsub! /Pass Play 41\b/, pass_play41 
    end 
    if pass_play42.nil?
      new_data.gsub! /Pass Play 42\b/, " "
    else
      new_data.gsub! /Pass Play 42\b/, pass_play42 
    end    
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play45.nil?
      new_data.gsub! /Pass Play 45\b/, " "
    else
      new_data.gsub! /Pass Play 45\b/, pass_play45 
    end 
    if pass_play46.nil?
      new_data.gsub! /Pass Play 46\b/, " "
    else
      new_data.gsub! /Pass Play 46\b/, pass_play46 
    end 
    if pass_play47.nil?
      new_data.gsub! /Pass Play 47\b/, " "
    else
      new_data.gsub! /Pass Play 47\b/, pass_play47 
    end                     
    if pass_play48.nil?
      new_data.gsub! /Pass Play 48\b/, " "
    else
      new_data.gsub! /Pass Play 48\b/, pass_play48
    end    
    if pass_play49.nil?
      new_data.gsub! /Pass Play 49\b/, " "
    else
      new_data.gsub! /Pass Play 49\b/, pass_play49 
    end 
    if pass_play50.nil?
      new_data.gsub! /Pass Play 50\b/, " "
    else
      new_data.gsub! /Pass Play 50\b/, pass_play50 
    end 
    if pass_play51.nil?
      new_data.gsub! /Pass Play 51\b/, " "
    else
      new_data.gsub! /Pass Play 51\b/, pass_play51 
    end 
    if pass_play52.nil?
      new_data.gsub! /Pass Play 52\b/, " "
    else
      new_data.gsub! /Pass Play 52\b/, pass_play52 
    end 

    self.update :sdata => new_data, 
    :s_format => default_script.us_format,
    :s_class => default_script.us_class,
    :col_widths => default_script.col_widths,
    :orig_col_widths => default_script.col_widths
  end

  #Sets the initial script (custom2) when created
  def use_custom_script2
    event = Event.find_by(id: self.event_id)
    default_script2 = DefaultScript2.find_by(user_id: self.user_id)
    run_plays = event.plays.where('play_type = ?', "Run")
    pass_plays = event.plays.where('play_type = ?', "Pass")
    new_data = default_script2.us_data2

    unless run_plays[0].nil?
      run_play1 = run_plays[0].fullname
    end
    unless run_plays[1].nil?
      run_play2 = run_plays[1].fullname
    end
    unless run_plays[2].nil?
      run_play3 = run_plays[2].fullname
    end
    unless run_plays[3].nil?
      run_play4 = run_plays[3].fullname
    end
    unless run_plays[4].nil?
      run_play5 = run_plays[4].fullname
    end
    unless run_plays[5].nil?
      run_play6 = run_plays[5].fullname
    end
    unless run_plays[6].nil?
      run_play7 = run_plays[6].fullname
    end
    unless run_plays[7].nil?
      run_play8 = run_plays[7].fullname
    end        
    unless run_plays[8].nil?
      run_play9 = run_plays[8].fullname
    end
    unless run_plays[9].nil?
      run_play10 = run_plays[9].fullname
    end
    unless run_plays[10].nil?
      run_play11 = run_plays[10].fullname
    end 
    unless run_plays[11].nil?
      run_play12 = run_plays[11].fullname
    end
    unless run_plays[12].nil?
      run_play13 = run_plays[12].fullname
    end
    unless run_plays[13].nil?
      run_play14 = run_plays[13].fullname
    end
    unless run_plays[14].nil?
      run_play15 = run_plays[14].fullname
    end
    unless run_plays[15].nil?
      run_play16 = run_plays[15].fullname
    end
    unless run_plays[16].nil?
      run_play17 = run_plays[16].fullname
    end
    unless run_plays[17].nil?
      run_play18 = run_plays[17].fullname
    end
    unless run_plays[18].nil?
      run_play19 = run_plays[18].fullname
    end        
    unless run_plays[19].nil?
      run_play20 = run_plays[19].fullname
    end
    unless run_plays[20].nil?
      run_play21 = run_plays[20].fullname
    end
    unless run_plays[21].nil?
      run_play22 = run_plays[21].fullname
    end
    unless run_plays[22].nil?
      run_play23 = run_plays[22].fullname
    end 
    unless run_plays[23].nil?
      run_play24 = run_plays[23].fullname
    end
    unless run_plays[24].nil?
      run_play25 = run_plays[24].fullname
    end
    unless run_plays[25].nil?
      run_play26 = run_plays[25].fullname
    end
    unless run_plays[26].nil?
      run_play27 = run_plays[26].fullname
    end
    unless run_plays[27].nil?
      run_play28 = run_plays[27].fullname
    end
    unless run_plays[28].nil?
      run_play29 = run_plays[28].fullname
    end
    unless run_plays[29].nil?
      run_play30 = run_plays[29].fullname
    end
    unless run_plays[30].nil?
      run_play31 = run_plays[30].fullname
    end        
    unless run_plays[31].nil?
      run_play32 = run_plays[31].fullname
    end
    unless run_plays[32].nil?
      run_play33 = run_plays[32].fullname
    end
    unless run_plays[33].nil?
      run_play34 = run_plays[33].fullname
    end
    unless run_plays[34].nil?
      run_play35 = run_plays[34].fullname
    end        
    unless run_plays[35].nil?
      run_play36 = run_plays[35].fullname
    end
    unless run_plays[36].nil?
      run_play37 = run_plays[36].fullname
    end
    unless run_plays[37].nil?
      run_play38 = run_plays[37].fullname
    end
    unless run_plays[38].nil?
      run_play39 = run_plays[38].fullname
    end 
    unless run_plays[39].nil?
      run_play40 = run_plays[39].fullname
    end
    unless run_plays[40].nil?
      run_play41 = run_plays[40].fullname
    end
    unless run_plays[41].nil?
      run_play42 = run_plays[41].fullname
    end
    unless run_plays[42].nil?
      run_play43 = run_plays[42].fullname
    end
    unless run_plays[43].nil?
      run_play44 = run_plays[43].fullname
    end
    unless run_plays[44].nil?
      run_play45 = run_plays[44].fullname
    end
    unless run_plays[45].nil?
      run_play46 = run_plays[45].fullname
    end
    unless run_plays[46].nil?
      run_play47 = run_plays[46].fullname
    end        
    unless run_plays[47].nil?
      run_play48 = run_plays[47].fullname
    end
    unless run_plays[48].nil?
      run_play49 = run_plays[48].fullname
    end
    unless run_plays[49].nil?
      run_play50 = run_plays[49].fullname
    end
    unless run_plays[50].nil?
      run_play51 = run_plays[50].fullname
    end
    unless run_plays[51].nil?
      run_play52 = run_plays[51].fullname
    end
    unless pass_plays[0].nil?
      pass_play1 = pass_plays[0].fullname
    end
    unless pass_plays[1].nil?
      pass_play2 = pass_plays[1].fullname
    end
    unless pass_plays[2].nil?
      pass_play3 = pass_plays[2].fullname
    end
    unless pass_plays[3].nil?
      pass_play4 = pass_plays[3].fullname
    end
    unless pass_plays[4].nil?
      pass_play5 = pass_plays[4].fullname
    end
    unless pass_plays[5].nil?
      pass_play6 = pass_plays[5].fullname
    end
    unless pass_plays[6].nil?
      pass_play7 = pass_plays[6].fullname
    end
    unless pass_plays[7].nil?
      pass_play8 = pass_plays[7].fullname
    end        
    unless pass_plays[8].nil?
      pass_play9 = pass_plays[8].fullname
    end
    unless pass_plays[9].nil?
      pass_play10 = pass_plays[9].fullname
    end
    unless pass_plays[10].nil?
      pass_play11 = pass_plays[10].fullname
    end 
    unless pass_plays[11].nil?
      pass_play12 = pass_plays[11].fullname
    end
    unless pass_plays[12].nil?
      pass_play13 = pass_plays[12].fullname
    end
    unless pass_plays[13].nil?
      pass_play14 = pass_plays[13].fullname
    end
    unless pass_plays[14].nil?
      pass_play15 = pass_plays[14].fullname
    end
    unless pass_plays[15].nil?
      pass_play16 = pass_plays[15].fullname
    end
    unless pass_plays[16].nil?
      pass_play17 = pass_plays[16].fullname
    end
    unless pass_plays[17].nil?
      pass_play18 = pass_plays[17].fullname
    end
    unless pass_plays[18].nil?
      pass_play19 = pass_plays[18].fullname
    end        
    unless pass_plays[19].nil?
      pass_play20 = pass_plays[19].fullname
    end
    unless pass_plays[20].nil?
      pass_play21 = pass_plays[20].fullname
    end
    unless pass_plays[21].nil?
      pass_play22 = pass_plays[21].fullname
    end
    unless pass_plays[22].nil?
      pass_play23 = pass_plays[22].fullname
    end 
    unless pass_plays[23].nil?
      pass_play24 = pass_plays[23].fullname
    end
    unless pass_plays[24].nil?
      pass_play25 = pass_plays[24].fullname
    end
    unless pass_plays[25].nil?
      pass_play26 = pass_plays[25].fullname
    end
    unless pass_plays[26].nil?
      pass_play27 = pass_plays[26].fullname
    end
    unless pass_plays[27].nil?
      pass_play28 = pass_plays[27].fullname
    end
    unless pass_plays[28].nil?
      pass_play29 = pass_plays[28].fullname
    end
    unless pass_plays[29].nil?
      pass_play30 = pass_plays[29].fullname
    end
    unless pass_plays[30].nil?
      pass_play31 = pass_plays[30].fullname
    end        
    unless pass_plays[31].nil?
      pass_play32 = pass_plays[31].fullname
    end
    unless pass_plays[32].nil?
      pass_play33 = pass_plays[32].fullname
    end
    unless pass_plays[33].nil?
      pass_play34 = pass_plays[33].fullname
    end
    unless pass_plays[34].nil?
      pass_play35 = pass_plays[34].fullname
    end        
    unless pass_plays[35].nil?
      pass_play36 = pass_plays[35].fullname
    end
    unless pass_plays[36].nil?
      pass_play37 = pass_plays[36].fullname
    end
    unless pass_plays[37].nil?
      pass_play38 = pass_plays[37].fullname
    end
    unless pass_plays[38].nil?
      pass_play39 = pass_plays[38].fullname
    end 
    unless pass_plays[39].nil?
      pass_play40 = pass_plays[39].fullname
    end
    unless pass_plays[40].nil?
      pass_play41 = pass_plays[40].fullname
    end
    unless pass_plays[41].nil?
      pass_play42 = pass_plays[41].fullname
    end
    unless pass_plays[42].nil?
      pass_play43 = pass_plays[42].fullname
    end
    unless pass_plays[43].nil?
      pass_play44 = pass_plays[43].fullname
    end
    unless pass_plays[44].nil?
      pass_play45 = pass_plays[44].fullname
    end
    unless pass_plays[45].nil?
      pass_play46 = pass_plays[45].fullname
    end
    unless pass_plays[46].nil?
      pass_play47 = pass_plays[46].fullname
    end        
    unless pass_plays[47].nil?
      pass_play48 = pass_plays[47].fullname
    end
    unless pass_plays[48].nil?
      pass_play49 = pass_plays[48].fullname
    end
    unless pass_plays[49].nil?
      pass_play50 = pass_plays[49].fullname
    end
    unless pass_plays[50].nil?
      pass_play51 = pass_plays[50].fullname
    end
    unless pass_plays[51].nil?
      pass_play52 = pass_plays[51].fullname
    end
    

    if run_play1.nil?
      new_data.gsub! /Run Play 1\b/, " "
    else
      new_data.gsub! /Run Play 1\b/, run_play1 
    end 
    if run_play2.nil?
      new_data.gsub! /Run Play 2\b/, " "
    else
      new_data.gsub! /Run Play 2\b/, run_play2 
    end   
    if run_play3.nil?
      new_data.gsub! /Run Play 3\b/, " "
    else
      new_data.gsub! /Run Play 3\b/, run_play3 
    end 
    if run_play4.nil?
      new_data.gsub! /Run Play 4\b/, " "
    else
      new_data.gsub! /Run Play 4\b/, run_play4 
    end 
    if run_play5.nil?
      new_data.gsub! /Run Play 5\b/, " "
    else
      new_data.gsub! /Run Play 5\b/, run_play5 
    end 
    if run_play6.nil?
      new_data.gsub! /Run Play 6\b/, " "
    else
      new_data.gsub! /Run Play 6\b/, run_play6 
    end 
    if run_play7.nil?
      new_data.gsub! /Run Play 7\b/, " "
    else
      new_data.gsub! /Run Play 7\b/, run_play7 
    end                     
    if run_play8.nil?
      new_data.gsub! /Run Play 8\b/, " "
    else
      new_data.gsub! /Run Play 8\b/, run_play8
    end    
    if run_play9.nil?
      new_data.gsub! /Run Play 9\b/, " "
    else
      new_data.gsub! /Run Play 9\b/, run_play9 
    end    
    if run_play10.nil?
      new_data.gsub! /Run Play 10\b/, " "
    else
      new_data.gsub! /Run Play 10\b/, run_play10 
    end 
    if run_play11.nil?
      new_data.gsub! /Run Play 11\b/, " "
    else
      new_data.gsub! /Run Play 11\b/, run_play11 
    end 
    if run_play12.nil?
      new_data.gsub! /Run Play 12\b/, " "
    else
      new_data.gsub! /Run Play 12\b/, run_play12 
    end   
    if run_play13.nil?
      new_data.gsub! /Run Play 13\b/, " "
    else
      new_data.gsub! /Run Play 13\b/, run_play13 
    end 
    if run_play14.nil?
      new_data.gsub! /Run Play 14\b/, " "
    else
      new_data.gsub! /Run Play 14\b/, run_play14 
    end 
    if run_play15.nil?
      new_data.gsub! /Run Play 15\b/, " "
    else
      new_data.gsub! /Run Play 15\b/, run_play15 
    end 
    if run_play16.nil?
      new_data.gsub! /Run Play 16\b/, " "
    else
      new_data.gsub! /Run Play 16\b/, run_play16 
    end 
    if run_play17.nil?
      new_data.gsub! /Run Play 17\b/, " "
    else
      new_data.gsub! /Run Play 17\b/, run_play17 
    end                     
    if run_play18.nil?
      new_data.gsub! /Run Play 18\b/, " "
    else
      new_data.gsub! /Run Play 18\b/, run_play18
    end    
    if run_play19.nil?
      new_data.gsub! /Run Play 19\b/, " "
    else
      new_data.gsub! /Run Play 19\b/, run_play19 
    end    
    if run_play20.nil?
      new_data.gsub! /Run Play 20\b/, " "
    else
      new_data.gsub! /Run Play 20\b/, run_play20 
    end 
    if run_play21.nil?
      new_data.gsub! /Run Play 21\b/, " "
    else
      new_data.gsub! /Run Play 21\b/, run_play21 
    end 
    if run_play22.nil?
      new_data.gsub! /Run Play 22\b/, " "
    else
      new_data.gsub! /Run Play 22\b/, run_play22 
    end   
    if run_play23.nil?
      new_data.gsub! /Run Play 23\b/, " "
    else
      new_data.gsub! /Run Play 23\b/, run_play23 
    end 
    if run_play24.nil?
      new_data.gsub! /Run Play 24\b/, " "
    else
      new_data.gsub! /Run Play 24\b/, run_play24 
    end 
    if run_play25.nil?
      new_data.gsub! /Run Play 25\b/, " "
    else
      new_data.gsub! /Run Play 25\b/, run_play25 
    end 
    if run_play26.nil?
      new_data.gsub! /Run Play 26\b/, " "
    else
      new_data.gsub! /Run Play 26\b/, run_play26 
    end 
    if run_play27.nil?
      new_data.gsub! /Run Play 27\b/, " "
    else
      new_data.gsub! /Run Play 27\b/, run_play27 
    end                     
    if run_play28.nil?
      new_data.gsub! /Run Play 28\b/, " "
    else
      new_data.gsub! /Run Play 28\b/, run_play28
    end    
    if run_play29.nil?
      new_data.gsub! /Run Play 29\b/, " "
    else
      new_data.gsub! /Run Play 29\b/, run_play29 
    end 
    if run_play30.nil?
      new_data.gsub! /Run Play 30\b/, " "
    else
      new_data.gsub! /Run Play 30\b/, run_play30 
    end 
    if run_play31.nil?
      new_data.gsub! /Run Play 31\b/, " "
    else
      new_data.gsub! /Run Play 31\b/, run_play31 
    end 
    if run_play32.nil?
      new_data.gsub! /Run Play 32\b/, " "
    else
      new_data.gsub! /Run Play 32\b/, run_play32 
    end    
    if run_play33.nil?
      new_data.gsub! /Run Play 33\b/, " "
    else
      new_data.gsub! /Run Play 33\b/, run_play33 
    end 
    if run_play34.nil?
      new_data.gsub! /Run Play 34\b/, " "
    else
      new_data.gsub! /Run Play 34\b/, run_play34 
    end 
    if run_play35.nil?
      new_data.gsub! /Run Play 35\b/, " "
    else
      new_data.gsub! /Run Play 35\b/, run_play35 
    end 
    if run_play36.nil?
      new_data.gsub! /Run Play 36\b/, " "
    else
      new_data.gsub! /Run Play 36\b/, run_play36 
    end 
    if run_play37.nil?
      new_data.gsub! /Run Play 37\b/, " "
    else
      new_data.gsub! /Run Play 37\b/, run_play37 
    end                     
    if run_play38.nil?
      new_data.gsub! /Run Play 38\b/, " "
    else
      new_data.gsub! /Run Play 38\b/, run_play38
    end    
    if run_play39.nil?
      new_data.gsub! /Run Play 39\b/, " "
    else
      new_data.gsub! /Run Play 39\b/, run_play39 
    end  
    if run_play40.nil?
      new_data.gsub! /Run Play 40\b/, " "
    else
      new_data.gsub! /Run Play 40\b/, run_play40 
    end 
    if run_play41.nil?
      new_data.gsub! /Run Play 41\b/, " "
    else
      new_data.gsub! /Run Play 41\b/, run_play41 
    end 
    if run_play42.nil?
      new_data.gsub! /Run Play 42\b/, " "
    else
      new_data.gsub! /Run Play 42\b/, run_play42 
    end    
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play45.nil?
      new_data.gsub! /Run Play 45\b/, " "
    else
      new_data.gsub! /Run Play 45\b/, run_play45 
    end 
    if run_play46.nil?
      new_data.gsub! /Run Play 46\b/, " "
    else
      new_data.gsub! /Run Play 46\b/, run_play46 
    end 
    if run_play47.nil?
      new_data.gsub! /Run Play 47\b/, " "
    else
      new_data.gsub! /Run Play 47\b/, run_play47 
    end                     
    if run_play48.nil?
      new_data.gsub! /Run Play 48\b/, " "
    else
      new_data.gsub! /Run Play 48\b/, run_play48
    end    
    if run_play49.nil?
      new_data.gsub! /Run Play 49\b/, " "
    else
      new_data.gsub! /Run Play 49\b/, run_play49 
    end 
    if run_play50.nil?
      new_data.gsub! /Run Play 50\b/, " "
    else
      new_data.gsub! /Run Play 50\b/, run_play50 
    end 
    if run_play51.nil?
      new_data.gsub! /Run Play 51\b/, " "
    else
      new_data.gsub! /Run Play 51\b/, run_play51 
    end 
    if run_play52.nil?
      new_data.gsub! /Run Play 52\b/, " "
    else
      new_data.gsub! /Run Play 52\b/, run_play52 
    end    
    if pass_play1.nil?
      new_data.gsub! /Pass Play 1\b/, " "
    else
      new_data.gsub! /Pass Play 1\b/, pass_play1 
    end 
    if pass_play2.nil?
      new_data.gsub! /Pass Play 2\b/, " "
    else
      new_data.gsub! /Pass Play 2\b/, pass_play2 
    end   
    if pass_play3.nil?
      new_data.gsub! /Pass Play 3\b/, " "
    else
      new_data.gsub! /Pass Play 3\b/, pass_play3 
    end 
    if pass_play4.nil?
      new_data.gsub! /Pass Play 4\b/, " "
    else
      new_data.gsub! /Pass Play 4\b/, pass_play4 
    end 
    if pass_play5.nil?
      new_data.gsub! /Pass Play 5\b/, " "
    else
      new_data.gsub! /Pass Play 5\b/, pass_play5 
    end 
    if pass_play6.nil?
      new_data.gsub! /Pass Play 6\b/, " "
    else
      new_data.gsub! /Pass Play 6\b/, pass_play6 
    end 
    if pass_play7.nil?
      new_data.gsub! /Pass Play 7\b/, " "
    else
      new_data.gsub! /Pass Play 7\b/, pass_play7 
    end                     
    if pass_play8.nil?
      new_data.gsub! /Pass Play 8\b/, " "
    else
      new_data.gsub! /Pass Play 8\b/, pass_play8
    end    
    if pass_play9.nil?
      new_data.gsub! /Pass Play 9\b/, " "
    else
      new_data.gsub! /Pass Play 9\b/, pass_play9 
    end    
    if pass_play10.nil?
      new_data.gsub! /Pass Play 10\b/, " "
    else
      new_data.gsub! /Pass Play 10\b/, pass_play10 
    end 
    if pass_play11.nil?
      new_data.gsub! /Pass Play 11\b/, " "
    else
      new_data.gsub! /Pass Play 11\b/, pass_play11 
    end 
    if pass_play12.nil?
      new_data.gsub! /Pass Play 12\b/, " "
    else
      new_data.gsub! /Pass Play 12\b/, pass_play12 
    end   
    if pass_play13.nil?
      new_data.gsub! /Pass Play 13\b/, " "
    else
      new_data.gsub! /Pass Play 13\b/, pass_play13 
    end 
    if pass_play14.nil?
      new_data.gsub! /Pass Play 14\b/, " "
    else
      new_data.gsub! /Pass Play 14\b/, pass_play14 
    end 
    if pass_play15.nil?
      new_data.gsub! /Pass Play 15\b/, " "
    else
      new_data.gsub! /Pass Play 15\b/, pass_play15 
    end 
    if pass_play16.nil?
      new_data.gsub! /Pass Play 16\b/, " "
    else
      new_data.gsub! /Pass Play 16\b/, pass_play16 
    end 
    if pass_play17.nil?
      new_data.gsub! /Pass Play 17\b/, " "
    else
      new_data.gsub! /Pass Play 17\b/, pass_play17 
    end                     
    if pass_play18.nil?
      new_data.gsub! /Pass Play 18\b/, " "
    else
      new_data.gsub! /Pass Play 18\b/, pass_play18
    end    
    if pass_play19.nil?
      new_data.gsub! /Pass Play 19\b/, " "
    else
      new_data.gsub! /Pass Play 19\b/, pass_play19 
    end    
    if pass_play20.nil?
      new_data.gsub! /Pass Play 20\b/, " "
    else
      new_data.gsub! /Pass Play 20\b/, pass_play20 
    end 
    if pass_play21.nil?
      new_data.gsub! /Pass Play 21\b/, " "
    else
      new_data.gsub! /Pass Play 21\b/, pass_play21 
    end 
    if pass_play22.nil?
      new_data.gsub! /Pass Play 22\b/, " "
    else
      new_data.gsub! /Pass Play 22\b/, pass_play22 
    end   
    if pass_play23.nil?
      new_data.gsub! /Pass Play 23\b/, " "
    else
      new_data.gsub! /Pass Play 23\b/, pass_play23 
    end 
    if pass_play24.nil?
      new_data.gsub! /Pass Play 24\b/, " "
    else
      new_data.gsub! /Pass Play 24\b/, pass_play24 
    end 
    if pass_play25.nil?
      new_data.gsub! /Pass Play 25\b/, " "
    else
      new_data.gsub! /Pass Play 25\b/, pass_play25 
    end 
    if pass_play26.nil?
      new_data.gsub! /Pass Play 26\b/, " "
    else
      new_data.gsub! /Pass Play 26\b/, pass_play26 
    end 
    if pass_play27.nil?
      new_data.gsub! /Pass Play 27\b/, " "
    else
      new_data.gsub! /Pass Play 27\b/, pass_play27 
    end                     
    if pass_play28.nil?
      new_data.gsub! /Pass Play 28\b/, " "
    else
      new_data.gsub! /Pass Play 28\b/, pass_play28
    end    
    if pass_play29.nil?
      new_data.gsub! /Pass Play 29\b/, " "
    else
      new_data.gsub! /Pass Play 29\b/, pass_play29 
    end 
    if pass_play30.nil?
      new_data.gsub! /Pass Play 30\b/, " "
    else
      new_data.gsub! /Pass Play 30\b/, pass_play30 
    end 
    if pass_play31.nil?
      new_data.gsub! /Pass Play 31\b/, " "
    else
      new_data.gsub! /Pass Play 31\b/, pass_play31 
    end 
    if pass_play32.nil?
      new_data.gsub! /Pass Play 32\b/, " "
    else
      new_data.gsub! /Pass Play 32\b/, pass_play32 
    end    
    if pass_play33.nil?
      new_data.gsub! /Pass Play 33\b/, " "
    else
      new_data.gsub! /Pass Play 33\b/, pass_play33 
    end 
    if pass_play34.nil?
      new_data.gsub! /Pass Play 34\b/, " "
    else
      new_data.gsub! /Pass Play 34\b/, pass_play34 
    end 
    if pass_play35.nil?
      new_data.gsub! /Pass Play 35\b/, " "
    else
      new_data.gsub! /Pass Play 35\b/, pass_play35 
    end 
    if pass_play36.nil?
      new_data.gsub! /Pass Play 36\b/, " "
    else
      new_data.gsub! /Pass Play 36\b/, pass_play36 
    end 
    if pass_play37.nil?
      new_data.gsub! /Pass Play 37\b/, " "
    else
      new_data.gsub! /Pass Play 37\b/, pass_play37 
    end                     
    if pass_play38.nil?
      new_data.gsub! /Pass Play 38\b/, " "
    else
      new_data.gsub! /Pass Play 38\b/, pass_play38
    end    
    if pass_play39.nil?
      new_data.gsub! /Pass Play 39\b/, " "
    else
      new_data.gsub! /Pass Play 39\b/, pass_play39 
    end  
    if pass_play40.nil?
      new_data.gsub! /Pass Play 40\b/, " "
    else
      new_data.gsub! /Pass Play 40\b/, pass_play40 
    end 
    if pass_play41.nil?
      new_data.gsub! /Pass Play 41\b/, " "
    else
      new_data.gsub! /Pass Play 41\b/, pass_play41 
    end 
    if pass_play42.nil?
      new_data.gsub! /Pass Play 42\b/, " "
    else
      new_data.gsub! /Pass Play 42\b/, pass_play42 
    end    
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play45.nil?
      new_data.gsub! /Pass Play 45\b/, " "
    else
      new_data.gsub! /Pass Play 45\b/, pass_play45 
    end 
    if pass_play46.nil?
      new_data.gsub! /Pass Play 46\b/, " "
    else
      new_data.gsub! /Pass Play 46\b/, pass_play46 
    end 
    if pass_play47.nil?
      new_data.gsub! /Pass Play 47\b/, " "
    else
      new_data.gsub! /Pass Play 47\b/, pass_play47 
    end                     
    if pass_play48.nil?
      new_data.gsub! /Pass Play 48\b/, " "
    else
      new_data.gsub! /Pass Play 48\b/, pass_play48
    end    
    if pass_play49.nil?
      new_data.gsub! /Pass Play 49\b/, " "
    else
      new_data.gsub! /Pass Play 49\b/, pass_play49 
    end 
    if pass_play50.nil?
      new_data.gsub! /Pass Play 50\b/, " "
    else
      new_data.gsub! /Pass Play 50\b/, pass_play50 
    end 
    if pass_play51.nil?
      new_data.gsub! /Pass Play 51\b/, " "
    else
      new_data.gsub! /Pass Play 51\b/, pass_play51 
    end 
    if pass_play52.nil?
      new_data.gsub! /Pass Play 52\b/, " "
    else
      new_data.gsub! /Pass Play 52\b/, pass_play52 
    end 

    self.update :sdata => new_data, 
    :s_format => default_script2.us_format2,
    :s_class => default_script2.us_class2,
    :col_widths => default_script2.col_widths,
    :orig_col_widths => default_script2.col_widths
  end

  #Sets the initial script (custom2) when created
  def use_custom_script3
    event = Event.find_by(id: self.event_id)
    default_script3 = DefaultScript3.find_by(user_id: self.user_id)
    run_plays = event.plays.where('play_type = ?', "Run")
    pass_plays = event.plays.where('play_type = ?', "Pass")
    new_data = default_script3.us_data3

    unless run_plays[0].nil?
      run_play1 = run_plays[0].fullname
    end
    unless run_plays[1].nil?
      run_play2 = run_plays[1].fullname
    end
    unless run_plays[2].nil?
      run_play3 = run_plays[2].fullname
    end
    unless run_plays[3].nil?
      run_play4 = run_plays[3].fullname
    end
    unless run_plays[4].nil?
      run_play5 = run_plays[4].fullname
    end
    unless run_plays[5].nil?
      run_play6 = run_plays[5].fullname
    end
    unless run_plays[6].nil?
      run_play7 = run_plays[6].fullname
    end
    unless run_plays[7].nil?
      run_play8 = run_plays[7].fullname
    end        
    unless run_plays[8].nil?
      run_play9 = run_plays[8].fullname
    end
    unless run_plays[9].nil?
      run_play10 = run_plays[9].fullname
    end
    unless run_plays[10].nil?
      run_play11 = run_plays[10].fullname
    end 
    unless run_plays[11].nil?
      run_play12 = run_plays[11].fullname
    end
    unless run_plays[12].nil?
      run_play13 = run_plays[12].fullname
    end
    unless run_plays[13].nil?
      run_play14 = run_plays[13].fullname
    end
    unless run_plays[14].nil?
      run_play15 = run_plays[14].fullname
    end
    unless run_plays[15].nil?
      run_play16 = run_plays[15].fullname
    end
    unless run_plays[16].nil?
      run_play17 = run_plays[16].fullname
    end
    unless run_plays[17].nil?
      run_play18 = run_plays[17].fullname
    end
    unless run_plays[18].nil?
      run_play19 = run_plays[18].fullname
    end        
    unless run_plays[19].nil?
      run_play20 = run_plays[19].fullname
    end
    unless run_plays[20].nil?
      run_play21 = run_plays[20].fullname
    end
    unless run_plays[21].nil?
      run_play22 = run_plays[21].fullname
    end
    unless run_plays[22].nil?
      run_play23 = run_plays[22].fullname
    end 
    unless run_plays[23].nil?
      run_play24 = run_plays[23].fullname
    end
    unless run_plays[24].nil?
      run_play25 = run_plays[24].fullname
    end
    unless run_plays[25].nil?
      run_play26 = run_plays[25].fullname
    end
    unless run_plays[26].nil?
      run_play27 = run_plays[26].fullname
    end
    unless run_plays[27].nil?
      run_play28 = run_plays[27].fullname
    end
    unless run_plays[28].nil?
      run_play29 = run_plays[28].fullname
    end
    unless run_plays[29].nil?
      run_play30 = run_plays[29].fullname
    end
    unless run_plays[30].nil?
      run_play31 = run_plays[30].fullname
    end        
    unless run_plays[31].nil?
      run_play32 = run_plays[31].fullname
    end
    unless run_plays[32].nil?
      run_play33 = run_plays[32].fullname
    end
    unless run_plays[33].nil?
      run_play34 = run_plays[33].fullname
    end
    unless run_plays[34].nil?
      run_play35 = run_plays[34].fullname
    end        
    unless run_plays[35].nil?
      run_play36 = run_plays[35].fullname
    end
    unless run_plays[36].nil?
      run_play37 = run_plays[36].fullname
    end
    unless run_plays[37].nil?
      run_play38 = run_plays[37].fullname
    end
    unless run_plays[38].nil?
      run_play39 = run_plays[38].fullname
    end 
    unless run_plays[39].nil?
      run_play40 = run_plays[39].fullname
    end
    unless run_plays[40].nil?
      run_play41 = run_plays[40].fullname
    end
    unless run_plays[41].nil?
      run_play42 = run_plays[41].fullname
    end
    unless run_plays[42].nil?
      run_play43 = run_plays[42].fullname
    end
    unless run_plays[43].nil?
      run_play44 = run_plays[43].fullname
    end
    unless run_plays[44].nil?
      run_play45 = run_plays[44].fullname
    end
    unless run_plays[45].nil?
      run_play46 = run_plays[45].fullname
    end
    unless run_plays[46].nil?
      run_play47 = run_plays[46].fullname
    end        
    unless run_plays[47].nil?
      run_play48 = run_plays[47].fullname
    end
    unless run_plays[48].nil?
      run_play49 = run_plays[48].fullname
    end
    unless run_plays[49].nil?
      run_play50 = run_plays[49].fullname
    end
    unless run_plays[50].nil?
      run_play51 = run_plays[50].fullname
    end
    unless run_plays[51].nil?
      run_play52 = run_plays[51].fullname
    end
    unless pass_plays[0].nil?
      pass_play1 = pass_plays[0].fullname
    end
    unless pass_plays[1].nil?
      pass_play2 = pass_plays[1].fullname
    end
    unless pass_plays[2].nil?
      pass_play3 = pass_plays[2].fullname
    end
    unless pass_plays[3].nil?
      pass_play4 = pass_plays[3].fullname
    end
    unless pass_plays[4].nil?
      pass_play5 = pass_plays[4].fullname
    end
    unless pass_plays[5].nil?
      pass_play6 = pass_plays[5].fullname
    end
    unless pass_plays[6].nil?
      pass_play7 = pass_plays[6].fullname
    end
    unless pass_plays[7].nil?
      pass_play8 = pass_plays[7].fullname
    end        
    unless pass_plays[8].nil?
      pass_play9 = pass_plays[8].fullname
    end
    unless pass_plays[9].nil?
      pass_play10 = pass_plays[9].fullname
    end
    unless pass_plays[10].nil?
      pass_play11 = pass_plays[10].fullname
    end 
    unless pass_plays[11].nil?
      pass_play12 = pass_plays[11].fullname
    end
    unless pass_plays[12].nil?
      pass_play13 = pass_plays[12].fullname
    end
    unless pass_plays[13].nil?
      pass_play14 = pass_plays[13].fullname
    end
    unless pass_plays[14].nil?
      pass_play15 = pass_plays[14].fullname
    end
    unless pass_plays[15].nil?
      pass_play16 = pass_plays[15].fullname
    end
    unless pass_plays[16].nil?
      pass_play17 = pass_plays[16].fullname
    end
    unless pass_plays[17].nil?
      pass_play18 = pass_plays[17].fullname
    end
    unless pass_plays[18].nil?
      pass_play19 = pass_plays[18].fullname
    end        
    unless pass_plays[19].nil?
      pass_play20 = pass_plays[19].fullname
    end
    unless pass_plays[20].nil?
      pass_play21 = pass_plays[20].fullname
    end
    unless pass_plays[21].nil?
      pass_play22 = pass_plays[21].fullname
    end
    unless pass_plays[22].nil?
      pass_play23 = pass_plays[22].fullname
    end 
    unless pass_plays[23].nil?
      pass_play24 = pass_plays[23].fullname
    end
    unless pass_plays[24].nil?
      pass_play25 = pass_plays[24].fullname
    end
    unless pass_plays[25].nil?
      pass_play26 = pass_plays[25].fullname
    end
    unless pass_plays[26].nil?
      pass_play27 = pass_plays[26].fullname
    end
    unless pass_plays[27].nil?
      pass_play28 = pass_plays[27].fullname
    end
    unless pass_plays[28].nil?
      pass_play29 = pass_plays[28].fullname
    end
    unless pass_plays[29].nil?
      pass_play30 = pass_plays[29].fullname
    end
    unless pass_plays[30].nil?
      pass_play31 = pass_plays[30].fullname
    end        
    unless pass_plays[31].nil?
      pass_play32 = pass_plays[31].fullname
    end
    unless pass_plays[32].nil?
      pass_play33 = pass_plays[32].fullname
    end
    unless pass_plays[33].nil?
      pass_play34 = pass_plays[33].fullname
    end
    unless pass_plays[34].nil?
      pass_play35 = pass_plays[34].fullname
    end        
    unless pass_plays[35].nil?
      pass_play36 = pass_plays[35].fullname
    end
    unless pass_plays[36].nil?
      pass_play37 = pass_plays[36].fullname
    end
    unless pass_plays[37].nil?
      pass_play38 = pass_plays[37].fullname
    end
    unless pass_plays[38].nil?
      pass_play39 = pass_plays[38].fullname
    end 
    unless pass_plays[39].nil?
      pass_play40 = pass_plays[39].fullname
    end
    unless pass_plays[40].nil?
      pass_play41 = pass_plays[40].fullname
    end
    unless pass_plays[41].nil?
      pass_play42 = pass_plays[41].fullname
    end
    unless pass_plays[42].nil?
      pass_play43 = pass_plays[42].fullname
    end
    unless pass_plays[43].nil?
      pass_play44 = pass_plays[43].fullname
    end
    unless pass_plays[44].nil?
      pass_play45 = pass_plays[44].fullname
    end
    unless pass_plays[45].nil?
      pass_play46 = pass_plays[45].fullname
    end
    unless pass_plays[46].nil?
      pass_play47 = pass_plays[46].fullname
    end        
    unless pass_plays[47].nil?
      pass_play48 = pass_plays[47].fullname
    end
    unless pass_plays[48].nil?
      pass_play49 = pass_plays[48].fullname
    end
    unless pass_plays[49].nil?
      pass_play50 = pass_plays[49].fullname
    end
    unless pass_plays[50].nil?
      pass_play51 = pass_plays[50].fullname
    end
    unless pass_plays[51].nil?
      pass_play52 = pass_plays[51].fullname
    end
    

    if run_play1.nil?
      new_data.gsub! /Run Play 1\b/, " "
    else
      new_data.gsub! /Run Play 1\b/, run_play1 
    end 
    if run_play2.nil?
      new_data.gsub! /Run Play 2\b/, " "
    else
      new_data.gsub! /Run Play 2\b/, run_play2 
    end   
    if run_play3.nil?
      new_data.gsub! /Run Play 3\b/, " "
    else
      new_data.gsub! /Run Play 3\b/, run_play3 
    end 
    if run_play4.nil?
      new_data.gsub! /Run Play 4\b/, " "
    else
      new_data.gsub! /Run Play 4\b/, run_play4 
    end 
    if run_play5.nil?
      new_data.gsub! /Run Play 5\b/, " "
    else
      new_data.gsub! /Run Play 5\b/, run_play5 
    end 
    if run_play6.nil?
      new_data.gsub! /Run Play 6\b/, " "
    else
      new_data.gsub! /Run Play 6\b/, run_play6 
    end 
    if run_play7.nil?
      new_data.gsub! /Run Play 7\b/, " "
    else
      new_data.gsub! /Run Play 7\b/, run_play7 
    end                     
    if run_play8.nil?
      new_data.gsub! /Run Play 8\b/, " "
    else
      new_data.gsub! /Run Play 8\b/, run_play8
    end    
    if run_play9.nil?
      new_data.gsub! /Run Play 9\b/, " "
    else
      new_data.gsub! /Run Play 9\b/, run_play9 
    end    
    if run_play10.nil?
      new_data.gsub! /Run Play 10\b/, " "
    else
      new_data.gsub! /Run Play 10\b/, run_play10 
    end 
    if run_play11.nil?
      new_data.gsub! /Run Play 11\b/, " "
    else
      new_data.gsub! /Run Play 11\b/, run_play11 
    end 
    if run_play12.nil?
      new_data.gsub! /Run Play 12\b/, " "
    else
      new_data.gsub! /Run Play 12\b/, run_play12 
    end   
    if run_play13.nil?
      new_data.gsub! /Run Play 13\b/, " "
    else
      new_data.gsub! /Run Play 13\b/, run_play13 
    end 
    if run_play14.nil?
      new_data.gsub! /Run Play 14\b/, " "
    else
      new_data.gsub! /Run Play 14\b/, run_play14 
    end 
    if run_play15.nil?
      new_data.gsub! /Run Play 15\b/, " "
    else
      new_data.gsub! /Run Play 15\b/, run_play15 
    end 
    if run_play16.nil?
      new_data.gsub! /Run Play 16\b/, " "
    else
      new_data.gsub! /Run Play 16\b/, run_play16 
    end 
    if run_play17.nil?
      new_data.gsub! /Run Play 17\b/, " "
    else
      new_data.gsub! /Run Play 17\b/, run_play17 
    end                     
    if run_play18.nil?
      new_data.gsub! /Run Play 18\b/, " "
    else
      new_data.gsub! /Run Play 18\b/, run_play18
    end    
    if run_play19.nil?
      new_data.gsub! /Run Play 19\b/, " "
    else
      new_data.gsub! /Run Play 19\b/, run_play19 
    end    
    if run_play20.nil?
      new_data.gsub! /Run Play 20\b/, " "
    else
      new_data.gsub! /Run Play 20\b/, run_play20 
    end 
    if run_play21.nil?
      new_data.gsub! /Run Play 21\b/, " "
    else
      new_data.gsub! /Run Play 21\b/, run_play21 
    end 
    if run_play22.nil?
      new_data.gsub! /Run Play 22\b/, " "
    else
      new_data.gsub! /Run Play 22\b/, run_play22 
    end   
    if run_play23.nil?
      new_data.gsub! /Run Play 23\b/, " "
    else
      new_data.gsub! /Run Play 23\b/, run_play23 
    end 
    if run_play24.nil?
      new_data.gsub! /Run Play 24\b/, " "
    else
      new_data.gsub! /Run Play 24\b/, run_play24 
    end 
    if run_play25.nil?
      new_data.gsub! /Run Play 25\b/, " "
    else
      new_data.gsub! /Run Play 25\b/, run_play25 
    end 
    if run_play26.nil?
      new_data.gsub! /Run Play 26\b/, " "
    else
      new_data.gsub! /Run Play 26\b/, run_play26 
    end 
    if run_play27.nil?
      new_data.gsub! /Run Play 27\b/, " "
    else
      new_data.gsub! /Run Play 27\b/, run_play27 
    end                     
    if run_play28.nil?
      new_data.gsub! /Run Play 28\b/, " "
    else
      new_data.gsub! /Run Play 28\b/, run_play28
    end    
    if run_play29.nil?
      new_data.gsub! /Run Play 29\b/, " "
    else
      new_data.gsub! /Run Play 29\b/, run_play29 
    end 
    if run_play30.nil?
      new_data.gsub! /Run Play 30\b/, " "
    else
      new_data.gsub! /Run Play 30\b/, run_play30 
    end 
    if run_play31.nil?
      new_data.gsub! /Run Play 31\b/, " "
    else
      new_data.gsub! /Run Play 31\b/, run_play31 
    end 
    if run_play32.nil?
      new_data.gsub! /Run Play 32\b/, " "
    else
      new_data.gsub! /Run Play 32\b/, run_play32 
    end    
    if run_play33.nil?
      new_data.gsub! /Run Play 33\b/, " "
    else
      new_data.gsub! /Run Play 33\b/, run_play33 
    end 
    if run_play34.nil?
      new_data.gsub! /Run Play 34\b/, " "
    else
      new_data.gsub! /Run Play 34\b/, run_play34 
    end 
    if run_play35.nil?
      new_data.gsub! /Run Play 35\b/, " "
    else
      new_data.gsub! /Run Play 35\b/, run_play35 
    end 
    if run_play36.nil?
      new_data.gsub! /Run Play 36\b/, " "
    else
      new_data.gsub! /Run Play 36\b/, run_play36 
    end 
    if run_play37.nil?
      new_data.gsub! /Run Play 37\b/, " "
    else
      new_data.gsub! /Run Play 37\b/, run_play37 
    end                     
    if run_play38.nil?
      new_data.gsub! /Run Play 38\b/, " "
    else
      new_data.gsub! /Run Play 38\b/, run_play38
    end    
    if run_play39.nil?
      new_data.gsub! /Run Play 39\b/, " "
    else
      new_data.gsub! /Run Play 39\b/, run_play39 
    end  
    if run_play40.nil?
      new_data.gsub! /Run Play 40\b/, " "
    else
      new_data.gsub! /Run Play 40\b/, run_play40 
    end 
    if run_play41.nil?
      new_data.gsub! /Run Play 41\b/, " "
    else
      new_data.gsub! /Run Play 41\b/, run_play41 
    end 
    if run_play42.nil?
      new_data.gsub! /Run Play 42\b/, " "
    else
      new_data.gsub! /Run Play 42\b/, run_play42 
    end    
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play44.nil?
      new_data.gsub! /Run Play 44\b/, " "
    else
      new_data.gsub! /Run Play 44\b/, run_play44 
    end 
    if run_play45.nil?
      new_data.gsub! /Run Play 45\b/, " "
    else
      new_data.gsub! /Run Play 45\b/, run_play45 
    end 
    if run_play46.nil?
      new_data.gsub! /Run Play 46\b/, " "
    else
      new_data.gsub! /Run Play 46\b/, run_play46 
    end 
    if run_play47.nil?
      new_data.gsub! /Run Play 47\b/, " "
    else
      new_data.gsub! /Run Play 47\b/, run_play47 
    end                     
    if run_play48.nil?
      new_data.gsub! /Run Play 48\b/, " "
    else
      new_data.gsub! /Run Play 48\b/, run_play48
    end    
    if run_play49.nil?
      new_data.gsub! /Run Play 49\b/, " "
    else
      new_data.gsub! /Run Play 49\b/, run_play49 
    end 
    if run_play50.nil?
      new_data.gsub! /Run Play 50\b/, " "
    else
      new_data.gsub! /Run Play 50\b/, run_play50 
    end 
    if run_play51.nil?
      new_data.gsub! /Run Play 51\b/, " "
    else
      new_data.gsub! /Run Play 51\b/, run_play51 
    end 
    if run_play52.nil?
      new_data.gsub! /Run Play 52\b/, " "
    else
      new_data.gsub! /Run Play 52\b/, run_play52 
    end    
    if pass_play1.nil?
      new_data.gsub! /Pass Play 1\b/, " "
    else
      new_data.gsub! /Pass Play 1\b/, pass_play1 
    end 
    if pass_play2.nil?
      new_data.gsub! /Pass Play 2\b/, " "
    else
      new_data.gsub! /Pass Play 2\b/, pass_play2 
    end   
    if pass_play3.nil?
      new_data.gsub! /Pass Play 3\b/, " "
    else
      new_data.gsub! /Pass Play 3\b/, pass_play3 
    end 
    if pass_play4.nil?
      new_data.gsub! /Pass Play 4\b/, " "
    else
      new_data.gsub! /Pass Play 4\b/, pass_play4 
    end 
    if pass_play5.nil?
      new_data.gsub! /Pass Play 5\b/, " "
    else
      new_data.gsub! /Pass Play 5\b/, pass_play5 
    end 
    if pass_play6.nil?
      new_data.gsub! /Pass Play 6\b/, " "
    else
      new_data.gsub! /Pass Play 6\b/, pass_play6 
    end 
    if pass_play7.nil?
      new_data.gsub! /Pass Play 7\b/, " "
    else
      new_data.gsub! /Pass Play 7\b/, pass_play7 
    end                     
    if pass_play8.nil?
      new_data.gsub! /Pass Play 8\b/, " "
    else
      new_data.gsub! /Pass Play 8\b/, pass_play8
    end    
    if pass_play9.nil?
      new_data.gsub! /Pass Play 9\b/, " "
    else
      new_data.gsub! /Pass Play 9\b/, pass_play9 
    end    
    if pass_play10.nil?
      new_data.gsub! /Pass Play 10\b/, " "
    else
      new_data.gsub! /Pass Play 10\b/, pass_play10 
    end 
    if pass_play11.nil?
      new_data.gsub! /Pass Play 11\b/, " "
    else
      new_data.gsub! /Pass Play 11\b/, pass_play11 
    end 
    if pass_play12.nil?
      new_data.gsub! /Pass Play 12\b/, " "
    else
      new_data.gsub! /Pass Play 12\b/, pass_play12 
    end   
    if pass_play13.nil?
      new_data.gsub! /Pass Play 13\b/, " "
    else
      new_data.gsub! /Pass Play 13\b/, pass_play13 
    end 
    if pass_play14.nil?
      new_data.gsub! /Pass Play 14\b/, " "
    else
      new_data.gsub! /Pass Play 14\b/, pass_play14 
    end 
    if pass_play15.nil?
      new_data.gsub! /Pass Play 15\b/, " "
    else
      new_data.gsub! /Pass Play 15\b/, pass_play15 
    end 
    if pass_play16.nil?
      new_data.gsub! /Pass Play 16\b/, " "
    else
      new_data.gsub! /Pass Play 16\b/, pass_play16 
    end 
    if pass_play17.nil?
      new_data.gsub! /Pass Play 17\b/, " "
    else
      new_data.gsub! /Pass Play 17\b/, pass_play17 
    end                     
    if pass_play18.nil?
      new_data.gsub! /Pass Play 18\b/, " "
    else
      new_data.gsub! /Pass Play 18\b/, pass_play18
    end    
    if pass_play19.nil?
      new_data.gsub! /Pass Play 19\b/, " "
    else
      new_data.gsub! /Pass Play 19\b/, pass_play19 
    end    
    if pass_play20.nil?
      new_data.gsub! /Pass Play 20\b/, " "
    else
      new_data.gsub! /Pass Play 20\b/, pass_play20 
    end 
    if pass_play21.nil?
      new_data.gsub! /Pass Play 21\b/, " "
    else
      new_data.gsub! /Pass Play 21\b/, pass_play21 
    end 
    if pass_play22.nil?
      new_data.gsub! /Pass Play 22\b/, " "
    else
      new_data.gsub! /Pass Play 22\b/, pass_play22 
    end   
    if pass_play23.nil?
      new_data.gsub! /Pass Play 23\b/, " "
    else
      new_data.gsub! /Pass Play 23\b/, pass_play23 
    end 
    if pass_play24.nil?
      new_data.gsub! /Pass Play 24\b/, " "
    else
      new_data.gsub! /Pass Play 24\b/, pass_play24 
    end 
    if pass_play25.nil?
      new_data.gsub! /Pass Play 25\b/, " "
    else
      new_data.gsub! /Pass Play 25\b/, pass_play25 
    end 
    if pass_play26.nil?
      new_data.gsub! /Pass Play 26\b/, " "
    else
      new_data.gsub! /Pass Play 26\b/, pass_play26 
    end 
    if pass_play27.nil?
      new_data.gsub! /Pass Play 27\b/, " "
    else
      new_data.gsub! /Pass Play 27\b/, pass_play27 
    end                     
    if pass_play28.nil?
      new_data.gsub! /Pass Play 28\b/, " "
    else
      new_data.gsub! /Pass Play 28\b/, pass_play28
    end    
    if pass_play29.nil?
      new_data.gsub! /Pass Play 29\b/, " "
    else
      new_data.gsub! /Pass Play 29\b/, pass_play29 
    end 
    if pass_play30.nil?
      new_data.gsub! /Pass Play 30\b/, " "
    else
      new_data.gsub! /Pass Play 30\b/, pass_play30 
    end 
    if pass_play31.nil?
      new_data.gsub! /Pass Play 31\b/, " "
    else
      new_data.gsub! /Pass Play 31\b/, pass_play31 
    end 
    if pass_play32.nil?
      new_data.gsub! /Pass Play 32\b/, " "
    else
      new_data.gsub! /Pass Play 32\b/, pass_play32 
    end    
    if pass_play33.nil?
      new_data.gsub! /Pass Play 33\b/, " "
    else
      new_data.gsub! /Pass Play 33\b/, pass_play33 
    end 
    if pass_play34.nil?
      new_data.gsub! /Pass Play 34\b/, " "
    else
      new_data.gsub! /Pass Play 34\b/, pass_play34 
    end 
    if pass_play35.nil?
      new_data.gsub! /Pass Play 35\b/, " "
    else
      new_data.gsub! /Pass Play 35\b/, pass_play35 
    end 
    if pass_play36.nil?
      new_data.gsub! /Pass Play 36\b/, " "
    else
      new_data.gsub! /Pass Play 36\b/, pass_play36 
    end 
    if pass_play37.nil?
      new_data.gsub! /Pass Play 37\b/, " "
    else
      new_data.gsub! /Pass Play 37\b/, pass_play37 
    end                     
    if pass_play38.nil?
      new_data.gsub! /Pass Play 38\b/, " "
    else
      new_data.gsub! /Pass Play 38\b/, pass_play38
    end    
    if pass_play39.nil?
      new_data.gsub! /Pass Play 39\b/, " "
    else
      new_data.gsub! /Pass Play 39\b/, pass_play39 
    end  
    if pass_play40.nil?
      new_data.gsub! /Pass Play 40\b/, " "
    else
      new_data.gsub! /Pass Play 40\b/, pass_play40 
    end 
    if pass_play41.nil?
      new_data.gsub! /Pass Play 41\b/, " "
    else
      new_data.gsub! /Pass Play 41\b/, pass_play41 
    end 
    if pass_play42.nil?
      new_data.gsub! /Pass Play 42\b/, " "
    else
      new_data.gsub! /Pass Play 42\b/, pass_play42 
    end    
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play44.nil?
      new_data.gsub! /Pass Play 44\b/, " "
    else
      new_data.gsub! /Pass Play 44\b/, pass_play44 
    end 
    if pass_play45.nil?
      new_data.gsub! /Pass Play 45\b/, " "
    else
      new_data.gsub! /Pass Play 45\b/, pass_play45 
    end 
    if pass_play46.nil?
      new_data.gsub! /Pass Play 46\b/, " "
    else
      new_data.gsub! /Pass Play 46\b/, pass_play46 
    end 
    if pass_play47.nil?
      new_data.gsub! /Pass Play 47\b/, " "
    else
      new_data.gsub! /Pass Play 47\b/, pass_play47 
    end                     
    if pass_play48.nil?
      new_data.gsub! /Pass Play 48\b/, " "
    else
      new_data.gsub! /Pass Play 48\b/, pass_play48
    end    
    if pass_play49.nil?
      new_data.gsub! /Pass Play 49\b/, " "
    else
      new_data.gsub! /Pass Play 49\b/, pass_play49 
    end 
    if pass_play50.nil?
      new_data.gsub! /Pass Play 50\b/, " "
    else
      new_data.gsub! /Pass Play 50\b/, pass_play50 
    end 
    if pass_play51.nil?
      new_data.gsub! /Pass Play 51\b/, " "
    else
      new_data.gsub! /Pass Play 51\b/, pass_play51 
    end 
    if pass_play52.nil?
      new_data.gsub! /Pass Play 52\b/, " "
    else
      new_data.gsub! /Pass Play 52\b/, pass_play52 
    end 

    self.update :sdata => new_data, 
    :s_format => default_script3.us_format3,
    :s_class => default_script3.us_class3,
    :col_widths => default_script3.col_widths,
    :orig_col_widths => default_script3.col_widths
  end

  #Sets the initial script (standard) when created
	def use_default_script
    event = Event.find_by(id: self.event_id)
    title = self.title
    date = self.end_time.strftime("%m-%d-%Y")

    #Period 1 plays
    period1 = event.plays.where('period1 = ?', true)
    #period1 = period1plays.order(:created_at)
    unless period1[0].nil?  
      play10 = period1[0].fullname 
    end
    unless period1[1].nil?  
      play11 = period1[1].fullname 
    end
    unless period1[2].nil?  
      play12 = period1[2].fullname 
    end
    unless period1[3].nil?  
      play13 = period1[3].fullname 
    end
    unless period1[4].nil?  
      play14 = period1[4].fullname 
    end
    unless period1[5].nil?  
      play15 = period1[5].fullname 
    end
    unless period1[6].nil?  
      play16 = period1[6].fullname 
    end
    unless period1[7].nil?  
      play17 = period1[7].fullname 
    end
    unless period1[8].nil?  
      play18 = period1[8].fullname 
    end
    unless period1[9].nil?  
      play19 = period1[9].fullname 
    end
    unless period1[10].nil?  
      play110 = period1[10].fullname 
    end
    unless period1[11].nil?  
      play111 = period1[11].fullname 
    end
    unless period1[12].nil?  
      play112 = period1[12].fullname 
    end
    unless period1[13].nil?  
      play113 = period1[13].fullname 
    end
    unless period1[14].nil?  
      play114 = period1[14].fullname 
    end
    unless period1[15].nil?  
      play115 = period1[15].fullname 
    end
    unless period1[16].nil?  
      play116 = period1[16].fullname 
    end
    unless period1[17].nil?  
      play117 = period1[17].fullname 
    end
    unless period1[18].nil?  
      play118 = period1[18].fullname 
    end
    unless period1[19].nil?  
      play119 = period1[19].fullname 
    end    
    unless period1[20].nil?  
      play120 = period1[20].fullname 
    end
    unless period1[21].nil?  
      play121 = period1[21].fullname 
    end
    unless period1[22].nil?  
      play122 = period1[22].fullname 
    end
    unless period1[23].nil?  
      play123 = period1[23].fullname 
    end
    unless period1[24].nil?  
      play124 = period1[24].fullname 
    end      

    #Period 2 plays 
    period2 = event.plays.where('period2 = ?', true)
    #period2 = period2plays.order(:created_at)
    unless period2[0].nil?  
      play20 = period2[0].fullname 
    end
    unless period2[1].nil?  
      play21 = period2[1].fullname 
    end  
    unless period2[2].nil?  
      play22 = period2[2].fullname 
    end
    unless period2[3].nil?  
      play23 = period2[3].fullname 
    end
    unless period2[4].nil?  
      play24 = period2[4].fullname 
    end
    unless period2[5].nil?  
      play25 = period2[5].fullname 
    end
    unless period2[6].nil?  
      play26 = period2[6].fullname 
    end
    unless period2[7].nil?  
      play27 = period2[7].fullname 
    end
    unless period2[8].nil?  
      play28 = period2[8].fullname 
    end
    unless period2[9].nil?  
      play29 = period2[9].fullname 
    end
    unless period2[10].nil?  
      play210 = period2[10].fullname 
    end
    unless period2[11].nil?  
      play211 = period2[11].fullname 
    end
    unless period2[12].nil?  
      play212 = period2[12].fullname 
    end
    unless period2[13].nil?  
      play213 = period2[13].fullname 
    end
    unless period2[14].nil?  
      play214 = period2[14].fullname 
    end
    unless period2[15].nil?  
      play215 = period2[15].fullname 
    end
    unless period2[16].nil?  
      play216 = period2[16].fullname 
    end
    unless period2[17].nil?  
      play217 = period2[17].fullname 
    end
    unless period2[18].nil?  
      play218 = period2[18].fullname 
    end
    unless period2[19].nil?  
      play219 = period2[19].fullname 
    end    
    unless period2[20].nil?  
      play220 = period2[20].fullname 
    end
    unless period2[21].nil?  
      play221 = period2[21].fullname 
    end
    unless period2[22].nil?  
      play222 = period2[22].fullname 
    end
    unless period2[23].nil?  
      play223 = period2[23].fullname 
    end
    unless period2[24].nil?  
      play224 = period2[24].fullname 
    end      

    #Period 3 plays 
    period3 = event.plays.where('period3 = ?', true)
    #period3 = period3plays.order(:created_at)
    unless period3[0].nil?  
      play30 = period3[0].fullname 
    end
    unless period3[1].nil?  
      play31 = period3[1].fullname 
    end  
    unless period3[2].nil?  
      play32 = period3[2].fullname 
    end
    unless period3[3].nil?  
      play33 = period3[3].fullname 
    end
    unless period3[4].nil?  
      play34 = period3[4].fullname 
    end
    unless period3[5].nil?  
      play35 = period3[5].fullname 
    end
    unless period3[6].nil?  
      play36 = period3[6].fullname 
    end
    unless period3[7].nil?  
      play37 = period3[7].fullname 
    end
    unless period3[8].nil?  
      play38 = period3[8].fullname 
    end
    unless period3[9].nil?  
      play39 = period3[9].fullname 
    end
    unless period3[10].nil?  
      play310 = period3[10].fullname 
    end
    unless period3[11].nil?  
      play311 = period3[11].fullname 
    end
    unless period3[12].nil?  
      play312 = period3[12].fullname 
    end
    unless period3[13].nil?  
      play313 = period3[13].fullname 
    end
    unless period3[14].nil?  
      play314 = period3[14].fullname 
    end
    unless period3[15].nil?  
      play315 = period3[15].fullname 
    end
    unless period3[16].nil?  
      play316 = period3[16].fullname 
    end
    unless period3[17].nil?  
      play317 = period3[17].fullname 
    end
    unless period3[18].nil?  
      play318 = period3[18].fullname 
    end
    unless period3[19].nil?  
      play319 = period3[19].fullname 
    end    
    unless period3[20].nil?  
      play320 = period3[20].fullname 
    end
    unless period3[21].nil?  
      play321 = period3[21].fullname 
    end
    unless period3[22].nil?  
      play322 = period3[22].fullname 
    end
    unless period3[23].nil?  
      play323 = period3[23].fullname 
    end
    unless period3[24].nil?  
      play324 = period3[24].fullname 
    end  

    #Period 4 plays 
    period4 = event.plays.where('period4 = ?', true)
    #period4 = period4plays.order(:created_at)
    unless period4[0].nil?  
      play40 = period4[0].fullname 
    end
    unless period4[1].nil?  
      play41 = period4[1].fullname 
    end  
    unless period4[2].nil?  
      play42 = period4[2].fullname 
    end
    unless period4[3].nil?  
      play43 = period4[3].fullname 
    end
    unless period4[4].nil?  
      play44 = period4[4].fullname 
    end
    unless period4[5].nil?  
      play45 = period4[5].fullname 
    end
    unless period4[6].nil?  
      play46 = period4[6].fullname 
    end
    unless period4[7].nil?  
      play47 = period4[7].fullname 
    end
    unless period4[8].nil?  
      play48 = period4[8].fullname 
    end
    unless period4[9].nil?  
      play49 = period4[9].fullname 
    end
    unless period4[10].nil?  
      play410 = period4[10].fullname 
    end
    unless period4[11].nil?  
      play411 = period4[11].fullname 
    end
    unless period4[12].nil?  
      play412 = period4[12].fullname 
    end
    unless period4[13].nil?  
      play413 = period4[13].fullname 
    end
    unless period4[14].nil?  
      play414 = period4[14].fullname 
    end
    unless period4[15].nil?  
      play415 = period4[15].fullname 
    end
    unless period4[16].nil?  
      play416 = period4[16].fullname 
    end
    unless period4[17].nil?  
      play417 = period4[17].fullname 
    end
    unless period4[18].nil?  
      play418 = period4[18].fullname 
    end
    unless period4[19].nil?  
      play419 = period4[19].fullname 
    end    
    unless period4[20].nil?  
      play420 = period4[20].fullname 
    end
    unless period4[21].nil?  
      play421 = period4[21].fullname 
    end
    unless period4[22].nil?  
      play422 = period4[22].fullname 
    end
    unless period4[23].nil?  
      play423 = period4[23].fullname 
    end
    unless period4[24].nil?  
      play424 = period4[24].fullname 
    end      

		self.update :sdata => "[
      ['#{title}', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      ['Segment 1', ' ', ' ', ' ', ' ', 'Segment 3', ' ', ' ', ' ', ' '],  
      ['#', 'H', 'D-D', 'Formation & Play Call', 'Defense', '#', 'H', 'D-D', 'Formation & Play Call', 'Defense'],
      ['1', ' ', ' ', '#{play10}', ' ', '1', ' ', ' ', '#{play30}', ' '],
      ['2', ' ', ' ', '#{play11}', ' ', '2', ' ', ' ', '#{play31}', ' '],
      ['3', ' ', ' ', '#{play12}', ' ', '3', ' ', ' ', '#{play32}', ' '],
      ['4', ' ', ' ', '#{play13}', ' ', '4', ' ', ' ', '#{play33}', ' '],
      ['5', ' ', ' ', '#{play14}', ' ', '5', ' ', ' ', '#{play34}', ' '],
      ['6', ' ', ' ', '#{play15}', ' ', '6', ' ', ' ', '#{play35}', ' '],
      ['7', ' ', ' ', '#{play16}', ' ', '7', ' ', ' ', '#{play36}', ' '],
      ['8', ' ', ' ', '#{play17}', ' ', '8', ' ', ' ', '#{play37}', ' '],
      ['9', ' ', ' ', '#{play18}', ' ', '9', ' ', ' ', '#{play38}', ' '],
      ['10', ' ', ' ', '#{play19}', ' ', '10', ' ', ' ', '#{play39}', ' '],
      ['11', ' ', ' ', '#{play110}', ' ', '11', ' ', ' ', '#{play310}', ' '],
      ['12', ' ', ' ', '#{play111}', ' ', '12', ' ', ' ', '#{play311}', ' '],
      ['13', ' ', ' ', '#{play112}', ' ', '13', ' ', ' ', '#{play312}', ' '],
      ['14', ' ', ' ', '#{play113}', ' ', '14', ' ', ' ', '#{play313}', ' '],
      ['15', ' ', ' ', '#{play114}', ' ', '15', ' ', ' ', '#{play314}', ' '],
      ['16', ' ', ' ', '#{play115}', ' ', '16', ' ', ' ', '#{play315}', ' '],
      ['17', ' ', ' ', '#{play116}', ' ', '17', ' ', ' ', '#{play316}', ' '],
      ['18', ' ', ' ', '#{play117}', ' ', '18', ' ', ' ', '#{play317}', ' '],
      ['19', ' ', ' ', '#{play118}', ' ', '19', ' ', ' ', '#{play318}', ' '],
      ['20', ' ', ' ', '#{play119}', ' ', '20', ' ', ' ', '#{play319}', ' '],
      ['21', ' ', ' ', '#{play120}', ' ', '21', ' ', ' ', '#{play320}', ' '],
      ['22', ' ', ' ', '#{play121}', ' ', '22', ' ', ' ', '#{play321}', ' '],
      ['23', ' ', ' ', '#{play122}', ' ', '23', ' ', ' ', '#{play322}', ' '],
      ['24', ' ', ' ', '#{play123}', ' ', '24', ' ', ' ', '#{play323}', ' '],
      ['25', ' ', ' ', '#{play124}', ' ', '25', ' ', ' ', '#{play324}', ' ', ' '],
      ['Segment 2', ' ', ' ', ' ', ' ', 'Segment 4', ' ', ' ', ' ', ' '],  
      ['#', 'H', 'D-D', 'Formation & Play Call', 'Defense', '#', 'H', 'D-D', 'Formation & Play Call', 'Defense'], 
      ['1', ' ', ' ', '#{play20}', ' ', '1', ' ', ' ', '#{play40}', ' '],
      ['2', ' ', ' ', '#{play21}', ' ', '2', ' ', ' ', '#{play41}', ' '],
      ['3', ' ', ' ', '#{play22}', ' ', '3', ' ', ' ', '#{play42}', ' '],
      ['4', ' ', ' ', '#{play23}', ' ', '4', ' ', ' ', '#{play43}', ' '],
      ['5', ' ', ' ', '#{play24}', ' ', '5', ' ', ' ', '#{play44}', ' '],
      ['6', ' ', ' ', '#{play25}', ' ', '6', ' ', ' ', '#{play45}', ' '],
      ['7', ' ', ' ', '#{play26}', ' ', '7', ' ', ' ', '#{play46}', ' '],
      ['8', ' ', ' ', '#{play27}', ' ', '8', ' ', ' ', '#{play47}', ' '],
      ['9', ' ', ' ', '#{play28}', ' ', '9', ' ', ' ', '#{play48}', ' '],
      ['10', ' ', ' ', '#{play29}', ' ', '10', ' ', ' ', '#{play49}', ' '],
      ['11', ' ', ' ', '#{play210}', ' ', '11', ' ', ' ', '#{play410}', ' '],
      ['12', ' ', ' ', '#{play211}', ' ', '12', ' ', ' ', '#{play411}', ' '],
      ['13', ' ', ' ', '#{play212}', ' ', '13', ' ', ' ', '#{play412}', ' '],
      ['14', ' ', ' ', '#{play213}', ' ', '14', ' ', ' ', '#{play413}', ' '],
      ['15', ' ', ' ', '#{play214}', ' ', '15', ' ', ' ', '#{play414}', ' '],
      ['16', ' ', ' ', '#{play215}', ' ', '16', ' ', ' ', '#{play415}', ' '],
      ['17', ' ', ' ', '#{play216}', ' ', '17', ' ', ' ', '#{play416}', ' '],
      ['18', ' ', ' ', '#{play217}', ' ', '18', ' ', ' ', '#{play417}', ' '],
      ['19', ' ', ' ', '#{play218}', ' ', '19', ' ', ' ', '#{play418}', ' '],
      ['20', ' ', ' ', '#{play219}', ' ', '20', ' ', ' ', '#{play419}', ' '],
      ['21', ' ', ' ', '#{play220}', ' ', '21', ' ', ' ', '#{play420}', ' '],
      ['22', ' ', ' ', '#{play221}', ' ', '22', ' ', ' ', '#{play421}', ' '],
      ['23', ' ', ' ', '#{play222}', ' ', '23', ' ', ' ', '#{play422}', ' '],
      ['24', ' ', ' ', '#{play223}', ' ', '24', ' ', ' ', '#{play423}', ' '],
      ['25', ' ', ' ', '#{play224}', ' ', '25', ' ', ' ', '#{play424}', ' '],
      ['Date: #{date}', ' ', ' ', ' ', 'Additional notes below: ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']      
      ]",
      :col_widths => '[30,40,40,330,90,30,40,40,330,90]',
      :orig_col_widths => '[30,40,40,330,90,30,40,40,330,90]',
      :s_format => 
      '[{"row":2,"col":0,"rowspan":1,"colspan":5},{"row":2,"col":5,"rowspan":1,"colspan":5},{"row":29,"col":0,"rowspan":1,"colspan":5},{"row":29,"col":5,"rowspan":1,"colspan":5},{"row":56,"col":0,"rowspan":1,"colspan":4},{"row":56,"col":4,"rowspan":1,"colspan":6},{"row":57,"col":0,"rowspan":1,"colspan":10},{"row":58,"col":0,"rowspan":1,"colspan":10},{"row":59,"col":0,"rowspan":1,"colspan":10},{"row":0,"col":0,"rowspan":2,"colspan":10}]',
      :s_class => 
      '[{"row":0,"col":0,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":1,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":2,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":3,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":4,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":5,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":6,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":7,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":8,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":0,"col":9,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":0,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":1,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":2,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":3,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":4,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":5,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":6,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":7,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":8,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":1,"col":9,"className":" htDShade htLargeText htBold myTable htCenter htMiddle","type":"text"},{"row":2,"col":0,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":1,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":2,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":3,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":4,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":5,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":6,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":7,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":8,"className":" htBold htShade myTable htCenter","type":"text"},{"row":2,"col":9,"className":" htBold htShade myTable htCenter","type":"text"},{"row":3,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":1,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":2,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":3,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":4,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":6,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":7,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":8,"className":" htBold myTable htCenter","type":"text"},{"row":3,"col":9,"className":" htBold myTable htCenter","type":"text"},{"row":4,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":4,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":4,"col":2,"className":" myTable htCenter","type":"text"},{"row":4,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":4,"col":4,"className":" myTable htCenter","type":"text"},{"row":4,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":4,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":4,"col":7,"className":" myTable htCenter","type":"text"},{"row":4,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":4,"col":9,"className":" myTable htCenter","type":"text"},{"row":5,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":5,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":5,"col":2,"className":" myTable htCenter","type":"text"},{"row":5,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":5,"col":4,"className":" myTable htCenter","type":"text"},{"row":5,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":5,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":5,"col":7,"className":" myTable htCenter","type":"text"},{"row":5,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":5,"col":9,"className":" myTable htCenter","type":"text"},{"row":6,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":6,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":6,"col":2,"className":" myTable htCenter","type":"text"},{"row":6,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":6,"col":4,"className":" myTable htCenter","type":"text"},{"row":6,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":6,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":6,"col":7,"className":" myTable htCenter","type":"text"},{"row":6,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":6,"col":9,"className":" myTable htCenter","type":"text"},{"row":7,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":7,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":7,"col":2,"className":" myTable htCenter","type":"text"},{"row":7,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":7,"col":4,"className":" myTable htCenter","type":"text"},{"row":7,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":7,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":7,"col":7,"className":" myTable htCenter","type":"text"},{"row":7,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":7,"col":9,"className":" myTable htCenter","type":"text"},{"row":8,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":8,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":8,"col":2,"className":" myTable htCenter","type":"text"},{"row":8,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":8,"col":4,"className":" myTable htCenter","type":"text"},{"row":8,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":8,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":8,"col":7,"className":" myTable htCenter","type":"text"},{"row":8,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":8,"col":9,"className":" myTable htCenter","type":"text"},{"row":9,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":9,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":9,"col":2,"className":" myTable htCenter","type":"text"},{"row":9,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":9,"col":4,"className":" myTable htCenter","type":"text"},{"row":9,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":9,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":9,"col":7,"className":" myTable htCenter","type":"text"},{"row":9,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":9,"col":9,"className":" myTable htCenter","type":"text"},{"row":10,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":10,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":10,"col":2,"className":" myTable htCenter","type":"text"},{"row":10,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":10,"col":4,"className":" myTable htCenter","type":"text"},{"row":10,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":10,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":10,"col":7,"className":" myTable htCenter","type":"text"},{"row":10,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":10,"col":9,"className":" myTable htCenter","type":"text"},{"row":11,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":11,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":11,"col":2,"className":" myTable htCenter","type":"text"},{"row":11,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":11,"col":4,"className":" myTable htCenter","type":"text"},{"row":11,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":11,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":11,"col":7,"className":" myTable htCenter","type":"text"},{"row":11,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":11,"col":9,"className":" myTable htCenter","type":"text"},{"row":12,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":12,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":12,"col":2,"className":" myTable htCenter","type":"text"},{"row":12,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":12,"col":4,"className":" myTable htCenter","type":"text"},{"row":12,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":12,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":12,"col":7,"className":" myTable htCenter","type":"text"},{"row":12,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":12,"col":9,"className":" myTable htCenter","type":"text"},{"row":13,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":13,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":13,"col":2,"className":" myTable htCenter","type":"text"},{"row":13,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":13,"col":4,"className":" myTable htCenter","type":"text"},{"row":13,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":13,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":13,"col":7,"className":" myTable htCenter","type":"text"},{"row":13,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":13,"col":9,"className":" myTable htCenter","type":"text"},{"row":14,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":14,"col":2,"className":" myTable htCenter","type":"text"},{"row":14,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":14,"col":4,"className":" myTable htCenter","type":"text"},{"row":14,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":14,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":14,"col":7,"className":" myTable htCenter","type":"text"},{"row":14,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":14,"col":9,"className":" myTable htCenter","type":"text"},{"row":15,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":15,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":15,"col":2,"className":" myTable htCenter","type":"text"},{"row":15,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":15,"col":4,"className":" myTable htCenter","type":"text"},{"row":15,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":15,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":15,"col":7,"className":" myTable htCenter","type":"text"},{"row":15,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":15,"col":9,"className":" myTable htCenter","type":"text"},{"row":16,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":16,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":16,"col":2,"className":" myTable htCenter","type":"text"},{"row":16,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":16,"col":4,"className":" myTable htCenter","type":"text"},{"row":16,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":16,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":16,"col":7,"className":" myTable htCenter","type":"text"},{"row":16,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":16,"col":9,"className":" myTable htCenter","type":"text"},{"row":17,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":17,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":17,"col":2,"className":" myTable htCenter","type":"text"},{"row":17,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":17,"col":4,"className":" myTable htCenter","type":"text"},{"row":17,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":17,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":17,"col":7,"className":" myTable htCenter","type":"text"},{"row":17,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":17,"col":9,"className":" myTable htCenter","type":"text"},{"row":18,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":18,"col":2,"className":" myTable htCenter","type":"text"},{"row":18,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":18,"col":4,"className":" myTable htCenter","type":"text"},{"row":18,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":18,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":18,"col":7,"className":" myTable htCenter","type":"text"},{"row":18,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":18,"col":9,"className":" myTable htCenter","type":"text"},{"row":19,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":19,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":19,"col":2,"className":" myTable htCenter","type":"text"},{"row":19,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":19,"col":4,"className":" myTable htCenter","type":"text"},{"row":19,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":19,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":19,"col":7,"className":" myTable htCenter","type":"text"},{"row":19,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":19,"col":9,"className":" myTable htCenter","type":"text"},{"row":20,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":20,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":20,"col":2,"className":" myTable htCenter","type":"text"},{"row":20,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":20,"col":4,"className":" myTable htCenter","type":"text"},{"row":20,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":20,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":20,"col":7,"className":" myTable htCenter","type":"text"},{"row":20,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":20,"col":9,"className":" myTable htCenter","type":"text"},{"row":21,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":21,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":21,"col":2,"className":" myTable htCenter","type":"text"},{"row":21,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":21,"col":4,"className":" myTable htCenter","type":"text"},{"row":21,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":21,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":21,"col":7,"className":" myTable htCenter","type":"text"},{"row":21,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":21,"col":9,"className":" myTable htCenter","type":"text"},{"row":22,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":22,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":22,"col":2,"className":" myTable htCenter","type":"text"},{"row":22,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":22,"col":4,"className":" myTable htCenter","type":"text"},{"row":22,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":22,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":22,"col":7,"className":" myTable htCenter","type":"text"},{"row":22,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":22,"col":9,"className":" myTable htCenter","type":"text"},{"row":23,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":23,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":23,"col":2,"className":" myTable htCenter","type":"text"},{"row":23,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":23,"col":4,"className":" myTable htCenter","type":"text"},{"row":23,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":23,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":23,"col":7,"className":" myTable htCenter","type":"text"},{"row":23,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":23,"col":9,"className":" myTable htCenter","type":"text"},{"row":24,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":24,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":24,"col":2,"className":" myTable htCenter","type":"text"},{"row":24,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":24,"col":4,"className":" myTable htCenter","type":"text"},{"row":24,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":24,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":24,"col":7,"className":" myTable htCenter","type":"text"},{"row":24,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":24,"col":9,"className":" myTable htCenter","type":"text"},{"row":25,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":25,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":25,"col":2,"className":" myTable htCenter","type":"text"},{"row":25,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":25,"col":4,"className":" myTable htCenter","type":"text"},{"row":25,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":25,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":25,"col":7,"className":" myTable htCenter","type":"text"},{"row":25,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":25,"col":9,"className":" myTable htCenter","type":"text"},{"row":26,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":26,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":26,"col":2,"className":" myTable htCenter","type":"text"},{"row":26,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":26,"col":4,"className":" myTable htCenter","type":"text"},{"row":26,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":26,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":26,"col":7,"className":" myTable htCenter","type":"text"},{"row":26,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":26,"col":9,"className":" myTable htCenter","type":"text"},{"row":27,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":27,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":27,"col":2,"className":" myTable htCenter","type":"text"},{"row":27,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":27,"col":4,"className":" myTable htCenter","type":"text"},{"row":27,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":27,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":27,"col":7,"className":" myTable htCenter","type":"text"},{"row":27,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":27,"col":9,"className":" myTable htCenter","type":"text"},{"row":28,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":28,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":28,"col":2,"className":" myTable htCenter","type":"text"},{"row":28,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":28,"col":4,"className":" myTable htCenter","type":"text"},{"row":28,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":28,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":28,"col":7,"className":" myTable htCenter","type":"text"},{"row":28,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":28,"col":9,"className":" myTable htCenter","type":"text"},{"row":29,"col":0,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":1,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":2,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":3,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":4,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":5,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":6,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":7,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":8,"className":" htShade htBold myTable htCenter","type":"text"},{"row":29,"col":9,"className":" htShade htBold myTable htCenter","type":"text"},{"row":30,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":1,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":2,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":3,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":4,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":6,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":7,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":8,"className":" htBold myTable htCenter","type":"text"},{"row":30,"col":9,"className":" htBold myTable htCenter","type":"text"},{"row":31,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":31,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":31,"col":2,"className":" myTable htCenter","type":"text"},{"row":31,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":31,"col":4,"className":" myTable htCenter","type":"text"},{"row":31,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":31,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":31,"col":7,"className":" myTable htCenter","type":"text"},{"row":31,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":31,"col":9,"className":" myTable htCenter","type":"text"},{"row":32,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":32,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":32,"col":2,"className":" myTable htCenter","type":"text"},{"row":32,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":32,"col":4,"className":" myTable htCenter","type":"text"},{"row":32,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":32,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":32,"col":7,"className":" myTable htCenter","type":"text"},{"row":32,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":32,"col":9,"className":" myTable htCenter","type":"text"},{"row":33,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":33,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":33,"col":2,"className":" myTable htCenter","type":"text"},{"row":33,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":33,"col":4,"className":" myTable htCenter","type":"text"},{"row":33,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":33,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":33,"col":7,"className":" myTable htCenter","type":"text"},{"row":33,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":33,"col":9,"className":" myTable htCenter","type":"text"},{"row":34,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":34,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":34,"col":2,"className":" myTable htCenter","type":"text"},{"row":34,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":34,"col":4,"className":" myTable htCenter","type":"text"},{"row":34,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":34,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":34,"col":7,"className":" myTable htCenter","type":"text"},{"row":34,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":34,"col":9,"className":" myTable htCenter","type":"text"},{"row":35,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":35,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":35,"col":2,"className":" myTable htCenter","type":"text"},{"row":35,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":35,"col":4,"className":" myTable htCenter","type":"text"},{"row":35,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":35,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":35,"col":7,"className":" myTable htCenter","type":"text"},{"row":35,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":35,"col":9,"className":" myTable htCenter","type":"text"},{"row":36,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":36,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":36,"col":2,"className":" myTable htCenter","type":"text"},{"row":36,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":36,"col":4,"className":" myTable htCenter","type":"text"},{"row":36,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":36,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":36,"col":7,"className":" myTable htCenter","type":"text"},{"row":36,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":36,"col":9,"className":" myTable htCenter","type":"text"},{"row":37,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":37,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":37,"col":2,"className":" myTable htCenter","type":"text"},{"row":37,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":37,"col":4,"className":" myTable htCenter","type":"text"},{"row":37,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":37,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":37,"col":7,"className":" myTable htCenter","type":"text"},{"row":37,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":37,"col":9,"className":" myTable htCenter","type":"text"},{"row":38,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":38,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":38,"col":2,"className":" myTable htCenter","type":"text"},{"row":38,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":38,"col":4,"className":" myTable htCenter","type":"text"},{"row":38,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":38,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":38,"col":7,"className":" myTable htCenter","type":"text"},{"row":38,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":38,"col":9,"className":" myTable htCenter","type":"text"},{"row":39,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":39,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":39,"col":2,"className":" myTable htCenter","type":"text"},{"row":39,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":39,"col":4,"className":" myTable htCenter","type":"text"},{"row":39,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":39,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":39,"col":7,"className":" myTable htCenter","type":"text"},{"row":39,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":39,"col":9,"className":" myTable htCenter","type":"text"},{"row":40,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":40,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":40,"col":2,"className":" myTable htCenter","type":"text"},{"row":40,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":40,"col":4,"className":" myTable htCenter","type":"text"},{"row":40,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":40,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":40,"col":7,"className":" myTable htCenter","type":"text"},{"row":40,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":40,"col":9,"className":" myTable htCenter","type":"text"},{"row":41,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":41,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":41,"col":2,"className":" myTable htCenter","type":"text"},{"row":41,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":41,"col":4,"className":" myTable htCenter","type":"text"},{"row":41,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":41,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":41,"col":7,"className":" myTable htCenter","type":"text"},{"row":41,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":41,"col":9,"className":" myTable htCenter","type":"text"},{"row":42,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":42,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":42,"col":2,"className":" myTable htCenter","type":"text"},{"row":42,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":42,"col":4,"className":" myTable htCenter","type":"text"},{"row":42,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":42,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":42,"col":7,"className":" myTable htCenter","type":"text"},{"row":42,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":42,"col":9,"className":" myTable htCenter","type":"text"},{"row":43,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":43,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":43,"col":2,"className":" myTable htCenter","type":"text"},{"row":43,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":43,"col":4,"className":" myTable htCenter","type":"text"},{"row":43,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":43,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":43,"col":7,"className":" myTable htCenter","type":"text"},{"row":43,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":43,"col":9,"className":" myTable htCenter","type":"text"},{"row":44,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":44,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":44,"col":2,"className":" myTable htCenter","type":"text"},{"row":44,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":44,"col":4,"className":" myTable htCenter","type":"text"},{"row":44,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":44,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":44,"col":7,"className":" myTable htCenter","type":"text"},{"row":44,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":44,"col":9,"className":" myTable htCenter","type":"text"},{"row":45,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":45,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":45,"col":2,"className":" myTable htCenter","type":"text"},{"row":45,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":45,"col":4,"className":" myTable htCenter","type":"text"},{"row":45,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":45,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":45,"col":7,"className":" myTable htCenter","type":"text"},{"row":45,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":45,"col":9,"className":" myTable htCenter","type":"text"},{"row":46,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":46,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":46,"col":2,"className":" myTable htCenter","type":"text"},{"row":46,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":46,"col":4,"className":" myTable htCenter","type":"text"},{"row":46,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":46,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":46,"col":7,"className":" myTable htCenter","type":"text"},{"row":46,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":46,"col":9,"className":" myTable htCenter","type":"text"},{"row":47,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":47,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":47,"col":2,"className":" myTable htCenter","type":"text"},{"row":47,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":47,"col":4,"className":" myTable htCenter","type":"text"},{"row":47,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":47,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":47,"col":7,"className":" myTable htCenter","type":"text"},{"row":47,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":47,"col":9,"className":" myTable htCenter","type":"text"},{"row":48,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":48,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":48,"col":2,"className":" myTable htCenter","type":"text"},{"row":48,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":48,"col":4,"className":" myTable htCenter","type":"text"},{"row":48,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":48,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":48,"col":7,"className":" myTable htCenter","type":"text"},{"row":48,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":48,"col":9,"className":" myTable htCenter","type":"text"},{"row":49,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":49,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":49,"col":2,"className":" myTable htCenter","type":"text"},{"row":49,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":49,"col":4,"className":" myTable htCenter","type":"text"},{"row":49,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":49,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":49,"col":7,"className":" myTable htCenter","type":"text"},{"row":49,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":49,"col":9,"className":" myTable htCenter","type":"text"},{"row":50,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":50,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":50,"col":2,"className":" myTable htCenter","type":"text"},{"row":50,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":50,"col":4,"className":" myTable htCenter","type":"text"},{"row":50,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":50,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":50,"col":7,"className":" myTable htCenter","type":"text"},{"row":50,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":50,"col":9,"className":" myTable htCenter","type":"text"},{"row":51,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":51,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":51,"col":2,"className":" myTable htCenter","type":"text"},{"row":51,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":51,"col":4,"className":" myTable htCenter","type":"text"},{"row":51,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":51,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":51,"col":7,"className":" myTable htCenter","type":"text"},{"row":51,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":51,"col":9,"className":" myTable htCenter","type":"text"},{"row":52,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":52,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":52,"col":2,"className":" myTable htCenter","type":"text"},{"row":52,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":52,"col":4,"className":" myTable htCenter","type":"text"},{"row":52,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":52,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":52,"col":7,"className":" myTable htCenter","type":"text"},{"row":52,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":52,"col":9,"className":" myTable htCenter","type":"text"},{"row":53,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":53,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":53,"col":2,"className":" myTable htCenter","type":"text"},{"row":53,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":53,"col":4,"className":" myTable htCenter","type":"text"},{"row":53,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":53,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":53,"col":7,"className":" myTable htCenter","type":"text"},{"row":53,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":53,"col":9,"className":" myTable htCenter","type":"text"},{"row":54,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":54,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":54,"col":2,"className":" myTable htCenter","type":"text"},{"row":54,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":54,"col":4,"className":" myTable htCenter","type":"text"},{"row":54,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":54,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":54,"col":7,"className":" myTable htCenter","type":"text"},{"row":54,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":54,"col":9,"className":" myTable htCenter","type":"text"},{"row":55,"col":0,"className":" htBold myTable htCenter","type":"text"},{"row":55,"col":1,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":55,"col":2,"className":" myTable htCenter","type":"text"},{"row":55,"col":3,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":55,"col":4,"className":" myTable htCenter","type":"text"},{"row":55,"col":5,"className":" htBold myTable htCenter","type":"text"},{"row":55,"col":6,"className":" myTable htCenter","type":"dropdown","source":["","L","M","R"]},{"row":55,"col":7,"className":" myTable htCenter","type":"text"},{"row":55,"col":8,"className":" myTable htCenter","type":"dropdown","source":"pCollection"},{"row":55,"col":9,"className":" myTable htCenter","type":"text"},{"row":56,"col":0,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":1,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":2,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":3,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":4,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":5,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":6,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":7,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":8,"className":" htShade htBold myTable","type":"text"},{"row":56,"col":9,"className":" htShade htBold myTable","type":"text"},{"row":57,"col":0,"className":" myTable","type":"text"},{"row":57,"col":1,"className":" myTable","type":"text"},{"row":57,"col":2,"className":" myTable","type":"text"},{"row":57,"col":3,"className":" myTable","type":"text"},{"row":57,"col":4,"className":" myTable","type":"text"},{"row":57,"col":5,"className":" myTable","type":"text"},{"row":57,"col":6,"className":" myTable","type":"text"},{"row":57,"col":7,"className":" myTable","type":"text"},{"row":57,"col":8,"className":" myTable","type":"text"},{"row":57,"col":9,"className":" myTable","type":"text"},{"row":58,"col":0,"className":" myTable","type":"text"},{"row":58,"col":1,"className":" myTable","type":"text"},{"row":58,"col":2,"className":" myTable","type":"text"},{"row":58,"col":3,"className":" myTable","type":"text"},{"row":58,"col":4,"className":" myTable","type":"text"},{"row":58,"col":5,"className":" myTable","type":"text"},{"row":58,"col":6,"className":" myTable","type":"text"},{"row":58,"col":7,"className":" myTable","type":"text"},{"row":58,"col":8,"className":" myTable","type":"text"},{"row":58,"col":9,"className":" myTable","type":"text"},{"row":59,"col":0,"className":" myTable","type":"text"},{"row":59,"col":1,"className":" myTable","type":"text"},{"row":59,"col":2,"className":" myTable","type":"text"},{"row":59,"col":3,"className":" myTable","type":"text"},{"row":59,"col":4,"className":" myTable","type":"text"},{"row":59,"col":5,"className":" myTable","type":"text"},{"row":59,"col":6,"className":" myTable","type":"text"},{"row":59,"col":7,"className":" myTable","type":"text"},{"row":59,"col":8,"className":" myTable","type":"text"},{"row":59,"col":9,"className":" myTable","type":"text"}]'
	end

end
