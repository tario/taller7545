class AddChooseFeatureTable < ActiveRecord::Migration
  def up
    create_table :pre_registration_features, :primary_key => :pre_registration_id do |t|
      t.integer :feature_id
      t.integer :pre_registration_id
    end
  end

  def down
    drop_table :pre_registration_features
  end
end
