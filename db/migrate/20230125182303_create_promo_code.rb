class CreatePromoCode < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.decimal :discount_percentage

      t.timestamps
    end
  end
end
