class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :header
      t.string :description
      t.integer :points
      t.decimal :payout

      t.timestamps
    end
  end
end
