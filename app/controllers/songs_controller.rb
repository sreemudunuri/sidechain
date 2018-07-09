class SongsController < ApplicationController
  before_action :set_song, only: [:show, :create, :edit,:update, :destroy]
  before_action :all_songs, only: [:index]

  def index
  end

  def show
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def all_songs
    @songs = Song.all
  end
end
