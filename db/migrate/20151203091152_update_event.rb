class UpdateEvent < ActiveRecord::Migration
  def change
    remove_column :events, :content, :string

    add_column :events, :key, :string
    add_column :events, :options, :string
  end
end
