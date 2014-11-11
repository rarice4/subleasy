class AllListingsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @listings = Listing.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # @listings_search = Listing.where("rent LIKE ?", "#{params[:q]}")
    # respond_to do |format|
    #   format.js
    # end
  end  

  def search_listings
    # @listings = Listing.order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    @listings = Listing.where("rent WHERE ? OR city LIKE ? OR state LIKE ? OR address LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  private
    def sort_column
      Listing.column_names.include?(params[:sort]) ? params[:sort] : "rent"
    end 
    def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
