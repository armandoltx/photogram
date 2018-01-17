class PicsController < ApplicationController
  def index
    @pics ||= Pic.all.order("created_at DESC")
  end

  def show
  end

  def new
    @pic ||= Pic.new
  end

  def create
    @pic ||= Pic.new(pic_params)

    if @pic.save
      flash[:message] = "Image created"
      redirect_to root_path
    else
      flash[:message] = "Image NOT created"
      render :new
    end
  end

  def edit
    @pic ||= Pic.find(params[:id])
  end

  def update
    @pic = Pic.find(params[:id])

    if @pic.update(pic_params)
      flash[:message] = "Image edited"
      redirect_to root_path
    else
      flash[:message] = 'Image not edited'
      render :edit
    end
    
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end
end