class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)

    if @song.save
      redirect_to songs_path
    else
      render :new
    end
  end

  private

    def songs_params
      params.require(:song).permit(:title, :artist, :review)
    end
    
end
