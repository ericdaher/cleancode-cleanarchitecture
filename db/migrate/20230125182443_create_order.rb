class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :user_cpf

      t.timestamps
    end
  end
end
