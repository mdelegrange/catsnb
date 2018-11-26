class AddAttributesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :cat, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_column :bookings, :status, :string
    add_column :bookings, :begin_date, :date
    add_column :bookings, :end_date, :date
    add_column :bookings, :total_price, :integer
    add_column :bookings, :message, :text
  end
end
