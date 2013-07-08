class DeleteKeyColumnsFromAllTables < ActiveRecord::Migration
  def up
    remove_column :bbs_responses, :key
    remove_column :bbs_threads, :key
  end

  def down
    add_column :bbs_threads, :key, :string
    add_column :bbs_responses, :key, :string
  end
end
