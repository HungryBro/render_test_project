class ChaptersController < ApplicationController
  before_action :set_novel
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def index
    @chapters = @novel.chapters
  end

  def show
  end

  def new
    @chapter = @novel.chapters.new
  end

  def create
    @chapter = @novel.chapters.new(chapter_params)
    if @chapter.save
      redirect_to novel_chapter_path(@novel, @chapter), notice: "Chapter created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to novel_chapter_path(@novel, @chapter), notice: "Chapter updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy
    redirect_to novel_path(@novel), notice: "Chapter deleted successfully!"
  end

  private

  def set_novel
    @novel = Novel.find(params[:novel_id])
  end

  def set_chapter
    @chapter = @novel.chapters.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :content)
  end
end
