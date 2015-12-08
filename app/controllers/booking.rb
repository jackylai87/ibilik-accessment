post '/posts/:postid/book' do
	book = Booking.new(status: 1, user_id: session[:user_id], post_id: params[:postid])
	if !book.user_id.nil?	
		book_id = Booking.find_by(user_id: session[:user_id])
		booked = Booking.find_by(status: 1, post_id: params[:postid])
		if book_id.nil?
			book.save
		elsif book.user_id == booked.user_id
			book_id.destroy
		end
	elsif booked.status == 1
			book_id = Booking.find_by(user_id: session[:user_id])
			book_id.destroy
			flash[:booked] = "Too Bad, Property unavailable at the moment."
	end
		redirect "/posts/#{params[:postid]}"
end

# delete '/posts/:postid/book/:bookid' do
# 	post = Post.find(params[:postid])
# 	book = Booking.find(params[:bookid])
# 	book.destroy
# 	redirect "/posts/#{params[:postid]}"
# end