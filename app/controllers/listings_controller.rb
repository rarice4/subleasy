class ListingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end
  def create
    
    @listing = Listing.new listing_params.merge(user_id: current_user.id)
    if @listing.save == true
      flash[:notice] = "You have succesfully created a Listing"
      redirect_to all_listings_path
    else
      render :new
    end
  end 

  def edit
    
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]
    if @listing.update_attributes listing_params
      flash[:notice] = "Listing Updated"
      redirect_to all_listings_path
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find params[:id]
    @listing.delete
    flash[:notice] = "Succesfully Deleted"
  end

  def show
    @listing = Listing.find params[:id]
  end
  private
    def listing_params
      params.require(:listing).permit(:user_id, :address, :city, :state, :lease_start, :lease_length, :lease_type, :rooms, :description, :email, :phone, :photo, :rent, :zipcode, :latitude, :longitude)
    end

end
