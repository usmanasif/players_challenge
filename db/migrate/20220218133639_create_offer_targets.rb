# frozen_string_literal: true

class CreateOfferTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_targets do |t|
      t.references :offer, null: false, foreign_key: true
      t.integer :minimum_age, null: false
      t.integer :maximum_age, null: false
      t.integer :gender, null: false
      t.string :operating_system, null: false
      t.string :minimum_os_version, null: false
      t.string :locale, null: false

      t.timestamps
    end
  end
end
