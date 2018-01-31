class PicsController < ApplicationController
  before_action :set_pic_item, only: [:edit, :update ]

  def index
    @pics ||= Pic.all.order("created_at DESC")
  end

  def user_pics
    @pics ||= current_user.pics
  end

  def show
  end

  def new
    @pic ||= Pic.new
  end

  def create
    @pic ||= Pic.new(pic_params)

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @pic.image = req["url"]
    end
      
    if @pic.save
      flash[:message] = "Image created"
      redirect_to root_path
    else
      flash[:message] = "Image NOT created"
      render :new
    end
  end

  def edit
  end

  def update

    if params[:file].present?
      req = Cloudinary::Uploader.upload(params[:file])
      @pic.image = req["url"]
    end

    if @pic.update(pic_params)
      flash[:message] = "Image edited"
      redirect_to root_path
    else
      flash[:message] = 'Image not edited'
      render :edit
    end
    
  end

  private

  def set_pic_item
    @pic ||= Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end
end