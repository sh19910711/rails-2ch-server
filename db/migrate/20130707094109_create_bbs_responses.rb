class CreateBbsResponses < ActiveRecord::Migration
  def change
    create_table :bbs_responses, :force => true do |t|
      t.string :key,  :limit => 64,   :null => false
      t.string :name, :limit => 256,  :null => false
      t.string :mail, :limit => 256,  :null => false
      t.string :info, :limit => 512,  :null => false
      t.string :body, :limit => 4096, :null => false

      t.timestamps
    end

    add_index :bbs_responses, [:id], :name => "id_UNIQUE", :unique => true
    add_index :bbs_responses, [:key], :name => "key_UNIQUE", :unique => true
  end
end
