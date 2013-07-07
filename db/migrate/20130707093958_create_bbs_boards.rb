class CreateBbsBoards < ActiveRecord::Migration
  def change
    create_table :bbs_boards, :force => true do |t|
      t.string :key,         :limit => 64,  :null => false
      t.string :screen_name, :limit => 256, :null => false

      t.timestamps
    end

    add_index :bbs_boards, [:id], :name => "id_UNIQUE", :unique => true
    add_index :bbs_boards, [:key], :name => "key_UNIQUE", :unique => true
  end
end
