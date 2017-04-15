class ImagesController < ApplicationController
  def index
    render json: Image.all, root: "data"
  end
end
