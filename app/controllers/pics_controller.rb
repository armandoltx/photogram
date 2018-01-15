class PicsController < ApplicationController
  def index
    @pics ||= Pic.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
