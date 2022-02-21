# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :modelname, null: false
      t.string :operating_system, null: false
      t.string :os_version, null: false
      t.string :locale, null: false
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
