class BoardsController < ApplicationController

  def index
    @articles = Board.all
  end

  def show
    @article = Board.find(params[:id])
  end

  def new
     @article = current_user.boards.build
  end

  def create
    @article = current_user.boards.build(board_params)
    if @article.save
      redirect_to board_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end

end