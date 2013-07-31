# encoding: utf-8
require 'spec_helper'
require 'nokogiri'

describe BbsManagerController do
  fixtures :all
  render_views

  describe 'index action' do
    context 'Viewの確認' do
      before '読み込み' do
        get :index
      end
      it 'titleタグ' do
        doc = Nokogiri::HTML.parse(response.body, nil, 'UTF-8')
        doc.title.should == "Rails2chServer"
      end
    end
  end

end

