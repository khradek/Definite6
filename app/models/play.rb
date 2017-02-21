class Play < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  validate :piece1_or_piece2 

  title_regex = /\A[a-zA-Z\d\s\-_@#&\/\$]*\z/
  validates :piece1, format: { with: title_regex }
  validates :piece2, format: { with: title_regex }

  after_create :set_priority

	default_scope { order(priority: :asc, created_at: :asc) }	

  #----------Openers----------
  scope :openers, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener', 'Opener')}
  scope :openers_left, -> { openers.where('hash_mark = ?', 'Left').limit(15)}
  scope :openers_right, -> { openers.where('hash_mark = ?', 'Right').limit(15)}

  #----------1st/2nd & 10----------
  scope :first_tens, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10', '1st/2nd & 10')}
  scope :run_first_tens, -> { first_tens.where('play_type = ?', 'Run')}
  scope :run_left_first_tens, -> { run_first_tens.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_first_tens, -> { run_first_tens.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_first_tens, -> { first_tens.where('play_type = ?', 'Pass')}
  scope :pass_left_first_tens, -> { pass_first_tens.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_first_tens, -> { pass_first_tens.where('hash_mark = ?', 'Right').limit(7)}

  #----------2nd & Long----------
  scope :second_longs, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long', '2nd & Long')}
  scope :run_second_longs, -> { second_longs.where('play_type = ?', 'Run')}
  scope :run_left_second_longs, -> { run_second_longs.where('hash_mark = ?', 'Left').limit(5)}
  scope :run_right_second_longs, -> { run_second_longs.where('hash_mark = ?', 'Right').limit(5)}
  scope :pass_second_longs, -> { second_longs.where('play_type = ?', 'Pass')}
  scope :pass_left_second_longs, -> { pass_second_longs.where('hash_mark = ?', 'Left').limit(6)}
  scope :pass_right_second_longs, -> { pass_second_longs.where('hash_mark = ?', 'Right').limit(6)}

  #----------3rd & Long----------
  scope :third_longs, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long', '3rd & Long')}
  scope :run_third_longs, -> { third_longs.where('play_type = ?', 'Run')}
  scope :run_left_third_longs, -> { run_third_longs.where('hash_mark = ?', 'Left').limit(3)}
  scope :run_right_third_longs, -> { run_third_longs.where('hash_mark = ?', 'Right').limit(3)}
  scope :pass_third_longs, -> { third_longs.where('play_type = ?', 'Pass')}
  scope :pass_left_third_longs, -> { pass_third_longs.where('hash_mark = ?', 'Left').limit(8)}
  scope :pass_right_third_longs, -> { pass_third_longs.where('hash_mark = ?', 'Right').limit(8)}

  #----------2nd & Medium----------
  scope :second_mediums, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium', '2nd & Medium')}
  scope :run_second_mediums, -> { second_mediums.where('play_type = ?', 'Run')}
  scope :run_left_second_mediums, -> { run_second_mediums.where('hash_mark = ?', 'Left').limit(5)}
  scope :run_right_second_mediums, -> { run_second_mediums.where('hash_mark = ?', 'Right').limit(5)}
  scope :pass_second_mediums, -> { second_mediums.where('play_type = ?', 'Pass')}
  scope :pass_left_second_mediums, -> { pass_second_mediums.where('hash_mark = ?', 'Left').limit(5)}
  scope :pass_right_second_mediums, -> { pass_second_mediums.where('hash_mark = ?', 'Right').limit(5)}
 
  #----------3rd & Medium----------
  scope :third_mediums, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium', '3rd & Medium')}
  scope :run_third_mediums, -> { third_mediums.where('play_type = ?', 'Run')}
  scope :run_left_third_mediums, -> { run_third_mediums.where('hash_mark = ?', 'Left').limit(5)}
  scope :run_right_third_mediums, -> { run_third_mediums.where('hash_mark = ?', 'Right').limit(5)}
  scope :pass_third_mediums, -> { third_mediums.where('play_type = ?', 'Pass')}
  scope :pass_left_third_mediums, -> { pass_third_mediums.where('hash_mark = ?', 'Left').limit(5)}
  scope :pass_right_third_mediums, -> { pass_third_mediums.where('hash_mark = ?', 'Right').limit(5)}

  #----------2nd & Short----------
  scope :second_shorts, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short', '2nd & Short')}
  scope :run_second_shorts, -> { second_shorts.where('play_type = ?', 'Run')}
  scope :run_left_second_shorts, -> { run_second_shorts.where('hash_mark = ?', 'Left').limit(5)}
  scope :run_right_second_shorts, -> { run_second_shorts.where('hash_mark = ?', 'Right').limit(5)}
  scope :pass_second_shorts, -> { second_shorts.where('play_type = ?', 'Pass')}
  scope :pass_left_second_shorts, -> { pass_second_shorts.where('hash_mark = ?', 'Left').limit(5)}
  scope :pass_right_second_shorts, -> { pass_second_shorts.where('hash_mark = ?', 'Right').limit(5)}

  #----------3rd & Short----------
  scope :third_shorts, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short', '3rd & Short')}
  scope :run_third_shorts, -> { third_shorts.where('play_type = ?', 'Run')}
  scope :run_left_third_shorts, -> { run_third_shorts.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_third_shorts, -> { run_third_shorts.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_third_shorts, -> { third_shorts.where('play_type = ?', 'Pass')}
  scope :pass_left_third_shorts, -> { pass_third_shorts.where('hash_mark = ?', 'Left').limit(3)}
  scope :pass_right_third_shorts, -> { pass_third_shorts.where('hash_mark = ?', 'Right').limit(3)}

  #----------Redzone----------
  scope :redzones, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone', 'Redzone')}
  scope :run_redzones, -> { redzones.where('play_type = ?', 'Run')}
  scope :run_left_redzones, -> { run_redzones.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_redzones, -> { run_redzones.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_redzones, -> { redzones.where('play_type = ?', 'Pass')}
  scope :pass_left_redzones, -> { pass_redzones.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_redzones, -> { pass_redzones.where('hash_mark = ?', 'Right').limit(7)}

  #----------Goal Line----------
  scope :goalines, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line', 'Goal Line')}
  scope :run_goalines, -> { goalines.where('play_type = ?', 'Run')}
  scope :run_left_goalines, -> { run_goalines.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_goalines, -> { run_goalines.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_goalines, -> { goalines.where('play_type = ?', 'Pass')}
  scope :pass_left_goalines, -> { pass_goalines.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_goalines, -> { pass_goalines.where('hash_mark = ?', 'Right').limit(7)}

  #----------Coming Out----------
  scope :coming_outs, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out', 'Coming Out')}
  scope :run_coming_outs, -> { coming_outs.where('play_type = ?', 'Run')}
  scope :run_left_coming_outs, -> { run_coming_outs.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_coming_outs, -> { run_coming_outs.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_coming_outs, -> { coming_outs.where('play_type = ?', 'Pass')}
  scope :pass_left_coming_outs, -> { pass_coming_outs.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_coming_outs, -> { pass_coming_outs.where('hash_mark = ?', 'Right').limit(7)}

  #----------Custom 1----------
  scope :custom_ones, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1', 'Custom 1')}
  scope :run_custom_ones, -> { custom_ones.where('play_type = ?', 'Run')}
  scope :run_left_custom_ones, -> { run_custom_ones.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_custom_ones, -> { run_custom_ones.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_custom_ones, -> { custom_ones.where('play_type = ?', 'Pass')}
  scope :pass_left_custom_ones, -> { pass_custom_ones.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_custom_ones, -> { pass_custom_ones.where('hash_mark = ?', 'Right').limit(7)}

  #----------Custom 2----------
  scope :custom_twos, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2', 'Custom 2')}
  scope :run_custom_twos, -> { custom_twos.where('play_type = ?', 'Run')}
  scope :run_left_custom_twos, -> { run_custom_twos.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_custom_twos, -> { run_custom_twos.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_custom_twos, -> { custom_twos.where('play_type = ?', 'Pass')}
  scope :pass_left_custom_twos, -> { pass_custom_twos.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_custom_twos, -> { pass_custom_twos.where('hash_mark = ?', 'Right').limit(7)}

  #----------Custom 3----------
  scope :custom_threes, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3', 'Custom 3')}
  scope :run_custom_threes, -> { custom_threes.where('play_type = ?', 'Run')}
  scope :run_left_custom_threes, -> { run_custom_threes.where('hash_mark = ?', 'Left').limit(7)}
  scope :run_right_custom_threes, -> { run_custom_threes.where('hash_mark = ?', 'Right').limit(7)}
  scope :pass_custom_threes, -> { custom_threes.where('play_type = ?', 'Pass')}
  scope :pass_left_custom_threes, -> { pass_custom_threes.where('hash_mark = ?', 'Left').limit(7)}
  scope :pass_right_custom_threes, -> { pass_custom_threes.where('hash_mark = ?', 'Right').limit(7)}


	def fullname
  	fullname = "#{piece1} #{piece2}"
  end

  #Sets the priority to 1,000 after create (needed to avoid nil for production/to have most recently created at bottom of list)
	def set_priority
		self.update_attribute(:priority, 1000)
	end
  

  #Displays the situation name entered by the user
  def new_situation1
    case situation1
    when "Opener"
      new_situation1 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation1 = self.user.s_name2
    when "2nd & Long"
      new_situation1 = self.user.s_name3
    when "3rd & Long"
      new_situation1 = self.user.s_name4
    when "2nd & Medium"
      new_situation1 = self.user.s_name5
    when "3rd & Medium"
      new_situation1 = self.user.s_name6
    when "2nd & Short"
      new_situation1 = self.user.s_name7
    when "3rd & Short"
      new_situation1 = self.user.s_name8
    when "Redzone"
      new_situation1 = self.user.s_name9
    when "Goal Line"
      new_situation1 = self.user.s_name10
    when "Coming Out"
      new_situation1 = self.user.s_name11
    when "Custom 1"
      new_situation1 = self.user.s_name12
    when "Custom 2"
      new_situation1 = self.user.s_name13
    when "Custom 3"
      new_situation1 = self.user.s_name14                                                                     
    end
  end

  def new_situation2
    case situation2
    when "Opener"
      new_situation2 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation2 = self.user.s_name2
    when "2nd & Long"
      new_situation2 = self.user.s_name3
    when "3rd & Long"
      new_situation2 = self.user.s_name4
    when "2nd & Medium"
      new_situation2 = self.user.s_name5
    when "3rd & Medium"
      new_situation2 = self.user.s_name6
    when "2nd & Short"
      new_situation2 = self.user.s_name7
    when "3rd & Short"
      new_situation2 = self.user.s_name8
    when "Redzone"
      new_situation2 = self.user.s_name9
    when "Goal Line"
      new_situation2 = self.user.s_name10
    when "Coming Out"
      new_situation2 = self.user.s_name11
    when "Custom 1"
      new_situation2 = self.user.s_name12
    when "Custom 2"
      new_situation2 = self.user.s_name13
    when "Custom 3"
      new_situation2 = self.user.s_name14                                                                     
    end
  end

  def new_situation3
    case situation3
    when "Opener"
      new_situation3 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation3 = self.user.s_name2
    when "2nd & Long"
      new_situation3 = self.user.s_name3
    when "3rd & Long"
      new_situation3 = self.user.s_name4
    when "2nd & Medium"
      new_situation3 = self.user.s_name5
    when "3rd & Medium"
      new_situation3 = self.user.s_name6
    when "2nd & Short"
      new_situation3 = self.user.s_name7
    when "3rd & Short"
      new_situation3 = self.user.s_name8
    when "Redzone"
      new_situation3 = self.user.s_name9
    when "Goal Line"
      new_situation3 = self.user.s_name10
    when "Coming Out"
      new_situation3 = self.user.s_name11
    when "Custom 1"
      new_situation3 = self.user.s_name12
    when "Custom 2"
      new_situation3 = self.user.s_name13
    when "Custom 3"
      new_situation3 = self.user.s_name14                                                                     
    end
  end

  def new_situation4
    case situation4
    when "Opener"
      new_situation4 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation4 = self.user.s_name2
    when "2nd & Long"
      new_situation4 = self.user.s_name3
    when "3rd & Long"
      new_situation4 = self.user.s_name4
    when "2nd & Medium"
      new_situation4 = self.user.s_name5
    when "3rd & Medium"
      new_situation4 = self.user.s_name6
    when "2nd & Short"
      new_situation4 = self.user.s_name7
    when "3rd & Short"
      new_situation4 = self.user.s_name8
    when "Redzone"
      new_situation4 = self.user.s_name9
    when "Goal Line"
      new_situation4 = self.user.s_name10
    when "Coming Out"
      new_situation4 = self.user.s_name11
    when "Custom 1"
      new_situation4 = self.user.s_name12
    when "Custom 2"
      new_situation4 = self.user.s_name13
    when "Custom 3"
      new_situation4 = self.user.s_name14                                                                     
    end
  end

  def new_situation5
    case situation5
    when "Opener"
      new_situation5 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation5 = self.user.s_name2
    when "2nd & Long"
      new_situation5 = self.user.s_name3
    when "3rd & Long"
      new_situation5 = self.user.s_name4
    when "2nd & Medium"
      new_situation5 = self.user.s_name5
    when "3rd & Medium"
      new_situation5 = self.user.s_name6
    when "2nd & Short"
      new_situation5 = self.user.s_name7
    when "3rd & Short"
      new_situation5 = self.user.s_name8
    when "Redzone"
      new_situation5 = self.user.s_name9
    when "Goal Line"
      new_situation5 = self.user.s_name10
    when "Coming Out"
      new_situation5 = self.user.s_name11
    when "Custom 1"
      new_situation5 = self.user.s_name12
    when "Custom 2"
      new_situation5 = self.user.s_name13
    when "Custom 3"
      new_situation5 = self.user.s_name14                                                                     
    end
  end

  def new_situation6
    case situation6
    when "Opener"
      new_situation6 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation6 = self.user.s_name2
    when "2nd & Long"
      new_situation6 = self.user.s_name3
    when "3rd & Long"
      new_situation6 = self.user.s_name4
    when "2nd & Medium"
      new_situation6 = self.user.s_name5
    when "3rd & Medium"
      new_situation6 = self.user.s_name6
    when "2nd & Short"
      new_situation6 = self.user.s_name7
    when "3rd & Short"
      new_situation6 = self.user.s_name8
    when "Redzone"
      new_situation6 = self.user.s_name9
    when "Goal Line"
      new_situation6 = self.user.s_name10
    when "Coming Out"
      new_situation6 = self.user.s_name11
    when "Custom 1"
      new_situation6 = self.user.s_name12
    when "Custom 2"
      new_situation6 = self.user.s_name13
    when "Custom 3"
      new_situation6 = self.user.s_name14                                                                     
    end
  end  

  def new_situation7
    case situation7
    when "Opener"
      new_situation7 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation7 = self.user.s_name2
    when "2nd & Long"
      new_situation7 = self.user.s_name3
    when "3rd & Long"
      new_situation7 = self.user.s_name4
    when "2nd & Medium"
      new_situation7 = self.user.s_name5
    when "3rd & Medium"
      new_situation7 = self.user.s_name6
    when "2nd & Short"
      new_situation7 = self.user.s_name7
    when "3rd & Short"
      new_situation7 = self.user.s_name8
    when "Redzone"
      new_situation7 = self.user.s_name9
    when "Goal Line"
      new_situation7 = self.user.s_name10
    when "Coming Out"
      new_situation7 = self.user.s_name11
    when "Custom 1"
      new_situation7 = self.user.s_name12
    when "Custom 2"
      new_situation7 = self.user.s_name13
    when "Custom 3"
      new_situation7 = self.user.s_name14                                                                     
    end
  end  

  def new_situation8
    case situation8
    when "Opener"
      new_situation8 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation8 = self.user.s_name2
    when "2nd & Long"
      new_situation8 = self.user.s_name3
    when "3rd & Long"
      new_situation8 = self.user.s_name4
    when "2nd & Medium"
      new_situation8 = self.user.s_name5
    when "3rd & Medium"
      new_situation8 = self.user.s_name6
    when "2nd & Short"
      new_situation8 = self.user.s_name7
    when "3rd & Short"
      new_situation8 = self.user.s_name8
    when "Redzone"
      new_situation8 = self.user.s_name9
    when "Goal Line"
      new_situation8 = self.user.s_name10
    when "Coming Out"
      new_situation8 = self.user.s_name11
    when "Custom 1"
      new_situation8 = self.user.s_name12
    when "Custom 2"
      new_situation8 = self.user.s_name13
    when "Custom 3"
      new_situation8 = self.user.s_name14                                                                     
    end
  end  

  def new_situation9
    case situation9
    when "Opener"
      new_situation9 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation9 = self.user.s_name2
    when "2nd & Long"
      new_situation9 = self.user.s_name3
    when "3rd & Long"
      new_situation9 = self.user.s_name4
    when "2nd & Medium"
      new_situation9 = self.user.s_name5
    when "3rd & Medium"
      new_situation9 = self.user.s_name6
    when "2nd & Short"
      new_situation9 = self.user.s_name7
    when "3rd & Short"
      new_situation9 = self.user.s_name8
    when "Redzone"
      new_situation9 = self.user.s_name9
    when "Goal Line"
      new_situation9 = self.user.s_name10
    when "Coming Out"
      new_situation9 = self.user.s_name11
    when "Custom 1"
      new_situation9 = self.user.s_name12
    when "Custom 2"
      new_situation9 = self.user.s_name13
    when "Custom 3"
      new_situation9 = self.user.s_name14                                                                     
    end
  end  

  def new_situation10
    case situation10
    when "Opener"
      new_situation10 = self.user.s_name1
    when "1st/2nd & 10"
      new_situation10 = self.user.s_name2
    when "2nd & Long"
      new_situation10 = self.user.s_name3
    when "3rd & Long"
      new_situation10 = self.user.s_name4
    when "2nd & Medium"
      new_situation10 = self.user.s_name5
    when "3rd & Medium"
      new_situation10 = self.user.s_name6
    when "2nd & Short"
      new_situation10 = self.user.s_name7
    when "3rd & Short"
      new_situation10 = self.user.s_name8
    when "Redzone"
      new_situation10 = self.user.s_name9
    when "Goal Line"
      new_situation10 = self.user.s_name10
    when "Coming Out"
      new_situation10 = self.user.s_name11
    when "Custom 1"
      new_situation10 = self.user.s_name12
    when "Custom 2"
      new_situation10 = self.user.s_name13
    when "Custom 3"
      new_situation10 = self.user.s_name14                                                                     
    end
  end  
  

	#Counts the number of times play is shown in the install's scripts
	def play_count(scripts)
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
  
  private
    def piece1_or_piece2
      if piece1.blank? && piece2.blank?
        errors[:base] << "You must enter at least a formation or play name."
      end
    end
end
