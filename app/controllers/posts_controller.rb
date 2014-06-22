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

  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end
  end


  private
  	def post_params
  		params.require(:post).permit(:title, :text) 
  		# EL text DA ERROR, probé con body pero no guarda el area de texto
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
  		params.require(:post).permit(:title, :text)
  	end

end
