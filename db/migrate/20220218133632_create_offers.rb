# frozen_string_literal: true

class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title, null: false
      t.string :header, null: false
      t.string :description
      t.integer :points, null: false
      t.decimal :payout, null: false

      t.timestamps
    end
  end
end
