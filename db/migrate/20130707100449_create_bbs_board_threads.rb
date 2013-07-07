class CreateBbsBoardThreads < ActiveRecord::Migration
  def change
    create_table :bbs_board_threads, :force => true do |t|
      t.integer :bbs_board_id,  :null => false
      t.integer :bbs_thread_id, :null => false

      t.timestamps
    end

    add_index :bbs_board_threads, [:bbs_board_id], :name => "fk_bbs_board_threads_bbs_boards_idx"
    add_index :bbs_board_threads, [:bbs_thread_id], :name => "bbs_thread_id_UNIQUE", :unique => true
    add_index :bbs_board_threads, [:bbs_thread_id], :name => "fk_bbs_board_threads_bbs_threads1_idx"
    add_index :bbs_board_threads, [:id], :name => "id_UNIQUE", :unique => true
  end
end
