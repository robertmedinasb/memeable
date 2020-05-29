# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index
    @memes = Meme.all
  end
end
