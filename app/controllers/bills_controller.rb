class BillsController < ApplicationController
  def index
    render json: Bill.all, root: "data"
  end
end
