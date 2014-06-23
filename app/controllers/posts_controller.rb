class PostsController < ApplicationController
  def index
  	@posts = Post.all.to_a
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
    #binding.pry
  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end


  def edit
  	@post = Post.new(params[:id])
  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end

end
