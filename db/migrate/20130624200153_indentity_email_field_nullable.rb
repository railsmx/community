class IndentityEmailFieldNullable < ActiveRecord::Migration
  def change
    change_column :identities, :email, :string, null: true
  end
end
