class CreateBaggages < ActiveRecord::Migration[7.0]
  def change
    create_table :baggages do |t|
      t.integer :numberThings
      t.float :totalWeight

      t.timestamps
    end
  end
end
