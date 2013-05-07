class AddSlugToEvents < ActiveRecord::Migration
  def change
    add_column :events, :slug, unique: true
  end
end
