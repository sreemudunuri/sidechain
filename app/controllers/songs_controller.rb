class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :all_songs, only: [:index]

  def index
    
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
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
end
