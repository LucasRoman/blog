class PostsController < ApplicationController
  def index
  	@posts = Post.all.to_a
  end

  def new

  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)

  	@post.save
  	redirect_to @post
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :text) 
  		# EL text DA ERROR, probé con body pero no guarda el area de texto
  	end
end
