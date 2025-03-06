class NovelsController < ApplicationController
  def index
    @novels = Novel.all
  end

  def show
    @novel = Novel.find(params[:id])
    @chapters = @novel.chapters
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = Novel.new(novel_params)
    if @novel.save
      redirect_to @novel, notice: "Novel created successfully!"
    else
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to @novel, notice: "Novel updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to novels_path, notice: "Novel deleted successfully!"
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :description)
  end
end
