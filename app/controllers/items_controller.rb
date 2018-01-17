class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:time)
  end
end
