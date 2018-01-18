class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:time) # you can add .limit(30)
  end
end
