class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider, :null => false
      t.string :uid, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.boolean :blocked, :default => false

      t.timestamps
    end
  end
end