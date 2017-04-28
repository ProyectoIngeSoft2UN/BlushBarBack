class ReferencesController < ApplicationController
  def index
    render json: Reference.all, root: "data"
  end
  def list
    Reference.index
  end

  def show
    @reference = Reference.find(params[:id])
    render json: @reference
  end
end
