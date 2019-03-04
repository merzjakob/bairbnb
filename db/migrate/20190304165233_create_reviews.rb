class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :user_review
      t.text :host_review
      t.integer :user_rating
      t.integer :host_rating
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
