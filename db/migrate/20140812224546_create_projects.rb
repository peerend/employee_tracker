class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |e|
      e.column :name, :string
      e.column :start_date, :date
      e.column :end_date, :date

      e.timestamps
    end
  end
end
