get '/' do
	@all = Post.all
  erb :"static/index"
end