class UserProfilesController < ApplicationController
  def show
    @userprofile = User.find(current_user.id)
  end
  def popularity
    @memepopularity =  Meme.order("votes_count desc")  

  end
end
