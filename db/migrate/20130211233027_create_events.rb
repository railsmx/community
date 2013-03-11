class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :location
      t.string :contact
      t.string :organizer
      

      t.timestamps
    end
  end
end
