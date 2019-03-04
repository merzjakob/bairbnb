class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.integer :price_per_night
      t.text :address
      t.integer :number_of_guests
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
