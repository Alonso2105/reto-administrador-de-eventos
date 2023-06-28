class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :event_date
      t.string :location
      t.float :cost

      t.timestamps
    end
  end
end
