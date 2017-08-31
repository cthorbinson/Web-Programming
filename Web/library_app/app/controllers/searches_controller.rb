class SearchesController < ApplicationController
  before_filter :authorize
  before_filter :authorize_admin

  
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

 #  def search
 #   params.require(:searches).permit(:title, :isbn)
 # end
end
