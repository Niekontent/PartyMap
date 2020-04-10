class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :type
      t.string :description
      t.string :location
      t.date :date
      t.string :picture_url

      t.timestamps
    end
  end
end
