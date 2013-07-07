class CreateBbsThreadResponses < ActiveRecord::Migration
  def change
    create_table :bbs_thread_responses, :force => true do |t|
      t.integer :bbs_thread_id,   :null => false
      t.integer :bbs_response_id, :null => false

      t.timestamps
    end

    add_index :bbs_thread_responses, [:bbs_response_id], :name => "bbs_response_id_UNIQUE", :unique => true
    add_index :bbs_thread_responses, [:bbs_response_id], :name => "fk_bbs_thread_responses_bbs_responses1_idx"
    add_index :bbs_thread_responses, [:bbs_thread_id], :name => "fk_bbs_thread_responses_bbs_threads1_idx"
    add_index :bbs_thread_responses, [:id], :name => "id_UNIQUE", :unique => true
  end
end
