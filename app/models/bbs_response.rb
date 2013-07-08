class BbsResponse < ActiveRecord::Base
  attr_accessible :info, :key, :mail, :name, :body
  has_one :bbs_thread_response, :dependent => :destroy
  has_one :bbs_thread, :through => :bbs_thread_response
end
