class BbsThread < ActiveRecord::Base
  attr_accessible :key, :screen_name
  has_many :bbs_thread_responses, :dependent => :destroy
  has_many :bbs_responses, :through => :bbs_thread_responses, :dependent => :destroy
  has_one :bbs_board_thread, :dependent => :destroy
  has_one :bbs_board, :through => :bbs_board_thread
end
