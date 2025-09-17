class CreatePromotions < ActiveRecord::Migration[8.0]
  def change
    create_table :promotions do |t|
      t.string :title
      t.decimal :discount

      t.timestamps
    end
  end
end
