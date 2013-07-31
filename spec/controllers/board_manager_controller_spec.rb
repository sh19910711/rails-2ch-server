# coding: utf-8
require 'spec_helper.rb'

describe BoardManagerController do
  fixtures :all
  render_views

  describe 'index action' do
    context 'Viewの確認' do
      before do
        get :index
      end
      it 'titleタグ' do
        doc = Nokogiri::HTML(response.body, nil, 'UTF-8')
        doc.title.should == 'Rails2chServer'
      end
    end
  end

end

