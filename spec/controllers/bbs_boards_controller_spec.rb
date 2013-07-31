# coding: utf-8
require 'spec_helper.rb'
require 'nokogiri'

describe BbsBoardsController do
  render_views
  fixtures :all

  describe 'index action' do
    context 'Viewの確認' do
      before do
        get :index
      end
      it 'Titleタグ' do
        doc = Nokogiri::HTML(response.body, nil, 'UTF-8')
        doc.title.should == 'Rails2chServer'
      end
    end
  end

  describe 'show action' do
    context '指定した板を表示する' do
      before do
        get :show, :id => 3
      end
      it 'fixturesのスレッドが表示されているか確認する' do
        response.body.include?('野球').should == true
        response.body.include?('サッカー').should == true
      end
    end
  end

  describe 'create action' do
    random_str = rand(36**64).to_s(36)
    context '板を作成する' do
      before do
        post(
          :create,
          :bbs_board => {
            :key => 'test-test-test',
            :screen_name => random_str
          }
        )
      end
      it '板が作成されたことを確認する' do
        BbsBoard.exists?(:key => 'test-test-test').should == true
        BbsBoard.where(:key => 'test-test-test').first.screen_name.should == random_str
      end
    end
  end 

  # 指定した板にスレッドを作成する
  describe 'create_thread action' do
    random_str = rand(36**64).to_s(36)
    context 'スレッドを作成する' do
      before do
        post(
          :create_thread,
          :bbs_thread => {
            :bbs_board_id => 1,
            :screen_name => random_str
          }
        )
      end
      it '作成したスレッドが存在することを確認する' do
        BbsBoard.find(1).bbs_threads.exists?(:screen_name => random_str).should == true
      end
    end
  end

  describe 'update' do
    random_str = rand(36**64).to_s(36)
    context '板の情報を編集する' do
      before do
        put(
          :update,
          :id => 1,
          :bbs_board => {
            :screen_name => random_str
          }
        )
      end
      it '板情報が編集されたことを確認する' do
        BbsBoard.find(1).screen_name.should == random_str
        BbsBoard.find(3).screen_name.should_not == random_str
      end
    end
  end

end

