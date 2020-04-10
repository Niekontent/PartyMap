class AddEventToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :event, null: true, foreign_key: true
  end
end
