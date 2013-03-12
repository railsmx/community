class AddColumsToIdentities < ActiveRecord::Migration
  def change
    drop_table :identities
    create_table :identities do |t|
      t.string :provider, :null => false
      t.string :uid, :null => false
      t.string :username, :null => false
      t.string :email, :null => false
      t.boolean :block, :default => false 

      t.timestamps
    end
  end
end
