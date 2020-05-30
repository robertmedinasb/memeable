class VotesController < ApplicationController
  before_action :set_meme

  def vote
    if @vote.nil?
      @vote = new_vote
      @vote.save
    else
      Vote.destroy(@vote.id)
    end
    redirect_to meme_path(@meme)
  end

  private

  def new_vote
    @vote = Vote.new(user_id: current_user.id, meme_id: params[:id])
  end

  def set_meme
    @meme = Meme.find(params[:id])
    @vote = Vote.find_by(meme_id: @meme.id, user_id: current_user.id)
  end
end
