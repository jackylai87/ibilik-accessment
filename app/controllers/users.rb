# User login and Validating
get '/users' do
	erb :'user/index'
end

post '/users/login' do
	user = User.find_by(email: params[:email])
	if user.nil?
		flash[:id] = "Invalid ID"
		redirect '/users'
	else
		if user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/users/#{user.id}"
		else
			flash[:pw] = "Invalid Password"
			redirect '/users'
		end
	end
end

# User logout

get '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

# Display new user form

get '/users/new' do
	erb :"user/new"
end

# Create new user

post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	
	if !user.save
		flash[:email_taken] = "Email has already been taken / Password length less than 6"
		redirect '/users/new'
	else
		session[:user_id] = user.id
		redirect "/users/#{user.id}"
	end
end

# Display user edit form

get '/users/:id/edit' do
	
	@user = User.find(params[:id])
	if current_user.id == @user.id
		erb :'user/edit'
	else
		erb :'user/error'
	end
end 

# Update user

patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password])
	redirect "/users/#{user.id}"
end

# Delete user

delete '/users/:id' do
	user = User.find(params[:id])
	user.destroy
	redirect '/'
end

# View user profile

get '/users/:id' do
	@user = User.find(params[:id])
	# @comment = user.comment.where(user_id: params[:id])
	erb :'user/show'
end

# View login page

not_found do
	erb :"user/error"
end
