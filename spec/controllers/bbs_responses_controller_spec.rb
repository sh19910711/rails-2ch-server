# coding: utf-8
require 'spec_helper.rb'
require 'nokogiri'

describe BbsResponsesController do
  render_views
  fixtures :all

  describe 'show action' do
    context 'Viewの確認#1' do
      before do
        get :show, :id => 1
      end
      it 'titleタグ' do
        doc = Nokogiri::HTML(response.body, nil, 'UTF-8')
        doc.title.should == 'Rails2chServer'
      end
      it 'ID=1のレスポンスが表示されたかどうか' do
        res_name = BbsResponse.find(1).name
        response.body.include?(res_name).should == true
      end
    end
    context 'Viewの確認#2' do
      before do
        get :show, :id => 2
      end
      it 'titleタグ' do
        doc = Nokogiri::HTML(response.body, nil, 'UTF-8')
        doc.title.should == 'Rails2chServer'
      end
      it 'ID=1のレスポンスが表示されたかどうか' do
        res_name = BbsResponse.find(2).name
        response.body.include?(res_name).should == true
      end
    end
  end

  describe 'delete action' do
    context 'DELETEリクエスト' do
      before do
        delete :delete, :id => 1, :success_callback_url => CGI.escape('http://localhost/')
      end
      it '削除されていることを確認' do
        BbsResponse.exists?(1).should == false
      end
    end
  end

  describe 'update action' do
    context 'PUTリクエスト' do
      random_str = rand(36**64).to_s(36)
      before do
        res = BbsResponse.find(1)
        put(
          :update,
          :id => 1,
          :bbs_response => {
            :id   => res.id,
            :name => random_str,
            :info => res.info,
            :mail => res.mail,
            :body => res.body
          },
          :data => {
            :success_callback_url => CGI.escape('http://localhost/')
          }
        )
      end
      it do
        BbsResponse.find(1).name.should == random_str
      end
    end
  end

end

