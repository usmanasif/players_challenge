# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :modelname
      t.string :operating_system
      t.string :os_version
      t.string :locale
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
