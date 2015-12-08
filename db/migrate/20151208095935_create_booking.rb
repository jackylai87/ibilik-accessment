class CreateBooking < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.integer :status
			t.integer :user_id
			t.integer :post_id

			t.timestamps null: false
		end
	end
end
