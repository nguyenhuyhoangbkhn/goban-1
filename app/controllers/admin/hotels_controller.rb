class Admin::HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  layout "admin"
  before_action :authenticate_admin_user!

  def index
    @hotels = Hotel.all
  end


  def show
  end

  def new
    @hotel = Hotel.new
    @hotel.destination_addresses.build
    @hotel.attachments.build
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)
    binding.pry
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to [:admin, @hotel], notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to [:admin, @hotel], notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hotel.destroy
    redirect_to admin_hotels_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit :name, :countRoom, :introduction, :hotel_kind, :phone_number, :website, :score_average,
        destination_addresses_attributes: [:id, :name, :village_id, :address, :destroy],
        attachments_attributes: [:id, :image, :_destroy]
    end
end
