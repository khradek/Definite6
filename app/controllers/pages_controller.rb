class PagesController < ApplicationController
  
  def user_guide
  end

  def privacy
  end

  def terms
  end

  def example_script
  end

  def example_gamecall
  end
  
  def sitemap
  end

  def masquerade
    if current_user.admin?
      @users = User.all
    end
  end

end
