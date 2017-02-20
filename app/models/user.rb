class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :masqueradable

  has_many :events  
  has_many :scripts 
  has_many :gamecalls
  has_many :plays  
  has_many :saved_formations
  has_many :saved_plays
  has_many :charges

  validates :first_name, :last_name, :team, :presence => true

  after_create :set_default_s_names

  def set_default_s_names
    self.update_attribute(:s_name1, "Openers")
    self.update_attribute(:s_name2, "1st/2nd & 10")
    self.update_attribute(:s_name3, "2nd & Long")
    self.update_attribute(:s_name4, "2nd & Medium")
    self.update_attribute(:s_name5, "2nd & Short")
    self.update_attribute(:s_name6, "3rd & Long")
    self.update_attribute(:s_name7, "3rd & Medium")
    self.update_attribute(:s_name8, "3rd & Short")
    self.update_attribute(:s_name9, "Redzone")
    self.update_attribute(:s_name10, "Goal Line")
    self.update_attribute(:s_name11, "Coming Out")
    self.update_attribute(:s_name12, "Custom 1")
    self.update_attribute(:s_name13, "Custom 2")
    self.update_attribute(:s_name14, "Custom 3")
  end

  def subscribed?
    stripe_subscription_id?
  end
  
end
