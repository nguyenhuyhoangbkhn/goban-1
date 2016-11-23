class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def edit
  end

  def create
    # @review = Review.new(review_params)
    # @review.user_id = current_user.id
    # @review.movie_id = @movie.id

    # if @review.save
    #   redirect_to @movie
    # else
    #   render 'new'
    # end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(rating: params[:rating])
      respond_to do |format|
        format.js
      end
    end
  end

  # def destroy
  #   @review.destroy
  #   redirect_to root_path
  # end

  # private
  #   def set_review
  #     @review = Review.find(params[:id])
  #   end

  #   def set_movie
  #     @movie = Movie.find(params[:movie_id])
  #   end

  #   def review_params
  #     params.require(:review).permit(:rating, :comment)
  #   end
end
