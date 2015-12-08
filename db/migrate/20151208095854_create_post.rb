class CreatePost < ActiveRecord::Migration
	def change
		create_table :posts do |t|
			t.text :title
			t.text :description
			t.string :monthly_rental
			t.string :preference
			t.string :extra
			t.integer :user_id

			t.timestamps null: false
		end
	end
end
