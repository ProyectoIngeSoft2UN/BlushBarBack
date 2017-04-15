class ServicesController < ApplicationController
  def index
    render json: Service.all, root: "data"
  end
end
