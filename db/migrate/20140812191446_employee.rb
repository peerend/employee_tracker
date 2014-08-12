class Employee < ActiveRecord::Migration
  def change
    create_table :employees do |e|
      e.column :name, :string
      e.column :division_id, :int

      e.timestamps
    end
  end
end
