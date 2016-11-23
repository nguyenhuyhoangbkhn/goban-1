class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotels = Hotel.all.limit(5)
    @comment = @hotel.comments.new
    @comments = Comment.where(hotel_id: @hotel.id).order("created_at DESC")
    @reviews = @hotel.reviews.where(user_id: current_user.id)
    @review = if current_user
      if @reviews.present?
        @reviews.first
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
