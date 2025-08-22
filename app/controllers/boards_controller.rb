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

  def edit
    @article = current_user.boards.find(params[:id])
  end

  def update
    @article = current_user.boards.find(params[:id])
    if @article.update(board_params)
      redirect_to board_path(@article), notice: "更新できました"
    else
      flash.now[:error] = "更新できませんでした"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    if @board.destroy
      redirect_to root_path, status: :see_other, notice: '削除に成功しました'
    else
      redirect_to board_path(@board), alert: '削除できませんでした'
    end
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end
