class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.integer :highway
      t.integer :city
      t.float :cost
      t.text :notes

      t.timestamps
    end
  end
end
