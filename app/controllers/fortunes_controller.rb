class FortunesController < ApplicationController
  load_and_authorize_resource

  def index
    @fortunes = Fortune.search(params[:search]).order(:author).page(params[:page]).per(8)
    respond_with(@fortunes)
  end
	
  def show
     @fortune = Fortune.find(params[:id])
     @comment = Comment.new
     respond_with(@fortune)
  end

  def new
    @fortune = Fortune.new
  end

  def create
    #@fortune = Fortune.new(params[:fortune])
    @fortune = current_user.fortunes.build(params[:fortune])
    @fortune.save
    respond_with(@fortune)
  end

  def edit
    @fortune = Fortune.find(params[:id])
  end

  def update
    @fortune = Fortune.find(params[:id])
    @fortune.update_attributes(params[:fortune])
    respond_with(@fortune)
  end

  def destroy
    @fortune = Fortune.find(params[:id])
    @fortune.destroy
    respond_with(@fortune)
  end
  
  def randomFortune
    @fortune = Fortune.random
    @comment = Comment.new
    render :action => 'show'
  end
end
