class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:time).paginate(:page => params[:page], :per_page => 10)
  end
end
