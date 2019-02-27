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


  def edit
    @song = Song.find(params[:id])
  end


  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      redirect_to songs_path
    else
      render :edit
    end
  end

  
  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end


  private

    def songs_params
      params.require(:song).permit(:title, :artist, :review)
    end

end
