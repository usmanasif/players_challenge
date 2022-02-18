class CreateOfferTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_targets do |t|
      t.references :offer, null: false, foreign_key: true
      t.integer :minimum_age
      t.integer :maximum_age
      t.string :gender
      t.string :operating_system
      t.string :minimum_os_version
      t.string :locale

      t.timestamps
    end
  end
end
