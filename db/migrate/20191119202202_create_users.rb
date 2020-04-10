class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :description
      t.integer :age
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
  end
end
