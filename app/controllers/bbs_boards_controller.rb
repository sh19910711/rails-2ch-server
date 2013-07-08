class BbsBoardsController < ApplicationController
  def index
    respond_to {|format|
      format.html
    }
  end

  def show
    @bbs_board = BbsBoard.find(params[:id])
    @all_bbs_threads = @bbs_board.bbs_threads.all
    @new_bbs_thread = BbsThread.new
    respond_to {|format|
      format.html
    }
  end

  def create
    @new_bbs_board = BbsBoard.new(
      :key => params[:bbs_board][:key],
      :screen_name => params[:bbs_board][:screen_name]
    )

    if @new_bbs_board.save
      redirect_to board_manager_index_path
    else
      render :text => 'error'
    end
  end

  def create_thread
    @bbs_board = BbsBoard.find(params[:bbs_thread][:bbs_board_id])
    @new_bbs_thread = @bbs_board.bbs_threads.create(
      :screen_name => params[:bbs_thread][:screen_name]
    )
    redirect_to bbs_board_path @bbs_board
  end

  def edit
    @bbs_board = BbsBoard.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def delete
    @bbs_board = BbsBoard.find(params[:id])
    @bbs_board.destroy
    redirect_to board_manager_index_path
  end

  def update 
    @bbs_board = BbsBoard.find(params[:id])
    @bbs_board.update_attributes params[:bbs_board]
    redirect_to board_manager_index_path
  end

end
