class BoardManagerController < ApplicationController
  def index
    @all_bbs_boards = BbsBoard.all
    @new_bbs_board = BbsBoard.new

    respond_to {|format|
      format.html
    }
  end

  def create
  end

end
