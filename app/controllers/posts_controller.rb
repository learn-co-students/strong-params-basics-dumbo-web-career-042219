class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private 
# if update and create has different field exposure, can use *arg
	def post_params(*arg)
		params.require(:post).permit(*arg)
	end 
# if create and update have same field exposure, can list both here.
	# def post_params
	# 	params.require(:post).permit(:title, :description)
# end
end
