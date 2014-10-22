class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  def show
    @search = Search.find(params[:id])

  end

  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end
private
  def search_params
    params.require(:search).permit(:search, :keywords, :category_id, :minimum_price, :maximum_price)
  end

end
