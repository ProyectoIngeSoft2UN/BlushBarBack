class StockstoresController < ApplicationController
  def index
    render json: Stockstore.all, root: "data"
  end
end
