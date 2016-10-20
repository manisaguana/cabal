class CreateChatrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.integer :creator_id

      t.timestamps
    end
  end
end
