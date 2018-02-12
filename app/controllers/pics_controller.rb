class PicsController < ApplicationController
  before_action :set_pic_item, only: [:edit, :update, :vote]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json, :html

  def index
    @pics ||= Pic.all.by_creation
    # @pic ||= Pic.find(params[:id])
  end

  def user_pics
    @pics ||= current_user.pics.by_creation
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

  def vote
    if !current_user.liked? @pic
      @pic.liked_by current_user
    elsif current_user.liked? @pic
      @pic.unliked_by current_user
    end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    respond_to :html, :js
  end

  private

  def set_pic_item
    @pic ||= Pic.find(params[:id])
  end

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end
end