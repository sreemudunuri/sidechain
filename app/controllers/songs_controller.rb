class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy, :comment]
  before_action :all_songs, only: [:index]

  def index

  end

  def show
    @user = User.find(session[:user_id])
    @comment = Comment.new
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.user = get_logged_in_user
     if @song.save
      redirect_to @song
      else
        render :new
      end
  end

  def comment
    @comment = Comment.create(comment_params)
    @comment.update(user_id: session[:user_id], song_id: @song.id)
    byebug
    redirect_to @song
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def all_songs
    @songs = Song.all
  end

  def song_params
    params.require(:song).permit(:name, :user_id, :song_file)
  end

  def comment_params
    params.require(:comment).permit(:user_id, :song_id, :content)
  end

end
