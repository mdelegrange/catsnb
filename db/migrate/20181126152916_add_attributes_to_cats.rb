class AddAttributesToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :name, :string
    add_column :cats, :breed, :string
    add_column :cats, :photo, :string
    add_column :cats, :description, :text
    add_column :cats, :birth_date, :date
    add_reference :cats, :user, foreign_key: true
    add_column :cats, :price_per_day, :integer
  end
end
