class AddRegistrationTable < ActiveRecord::Migration
  def up
    create_table :pre_registrations do |t|
      t.string :email
      t.timestamps
    end
  end

  def down
    drop_table :pre_registrations
  end
end
