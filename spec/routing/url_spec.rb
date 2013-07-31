# coding: utf-8
require 'spec_helper.rb'

describe 'ルーティングのテスト' do
  
  it 'BbsManager関連' do
    expect(:get => 'http://example.com').to(
      route_to(
        :action => 'index',
        :controller => 'bbs_manager',
      )
    )
  end

  it 'BoardManager関連' do
    expect(:get => 'http://example.com/board_manager').to(
      route_to(
        :action => 'index',
        :controller => 'board_manager',
      )
    )
  end

  it 'BbsBoard関連' do
    expect(:get => 'http://example.com/bbs_boards').to(
      route_to(
        :action => 'index',
        :controller => 'bbs_boards',
      )
    )
    expect(:post => 'http://example.com/bbs_boards').to(
      route_to(
        :action => 'create',
        :controller => 'bbs_boards',
      )
    )
    expect(:post => 'http://example.com/bbs_boards/create_thread').to(
      route_to(
        :action => 'create_thread',
        :controller => 'bbs_boards',
      )
    )

    expect(:get => 'http://example.com/bbs_boards/1/edit').to(
      route_to(
        :action => 'edit',
        :controller => 'bbs_boards',
        :id => '1',
      )
    )
    expect(:delete => 'http://example.com/bbs_boards/1').to(
      route_to(
        :action => 'delete',
        :controller => 'bbs_boards',
        :id => '1',
      )
    )
    expect(:put => 'http://example.com/bbs_boards/1').to(
      route_to(
        :action => 'update',
        :controller => 'bbs_boards',
        :id => '1',
      )
    )
  end

  it 'BbsThreads' do
    expect(:get => 'http://example.com/bbs_threads').to(
      route_to(
        :action => 'index',
        :controller => 'bbs_threads'
      )
    )
    expect(:post => 'http://example.com/bbs_threads').to(
      route_to(
        :action => 'create',
        :controller => 'bbs_threads'
      )
    )

    expect(:get => 'http://example.com/bbs_threads/1').to(
      route_to(
        :action => 'show',
        :controller => 'bbs_threads',
        :id => '1',
      )
    )
    expect(:get => 'http://example.com/bbs_threads/1/edit').to(
      route_to(
        :action => 'edit',
        :controller => 'bbs_threads',
        :id => '1',
      )
    )
    expect(:delete => 'http://example.com/bbs_threads/1/hoge').to(
      route_to(
        :action => 'delete',
        :controller => 'bbs_threads',
        :return_url => 'hoge',
        :id => '1',
      )
    )
    expect(:put => 'http://example.com/bbs_threads/1').to(
      route_to(
        :action => 'update',
        :controller => 'bbs_threads',
        :id => '1',
      )
    )
    expect(:post => 'http://example.com/bbs_threads/1/create_response/hoge').to(
      route_to(
        :action => 'create_response',
        :controller => 'bbs_threads',
        :id => '1',
        :success_callback_url => 'hoge',
      )
    )
  end

  it 'BbsResponses' do
    expect(:get => 'http://example.com/bbs_responses').to(
      route_to(
        :action => 'index',
        :controller => 'bbs_responses',
      )
    )

    expect(:get => 'http://example.com/bbs_responses/1').to(
      route_to(
        :action => 'show',
        :controller => 'bbs_responses',
        :id => '1',
      )
    )
    expect(:get => 'http://example.com/bbs_responses/1/edit').to(
      route_to(
        :action => 'edit',
        :controller => 'bbs_responses',
        :id => '1',
      )
    )
    expect(:delete => 'http://example.com/bbs_responses/1/hoge').to(
      route_to(
        :action => 'delete',
        :controller => 'bbs_responses',
        :id => '1',
        :success_callback_url => 'hoge',
      )
    )
    expect(:put => 'http://example.com/bbs_responses/1').to(
      route_to(
        :action => 'update',
        :controller => 'bbs_responses',
        :id => '1',
      )
    )
  end

end

