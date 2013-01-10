class AddConfirmFieldsPreregistration < ActiveRecord::Migration
  def up
    add_column :pre_registrations, :confirm_token, :string
    add_column :pre_registrations, :confirmed, :boolean
  end

  def down
    remove_column :pre_registrations, :confirm_token
    remove_column :pre_registrations, :confirmed
  end
end
