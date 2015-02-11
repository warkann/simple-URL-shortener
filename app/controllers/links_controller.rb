class LinksController < ApplicationController
  
  def new
    @link = Link.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  private 
    def link_params
      params.require(:link).permit(:long)
    end

end
