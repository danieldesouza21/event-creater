class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date_time
      t.string :location
      t.integer :duration
      t.integer :owner_id
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
