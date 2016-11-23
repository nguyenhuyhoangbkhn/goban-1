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
    @hotel.comments.build
    @comments = Comment.where(hotel_id: @hotel.id).order("created_at DESC")
  end

  # GET /hotels/1/edit
  def edit
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit attachments_attributes: [:id, :image, :_destroy],
        comments_attributes: [:id, :picture, :content, :_destroy]
    end
end
