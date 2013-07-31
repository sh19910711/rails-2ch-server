# coding: utf-8

describe BbsThreadsController do
  render_views
  fixtures :all
  
  # スレッドの表示テスト
  describe 'show action' do
    context 'Viewの確認' do
      before do
        get :show, :id => 1
      end
      it 'titleタグの確認' do
        doc = Nokogiri::HTML(response.body, nil, 'UTF-8')
        doc.title.should == 'Rails2chServer'
      end
    end
  end

  # スレッドへの書き込みを行うアクションのテスト
  describe 'create_response action' do
    random_str = rand(36**64).to_s(36)

    context 'POSTリクエスト' do
      before do
        post(
          :create_response,
          :id => 1,
          :success_callback_url => CGI.escape('http://localhost/'),
          :bbs_response => {
            :name => 'test',
            :mail => 'test',
            :info => random_str,
            :body => 'test'
          }
        )
        get :show, :id => 1
      end
      it '追加したデータが表示されているかどうか' do
        response.body.include?(random_str).should == true
      end
    end

    # fixturesの確認用, contextごとに読み込まれるっぽい
    context 'fixturesの確認用' do
      before do
        get :show, :id => 1
      end
      it '別のコンテキストの結果に依存しない' do
        response.body.include?(random_str).should == false
      end
    end
  end

  # スレッド名の変更
  describe 'update action' do
    random_str = rand(36**64).to_s(36)
    bbs_thread = nil
    context 'スレッド名を変更する' do
      it '元の名前が違うことを確認' do
        bbs_thread = BbsThread.find(1)
        bbs_thread.screen_name.should_not == random_str
      end
      it 'スレッド名を変更して変更されたことを確認' do
        put(
          :update,
          :id => 1,
          :bbs_thread => {
            :screen_name => random_str
          },
          :data => {
            :success_callback_url => CGI.escape('http://localhost/')
          }
        )
        bbs_thread = BbsThread.find(1)
        bbs_thread.screen_name.should == random_str
      end
    end
  end

end

