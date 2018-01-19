class AsksController < ApplicationController
  def index
    @asks = Ask.all.order(:time).paginate(:page => params[:page], :per_page => 10)
  end
end
