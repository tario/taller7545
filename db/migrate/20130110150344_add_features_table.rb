class AddFeaturesTable < ActiveRecord::Migration
  def up
    create_table :features do |t|
      t.text :description
      t.timestamps      
    end
  end

  def down
    dro_table :features
  end
end
