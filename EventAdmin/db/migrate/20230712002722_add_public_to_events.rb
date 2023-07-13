class AddPublicToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :public, :boolean, default: false, null: false
  end
end
