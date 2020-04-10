class CreateEventUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_users do |t|
      t.belongs_to :event, index: true
      t.belongs_to :user, index: true
      t.boolean :confirmed, default: false
    end
  end
end
