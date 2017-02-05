class Script < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s-_@#&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  validates :start_time, :end_time, :presence => true	
  
	belongs_to :event
	belongs_to :user

	after_create :make_event, :default_script
	before_update :update_event
	after_destroy :delete_event

  before_validation :set_end_time
 
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

  #Sets the initial script when created
	def default_script
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
      ['#{title}', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      ['Segment 1', ' ', ' ', ' ', ' ', ' ', 'Segment 3', ' ', ' ', ' ', ' ', ' '],  
      ['#', 'H', 'D-D', 'Formation & Play Call', ' ', 'Defense', '#', 'H', 'D-D', 'Formation & Play Call', ' ', 'Defense'],
      ['1', ' ', ' ', '#{play10}', ' ', ' ', '1', ' ', ' ', '#{play30}', ' ', ' '],
      ['2', ' ', ' ', '#{play11}', ' ', ' ', '2', ' ', ' ', '#{play31}', ' ', ' '],
      ['3', ' ', ' ', '#{play12}', ' ', ' ', '3', ' ', ' ', '#{play32}', ' ', ' '],
      ['4', ' ', ' ', '#{play13}', ' ', ' ', '4', ' ', ' ', '#{play33}', ' ', ' '],
      ['5', ' ', ' ', '#{play14}', ' ', ' ', '5', ' ', ' ', '#{play34}', ' ', ' '],
      ['6', ' ', ' ', '#{play15}', ' ', ' ', '6', ' ', ' ', '#{play35}', ' ', ' '],
      ['7', ' ', ' ', '#{play16}', ' ', ' ', '7', ' ', ' ', '#{play36}', ' ', ' '],
      ['8', ' ', ' ', '#{play17}', ' ', ' ', '8', ' ', ' ', '#{play37}', ' ', ' '],
      ['9', ' ', ' ', '#{play18}', ' ', ' ', '9', ' ', ' ', '#{play38}', ' ', ' '],
      ['10', ' ', ' ', '#{play19}', ' ', ' ', '10', ' ', ' ', '#{play39}', ' ', ' '],
      ['11', ' ', ' ', '#{play110}', ' ', ' ', '11', ' ', ' ', '#{play310}', ' ', ' '],
      ['12', ' ', ' ', '#{play111}', ' ', ' ', '12', ' ', ' ', '#{play311}', ' ', ' '],
      ['13', ' ', ' ', '#{play112}', ' ', ' ', '13', ' ', ' ', '#{play312}', ' ', ' '],
      ['14', ' ', ' ', '#{play113}', ' ', ' ', '14', ' ', ' ', '#{play313}', ' ', ' '],
      ['15', ' ', ' ', '#{play114}', ' ', ' ', '15', ' ', ' ', '#{play314}', ' ', ' '],
      ['16', ' ', ' ', '#{play115}', ' ', ' ', '16', ' ', ' ', '#{play315}', ' ', ' '],
      ['17', ' ', ' ', '#{play116}', ' ', ' ', '17', ' ', ' ', '#{play316}', ' ', ' '],
      ['18', ' ', ' ', '#{play117}', ' ', ' ', '18', ' ', ' ', '#{play317}', ' ', ' '],
      ['19', ' ', ' ', '#{play118}', ' ', ' ', '19', ' ', ' ', '#{play318}', ' ', ' '],
      ['20', ' ', ' ', '#{play119}', ' ', ' ', '20', ' ', ' ', '#{play319}', ' ', ' '],
      ['21', ' ', ' ', '#{play120}', ' ', ' ', '21', ' ', ' ', '#{play320}', ' ', ' '],
      ['22', ' ', ' ', '#{play121}', ' ', ' ', '22', ' ', ' ', '#{play321}', ' ', ' '],
      ['23', ' ', ' ', '#{play122}', ' ', ' ', '23', ' ', ' ', '#{play322}', ' ', ' '],
      ['24', ' ', ' ', '#{play123}', ' ', ' ', '24', ' ', ' ', '#{play323}', ' ', ' '],
      ['25', ' ', ' ', '#{play124}', ' ', ' ', '25', ' ', ' ', '#{play324}', ' ', ' '],
                  ['Segment 2', ' ', ' ', ' ', ' ', ' ', 'Segment 4', ' ', ' ', ' ', ' ', ' '],  
      ['#', 'H', 'D-D', 'Formation & Play Call', ' ', 'Defense', '#', 'H', 'D-D', 'Formation & Play Call', ' ', 'Defense'], 
      ['1', ' ', ' ', '#{play20}', ' ', ' ', '1', ' ', ' ', '#{play40}', ' ', ' '],
      ['2', ' ', ' ', '#{play21}', ' ', ' ', '2', ' ', ' ', '#{play41}', ' ', ' '],
      ['3', ' ', ' ', '#{play22}', ' ', ' ', '3', ' ', ' ', '#{play42}', ' ', ' '],
      ['4', ' ', ' ', '#{play23}', ' ', ' ', '4', ' ', ' ', '#{play43}', ' ', ' '],
      ['5', ' ', ' ', '#{play24}', ' ', ' ', '5', ' ', ' ', '#{play44}', ' ', ' '],
      ['6', ' ', ' ', '#{play25}', ' ', ' ', '6', ' ', ' ', '#{play45}', ' ', ' '],
      ['7', ' ', ' ', '#{play26}', ' ', ' ', '7', ' ', ' ', '#{play46}', ' ', ' '],
      ['8', ' ', ' ', '#{play27}', ' ', ' ', '8', ' ', ' ', '#{play47}', ' ', ' '],
      ['9', ' ', ' ', '#{play28}', ' ', ' ', '9', ' ', ' ', '#{play48}', ' ', ' '],
      ['10', ' ', ' ', '#{play29}', ' ', ' ', '10', ' ', ' ', '#{play49}', ' ', ' '],
      ['11', ' ', ' ', '#{play210}', ' ', ' ', '11', ' ', ' ', '#{play410}', ' ', ' '],
      ['12', ' ', ' ', '#{play211}', ' ', ' ', '12', ' ', ' ', '#{play411}', ' ', ' '],
      ['13', ' ', ' ', '#{play212}', ' ', ' ', '13', ' ', ' ', '#{play412}', ' ', ' '],
      ['14', ' ', ' ', '#{play213}', ' ', ' ', '14', ' ', ' ', '#{play413}', ' ', ' '],
      ['15', ' ', ' ', '#{play214}', ' ', ' ', '15', ' ', ' ', '#{play414}', ' ', ' '],
      ['16', ' ', ' ', '#{play215}', ' ', ' ', '16', ' ', ' ', '#{play415}', ' ', ' '],
      ['17', ' ', ' ', '#{play216}', ' ', ' ', '17', ' ', ' ', '#{play416}', ' ', ' '],
      ['18', ' ', ' ', '#{play217}', ' ', ' ', '18', ' ', ' ', '#{play417}', ' ', ' '],
      ['19', ' ', ' ', '#{play218}', ' ', ' ', '19', ' ', ' ', '#{play418}', ' ', ' '],
      ['20', ' ', ' ', '#{play219}', ' ', ' ', '20', ' ', ' ', '#{play419}', ' ', ' '],
      ['21', ' ', ' ', '#{play220}', ' ', ' ', '21', ' ', ' ', '#{play420}', ' ', ' '],
      ['22', ' ', ' ', '#{play221}', ' ', ' ', '22', ' ', ' ', '#{play421}', ' ', ' '],
      ['23', ' ', ' ', '#{play222}', ' ', ' ', '23', ' ', ' ', '#{play422}', ' ', ' '],
      ['24', ' ', ' ', '#{play223}', ' ', ' ', '24', ' ', ' ', '#{play423}', ' ', ' '],
      ['25', ' ', ' ', '#{play224}', ' ', ' ', '25', ' ', ' ', '#{play424}', ' ', ' '],
      ['Date: #{date}', ' ', ' ', ' ', 'Additional notes below: ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], 
      [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']      
      ]"
	end

end
