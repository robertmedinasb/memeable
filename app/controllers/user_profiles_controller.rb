# frozen_string_literal: true

class UserProfilesController < ApplicationController
  def show
    validation = User.find(params['format'])
    if validation == current_user
      @user = current_user
      render 'show'
    else
      @owner = false
   end
    end
end
