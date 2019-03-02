class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit, :destroy]
  
  def index
    @songs = Song.all
  end

  def show
   
  end


  def new
    @song = Song.new
    render partial: 'songs/form'
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
    render partial: 'songs/form'
  end


  def update

    if @song.update(songs_params)
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
      params.require(:song).permit(:title, :artist)
    end

    def set_song
      @song = Song.find(params[:id])
    end

end
