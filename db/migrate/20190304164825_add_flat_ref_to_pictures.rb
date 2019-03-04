class AddFlatRefToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :flat, foreign_key: true
  end
end
