class PostsController < ApplicationController
  
  http_basic_authenticate_with name: "Lucas", password: "123", except: [:index, :show]
  before_action :authenticate_user!
 

  def Klass
    Post
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end

end
