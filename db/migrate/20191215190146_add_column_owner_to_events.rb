class AddColumnOwnerToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :owner
  end
end
