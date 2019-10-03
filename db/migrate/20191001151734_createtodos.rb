class Createtodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.boolean :done, default: false
    end
  end
end
