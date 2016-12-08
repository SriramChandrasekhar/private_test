class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.column :name, :string
      t.column :vendor_id, :integer
      t.column :location, :string
      t.timestamps null: false
    end
  end
end
