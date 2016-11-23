class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update]

  # GET /hotels
  # GET /hotels.json
  def search
    if params[:search].present?
      @hotels = Hotel.search(params[:search])
    else
      @hotels = Hotel.all
    end
  end

  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotels = Hotel.joins(:reviews).group(:hotel_id).order("avg(reviews.rating) desc").limit(5)
    @comment = @hotel.comments.new
    @comments = Comment.where(hotel_id: @hotel.id).order("created_at DESC")

    @review = if current_user
      if @hotel.reviews.where(user_id: current_user.id).present?
        @hotel.reviews.where(user_id: current_user.id).first
      else
        Review.new
      end
    end
  end

  private
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
