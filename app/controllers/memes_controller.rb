class MemesController < ApplicationController
  before_action :set_meme, only: %i[show edit update destroy]

  # GET /memes
  # GET /memes.json
  def index
    @listmemes = Meme.all.group_by { |meme| meme[:created_at].to_date }
  end

  def bycategory
    @listmemes = Meme.all.group_by { |meme| Category.find(meme[:category_id]).name }
    render 'index'
  end

  def popularity
    @listmemes = Meme.all.order(votes_count: :desc)
    render 'index'
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
    @category = Category.find(@meme.category_id).name
    @comment = Comment.new
    @comments = @meme.comments.reverse
  end

  # GET /memes/new
  def new
    @meme = Meme.new
  end

  # GET /memes/1/edit
  def edit
  end

  # POST /memes
  # POST /memes.json
  def create
    @meme = Meme.new(meme_params)
    @meme.owner_id = current_user.id

    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Meme was successfully created.' }
        format.json { render :show, status: :created, location: @meme }
      else
        format.html { render :new }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memes/1
  # PATCH/PUT /memes/1.json
  def update
    respond_to do |format|
      if @meme.update(meme_params)
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { render :show, status: :ok, location: @meme }
      else
        format.html { render :edit }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memes/1
  # DELETE /memes/1.json
  def destroy
    @meme.destroy
    respond_to do |format|
      format.html { redirect_to memes_url, notice: 'Meme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    set_vote
    if @vote.nil?
      @vote = new_vote
      @vote.save
    else
      Vote.destroy(@vote.id)
    end
    redirect_to @meme
  end

  private

  def new_vote
    @vote = Vote.new(user_id: current_user.id, meme_id: params[:id])
  end

  def set_vote
    set_meme
    @vote = Vote.find_by(meme_id: @meme.id, user_id: current_user.id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_meme
    @meme = Meme.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meme_params
    params.require(:meme).permit(:title, :meme_type, :url_source, :votes_count, :comments_count, :category_id)
  end
end
