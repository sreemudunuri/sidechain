class AddTimestampToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :timestamp, :string
  end
end
