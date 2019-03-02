class ReviewsController < ApplicationController
  before_action :set_song

  before_action :set_review, only: [:show, :update, :edit, :destroy]

  def index
    @reviews = @song.reviews
  end

  def show

  end

  def new
    @review = @song.reviews.new
    render partial: 'reviews/form'
  end

  def create
    @review = @song.reviews.new(review_params)

    if @review.save
      redirect_to [@song, @review]
    else
      render :new
    end
  end

  def edit
    render partial: 'reviews/form'

  end

  def update
    if @review.update(review_params)
      redirect_to [@song, @review]
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to songs_reviews_path


  end

  private

    def review_params
      params.require(:review).permit(:author, :body)
    end

    def set_song
      @song = Song.find(params[:song_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end
end
