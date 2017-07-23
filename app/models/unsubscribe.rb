class Unsubscribe < ActiveRecord::Base
  validates_format_of :email,:with => Devise::email_regexp
  
end
