# Display new post form

get '/posts/new' do
	erb :"post/new"
end

# Create new post

post '/posts' do
	post = Post.create(title: params[:title], description: params[:description], monthly_rental: params[:monthly_rental], preference: params[:preference], extra: params[:extra], user_id: session[:user_id])
	redirect "/posts/#{post.id}"
end

# Display post edit form

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :'post/edit'
end 

# Update post

patch '/posts/:id' do
	post = Post.find(params[:id])
	post.update(title: params[:title], description: params[:description], monthly_rental: params[:monthly_rental], preference: params[:preference], extra: params[:extra])
	redirect "/posts/#{post.id}"
end

# Delete post

delete '/posts/:id' do
	post = Post.find(params[:id])
	post.destroy
	redirect "/"
end

# View post profile

get '/posts/:id' do
	@post = Post.find(params[:id])
	@comment = Comment.where(post_id: params[:id])
	erb :'post/show'
end

post '/posts/:id/comment' do

	@comment = Comment.create(input: params[:input], user_id: session[:user_id], post_id: params[:id])
	redirect "/posts/#{params[:id]}"
end

patch '/posts/:id/comment/:comid' do
	post = Post.find(params[:id])
	comment = Comment.find(params[:comid])
	comment.update(input: params[:input])
	redirect "/posts/#{post.id}"
end

delete '/posts/:id/comment/:comid' do
	post = Post.find(params[:id])
	comment = Comment.find(params[:comid])
	comment.destroy
	redirect "/posts/#{post.id}"
end