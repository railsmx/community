class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.datetime :date, :null => false
      t.string :location, :null => false
      t.string :contact, :null => false
      t.string :organizer, :null => true
      t.references :identity, :index => true

      t.timestamps
    end
  end
end