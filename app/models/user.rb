class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events  
  has_many :scripts 
  has_many :gamecalls
  has_many :plays  
  has_many :saved_formations
  has_many :saved_plays
  has_many :charges

  def subscribed?
    stripe_subscription_id?
  end
  
end
