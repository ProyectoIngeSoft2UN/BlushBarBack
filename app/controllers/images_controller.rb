class ImagesController < ApplicationController
  def index
    render json: Image.all, root: "data"
    # @image = Image.all
  end

  def show
  end

  # GET /uploads/new
  def new
    @image = Image.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  def create
    @image = Image.new(post_image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /uploads/1
  def update
    if @image.update(post_image_params)
      redirect_to @image, notice: 'Image attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /uploads/1
  def destroy
    @image.destroy
    redirect_to image_url, notice: 'Image was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_image_params
      params.require(:image).permit(:path, :description)
    end

  def get_images
    @image = Image.get_images(params[:page],params[:per_page])
  end

  def get_path
    @image = Image.get_path(params[:id])
  end

  def get_description
    @image = Image.get_description(params[:id])
  end

  def get_products_by_id
    @image = Image.get_products_by_id(params[:id])
  end

  def get_products_by_path
    @image = Image.get_products_by_path(params[:path])
  end
end
