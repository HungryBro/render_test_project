class ChaptersController < ApplicationController
  def index
    @novel = Novel.find(params[:novel_id])
    @chapters = @novel.chapters
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.new
  end

  def create
    @novel = Novel.find(params[:novel_id])
    @chapter = @novel.chapters.new(chapter_params)
    if @chapter.save
      redirect_to novel_chapter_path(@novel, @chapter), notice: "Chapter created successfully!"
    else
      render :new
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :content)
  end
end
