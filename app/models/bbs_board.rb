class BbsBoard < ActiveRecord::Base
  attr_accessible :key, :screen_name
  has_many :bbs_board_threads, :dependent => :destroy
  has_many :bbs_threads, :through => :bbs_board_threads
end
