class BbsBoardThread < ActiveRecord::Base
  attr_accessible :bbs_board_id, :bbs_thread_id
  belongs_to :bbs_board
  belongs_to :bbs_thread, :dependent => :destroy
end
