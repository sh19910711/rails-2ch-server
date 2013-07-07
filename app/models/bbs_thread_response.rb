class BbsThreadResponse < ActiveRecord::Base
  attr_accessible :bbs_thread_id, :bbs_response_id
  belongs_to :bbs_thread
  belongs_to :bbs_response, :dependent => :destroy
end
