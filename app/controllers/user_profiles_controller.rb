class UserProfilesController < ApplicationController
  def show
    @userprofile = User.find(current_user.id)
  end
end
