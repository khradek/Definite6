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

  #----------Goaline----------
  scope :goalines, -> { where('situation1 = ? or situation2 = ? or situation3 = ? or situation4 = ? or situation5 = ? or situation6 = ? or situation7 = ? or situation8 = ? or situation9 = ? or situation10 = ?', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline', 'Goaline')}
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
  
  private
    def piece1_or_piece2
      if piece1.blank? && piece2.blank?
        errors[:base] << "You must enter at least a formation or play name."
      end
    end
end
