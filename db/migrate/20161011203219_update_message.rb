class UpdateMessage < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :author_id, :integer
    remove_column :messages, :chat_id,   :integer
  end
end
