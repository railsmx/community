class ChangeNameFromUsersToIdentities < ActiveRecord::Migration
  def change
    rename_table :users, :identities
  end
end
