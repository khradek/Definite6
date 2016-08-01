class Gamecall < ActiveRecord::Base

  title_regex = /\A[a-zA-Z\d\s-_@&\/\$]*\z/

  validates :title, presence: true, format: { with: title_regex }
  validates :start_time, :end_time, :presence => true

  belongs_to :event
  belongs_to :user
  
  after_create :gcmake_event, :default_gamecall
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

  #Sets the initial game call sheet when created
  def default_gamecall
    event = Event.find_by(id: self.event_id)
    title = self.title

    #----------Openers----------
    openers = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener')
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
    firstTens = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10')
     
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
    #----------End 1st/2nd & 10----------

    #----------2nd & Long----------
    secondLongs = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long')
     
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
    #----------End 2nd & Long ----------

    #----------3rd & Long ----------
    thirdLongs = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long')
     
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
    #----------End 3rd & Long----------    

    #----------2nd & Medium----------
    secondMediums = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium')
     
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
    #----------End 2nd & Medium----------

    #----------3rd & Medium----------
    thirdMediums = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium')
     
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
    #----------End 3rd & Medium----------

    #----------2nd & Short----------
    secondShorts = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short')
     
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
    #----------End 2nd & Short----------

    #----------3rd & Short----------
    thirdShorts = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short')
     
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
    #----------End 3rd & Short----------    

    #----------Redzone----------
    redzones = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone')
     
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
    #----------End Redzone---------- 

    #----------Goaline----------
    goalines = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline')
     
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
    #----------End Goaline----------  

    #----------Coming Out----------
    comingOuts = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out')
     
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
    #----------End Coming Out---------- 

    #----------Custom 1----------
    customOnes = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1')
     
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
    #----------End Custom 1----------   

    #----------Custom 2----------
    customTwos = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2')
     
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
    #----------End Custom 2---------- 

    #----------Custom 3----------
    customThrees = event.plays.where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3')
     
    runCustomThrees = customThrees.where('play_type = ?', 'Run')
    runCustomThreesLeft = runCustomThrees.where('hash_mark = ?', 'Left')
    runCustomThreesRight = runCustomThrees.where('hash_mark = ?', 'Right')
     
    passCustomThrees = customThrees.where('play_type = ?', 'Pass')
    passCustomThreesLeft = passCustomThrees.where('hash_mark = ?', 'Left')
    passCustomThreesRight = passCustomThrees.where('hash_mark = ?', 'Right')

    #Run Left Hash
    unless runCustomThreesLeft[0].nil?  
      rcuthl1 = runCustomThreesLeft[0].fullname 
    end
    unless runCustomThreesLeft[1].nil?  
      rcuthl2 = runCustomThreesLeft[1].fullname 
    end
    unless runCustomThreesLeft[2].nil?  
      rcuthl3 = runCustomThreesLeft[2].fullname 
    end
    unless runCustomThreesLeft[3].nil?  
      rcuthl4 = runCustomThreesLeft[3].fullname 
    end
    unless runCustomThreesLeft[4].nil?  
      rcuthl5 = runCustomThreesLeft[4].fullname
    end
    unless runCustomThreesLeft[5].nil?  
      rcuthl6 = runCustomThreesLeft[5].fullname 
    end
    unless runCustomThreesLeft[6].nil?  
      rcuthl7 = runCustomThreesLeft[6].fullname
    end    

    #Run Right Hash
    unless runCustomThreesRight[0].nil?  
      rcuthr1 = runCustomThreesRight[0].fullname 
    end
    unless runCustomThreesRight[1].nil?  
      rcuthr2 = runCustomThreesRight[1].fullname 
    end
    unless runCustomThreesRight[2].nil?  
      rcuthr3 = runCustomThreesRight[2].fullname 
    end
    unless runCustomThreesRight[3].nil?  
      rcuthr4 = runCustomThreesRight[3].fullname 
    end
    unless runCustomThreesRight[4].nil?  
      rcuthr5 = runCustomThreesRight[4].fullname
    end
    unless runCustomThreesRight[5].nil?  
      rcuthr6 = runCustomThreesRight[5].fullname 
    end
    unless runCustomThreesRight[6].nil?  
      rcuthr7 = runCustomThreesRight[6].fullname
    end    

    #Pass Left Hash
    unless passCustomThreesLeft[0].nil?  
      pcuthl1 = passCustomThreesLeft[0].fullname 
    end
    unless passCustomThreesLeft[1].nil?  
      pcuthl2 = passCustomThreesLeft[1].fullname 
    end
    unless passCustomThreesLeft[2].nil?  
      pcuthl3 = passCustomThreesLeft[2].fullname 
    end
    unless passCustomThreesLeft[3].nil?  
      pcuthl4 = passCustomThreesLeft[3].fullname 
    end
    unless passCustomThreesLeft[4].nil?  
      pcuthl5 = passCustomThreesLeft[4].fullname 
    end
    unless passCustomThreesLeft[5].nil?  
      pcuthl6 = passCustomThreesLeft[5].fullname 
    end 
    unless passCustomThreesLeft[6].nil?  
      pcuthl7 = passCustomThreesLeft[6].fullname 
    end       

    #Pass Right Hash
    unless passCustomThreesRight[0].nil?  
      pcuthr1 = passCustomThreesRight[0].fullname 
    end
    unless passCustomThreesRight[1].nil?  
      pcuthr2 = passCustomThreesRight[1].fullname 
    end
    unless passCustomThreesRight[2].nil?  
      pcuthr3 = passCustomThreesRight[2].fullname 
    end
    unless passCustomThreesRight[3].nil?  
      pcuthr4 = passCustomThreesRight[3].fullname 
    end
    unless passCustomThreesRight[4].nil?  
      pcuthr5 = passCustomThreesRight[4].fullname 
    end
    unless passCustomThreesRight[5].nil?  
      pcuthr6 = passCustomThreesRight[5].fullname 
    end
    unless passCustomThreesRight[6].nil?  
      pcuthr7 = passCustomThreesRight[6].fullname 
    end        
    #----------End Custom 3----------                 

    self.update :gdata => "[
    ['#{title}', '', '', ''],
    ['Openers', '', '1st/2nd & 10 - Run', ''],
    ['#{openl1}', '#{openr1}', '#{rftl1}', '#{rftr1}'],
    ['#{openl2}', '#{openr2}', '#{rftl2}', '#{rftr2}'],
    ['#{openl3}', '#{openr3}', '#{rftl3}', '#{rftr3}'],
    ['#{openl4}', '#{openr4}', '#{rftl4}', '#{rftr4}'],
    ['#{openl5}', '#{openr5}', '#{rftl5}', '#{rftr5}'],
    ['#{openl6}', '#{openr6}', '#{rftl6}', '#{rftr6}'],
    ['#{openl7}', '#{openr7}', '#{rftl7}', '#{rftr7}'],    
    ['#{openl8}', '#{openr8}', '1st/2nd & 10 - Pass', ''],
    ['#{openl9}', '#{openr9}', '#{pftl1}', '#{pftr1}'],
    ['#{openl10}', '#{openr10}', '#{pftl2}', '#{pftr2}'],
    ['#{openl11}', '#{openr11}', '#{pftl3}', '#{pftr3}'],
    ['#{openl12}', '#{openr12}', '#{pftl4}', '#{pftr4}'],
    ['#{openl13}', '#{openr13}', '#{pftl5}', '#{pftr5}'],
    ['#{openl14}', '#{openr14}', '#{pftl6}', '#{pftr6}'],
    ['#{openl15}', '#{openr15}', '#{pftl7}', '#{pftr7}'],
    ['2nd & Long - Run', '', '3rd & Long - Run', ''],
    ['#{rsll1}', '#{rslr1}', '#{rtll1}', '#{rtlr1}'],
    ['#{rsll2}', '#{rslr2}', '#{rtll2}', '#{rtlr2}'],
    ['#{rsll3}', '#{rslr3}', '#{rtll3}', '#{rtlr3}'],
    ['#{rsll4}', '#{rslr4}', '3rd & Long - Pass', ''],
    ['#{rsll5}', '#{rslr5}', '#{ptll1}', '#{ptlr1}'],
    ['2nd & Long - Pass', '', '#{ptll2}', '#{ptlr2}'],
    ['#{psll1}', '#{pslr1}', '#{ptll3}', '#{ptlr3}'],
    ['#{psll2}', '#{pslr2}', '#{ptll4}', '#{ptlr4}'],
    ['#{psll3}', '#{pslr3}', '#{ptll5}', '#{ptlr5}'],
    ['#{psll4}', '#{pslr4}', '#{ptll6}', '#{ptlr6}'],
    ['#{psll5}', '#{pslr5}', '#{ptll7}', '#{ptlr7}'],
    ['#{psll6}', '#{pslr6}', '#{ptll8}', '#{ptlr8}'],
    ['2nd & Medium - Run', '', '3rd & Medium - Run', ''],
    ['#{rsml1}', '#{rsmr1}', '#{rtml1}', '#{rtmr1}'],
    ['#{rsml2}', '#{rsmr2}', '#{rtml2}', '#{rtmr2}'],
    ['#{rsml3}', '#{rsmr3}', '#{rtml3}', '#{rtmr3}'],
    ['#{rsml4}', '#{rsmr4}', '#{rtml4}', '#{rtmr4}'],
    ['#{rsml5}', '#{rsmr5}', '#{rtml5}', '#{rtmr5}'],
    ['2nd & Medium - Pass', '', '3rd & Medium - Pass', ''],
    ['#{psml1}', '#{psmr1}', '#{ptml1}', '#{ptmr1}'],
    ['#{psml2}', '#{psmr2}', '#{ptml2}', '#{ptmr2}'],
    ['#{psml3}', '#{psmr3}', '#{ptml3}', '#{ptmr3}'],
    ['#{psml4}', '#{psmr4}', '#{ptml4}', '#{ptmr4}'],
    ['#{psml5}', '#{psmr5}', '#{ptml5}', '#{ptmr5}'],
    ['2nd & Short - Run', '', '3rd & Short - Run', ''],
    ['#{rssl1}', '#{rssr1}', '#{rtsl1}', '#{rtsr1}'],
    ['#{rssl2}', '#{rssr2}', '#{rtsl2}', '#{rtsr2}'],
    ['#{rssl3}', '#{rssr3}', '#{rtsl3}', '#{rtsr3}'],
    ['#{rssl4}', '#{rssr4}', '#{rtsl4}', '#{rtsr4}'],
    ['#{rssl5}', '#{rssr5}', '#{rtsl5}', '#{rtsr5}'],
    ['2nd & Short - Pass', '', '#{rtsl6}', '#{rtsr6}'],
    ['#{pssl1}', '#{pssr1}', '#{rtsl7}', '#{rtsr7}'],
    ['#{pssl2}', '#{pssr2}', '3rd & Short - Pass', ''],
    ['#{pssl3}', '#{pssr3}', '#{ptsl1}', '#{ptsr1}'],
    ['#{pssl4}', '#{pssr4}', '#{ptsl2}', '#{ptsr2}'],
    ['#{pssl5}', '#{pssr5}', '#{ptsl3}', '#{ptsr3}']
    ]"

    self.update :gdata2 => "[ 
    ['Page Two', '', '', ''],
    ['Redzone - Run', '', 'Goaline - Run', ''],
    ['#{rrzl1}', '#{rrzr1}', '#{rgll1}', '#{rglr1}'],
    ['#{rrzl2}', '#{rrzr2}', '#{rgll2}', '#{rglr2}'],
    ['#{rrzl3}', '#{rrzr3}', '#{rgll3}', '#{rglr3}'],
    ['#{rrzl4}', '#{rrzr4}', '#{rgll4}', '#{rglr4}'],
    ['#{rrzl5}', '#{rrzr5}', '#{rgll5}', '#{rglr5}'],
    ['#{rrzl6}', '#{rrzr6}', '#{rgll6}', '#{rglr6}'],
    ['#{rrzl7}', '#{rrzr7}', '#{rgll7}', '#{rglr7}'],
    ['Redzone - Pass', '', 'Goaline - Pass', ''],
    ['#{przl1}', '#{przr1}', '#{pgll1}', '#{pglr1}'],
    ['#{przl2}', '#{przr2}', '#{pgll2}', '#{pglr2}'],
    ['#{przl3}', '#{przr3}', '#{pgll3}', '#{pglr3}'],
    ['#{przl4}', '#{przr4}', '#{pgll4}', '#{pglr4}'],
    ['#{przl5}', '#{przr5}', '#{pgll5}', '#{pglr5}'],
    ['#{przl6}', '#{przr6}', '#{pgll6}', '#{pglr6}'],
    ['#{przl7}', '#{przr7}', '#{pgll7}', '#{pglr7}'],
    ['Coming Out - Run', '', 'Custom 1 - Run', ''],
    ['#{rcol1}', '#{rcor1}', '#{rcuol1}', '#{rcuor1}'],
    ['#{rcol2}', '#{rcor2}', '#{rcuol2}', '#{rcuor2}'],
    ['#{rcol3}', '#{rcor3}', '#{rcuol3}', '#{rcuor3}'],
    ['#{rcol4}', '#{rcor4}', '#{rcuol4}', '#{rcuor4}'],
    ['#{rcol5}', '#{rcor5}', '#{rcuol5}', '#{rcuor5}'],
    ['#{rcol6}', '#{rcor6}', '#{rcuol6}', '#{rcuor6}'],
    ['#{rcol7}', '#{rcor7}', '#{rcuol7}', '#{rcuor7}'],
    ['Coming Out - Pass', '', 'Custom 1 - Pass', ''],
    ['#{pcol1}', '#{pcor1}', '#{pcuol1}', '#{pcuor1}'],
    ['#{pcol2}', '#{pcor2}', '#{pcuol2}', '#{pcuor2}'],
    ['#{pcol3}', '#{pcor3}', '#{pcuol3}', '#{pcuor3}'],
    ['#{pcol4}', '#{pcor4}', '#{pcuol4}', '#{pcuor4}'],
    ['#{pcol5}', '#{pcor5}', '#{pcuol5}', '#{pcuor5}'],
    ['#{pcol6}', '#{pcor6}', '#{pcuol6}', '#{pcuor6}'],
    ['#{pcol7}', '#{pcor7}', '#{pcuol7}', '#{pcuor7}'],
    ['Custom 2 - Run', '', 'Custom 3 - Run', ''],
    ['#{rcutl1}', '#{rcutr1}', '#{rcuthl1}', '#{rcuthr1}'],
    ['#{rcutl2}', '#{rcutr2}', '#{rcuthl2}', '#{rcuthr2}'],
    ['#{rcutl3}', '#{rcutr3}', '#{rcuthl3}', '#{rcuthr3}'],
    ['#{rcutl4}', '#{rcutr4}', '#{rcuthl4}', '#{rcuthr4}'],
    ['#{rcutl5}', '#{rcutr5}', '#{rcuthl5}', '#{rcuthr5}'],
    ['#{rcutl6}', '#{rcutr6}', '#{rcuthl6}', '#{rcuthr6}'],
    ['#{rcutl7}', '#{rcutr7}', '#{rcuthl7}', '#{rcuthr7}'],
    ['Custom 2 - Pass', '', 'Custom 3 - Pass', ''],
    ['#{pcutl1}', '#{pcutr1}', '#{pcuthl1}', '#{pcuthr1}'],
    ['#{pcutl2}', '#{pcutr2}', '#{pcuthl2}', '#{pcuthr2}'],
    ['#{pcutl3}', '#{pcutr3}', '#{pcuthl3}', '#{pcuthr3}'],
    ['#{pcutl4}', '#{pcutr4}', '#{pcuthl4}', '#{pcuthr4}'],
    ['#{pcutl5}', '#{pcutr5}', '#{pcuthl5}', '#{pcuthr5}'],
    ['#{pcutl6}', '#{pcutr6}', '#{pcuthl6}', '#{pcuthr6}'],
    ['#{pcutl7}', '#{pcutr7}', '#{pcuthl7}', '#{pcuthr7}']
    ]"   
  end

end
