class PicsController < ApplicationController
  def index
    @pics ||= Pic.all
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
      render new
    end
  end

  def edit
  end

  def show
  end

  private

  def pic_params
    params.require(:pic).permit(:title, :description, :image)
  end
end