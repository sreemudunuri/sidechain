class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy, :comment]
  before_action :all_songs, only: [:index]

  def index

  end

  def show
    @session_id = session[:user_id]
    @user = @song.user
    @comment = Comment.new
    @song.make_comment_timestamps
    @song.make_timestamps_integers
    @sorted_comments = @song.sort_comment_timestamps
    @song.untimestamp_comments
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

  def destroy
    @user = User.find(session[:user_id])
    @song.destroy
    redirect_to @user
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def all_songs
    @songs = Song.all
  end

  def song_params
    params.require(:song).permit(:name, :user_id, :song_file, :image_file)
  end

end
