class AddIndexToPolls < ActiveRecord::Migration[5.1]
  def change
    add_index :polls, :user_id
  end
end
