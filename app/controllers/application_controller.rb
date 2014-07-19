class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

 
  def index
    @resourses = klass.all.to_a
  end

  def new
    nombre_variable = "@#{klass.to_s.downcase}"
    instance_variable_set nombre_variable, klass.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @resourse = Post.new(resourse_params)
    
    if @resourse.save
      redirect_to @resourse
    else
      render 'new'
    end
  end

  def edit
    #binding.pry
    @resourse = Post.find(params[:id])
  end

  def update
    @resourse = Post.find(params[:id])

    if @resourse.update(post_params)
      redirect_to @resourse
    else
      render 'edit'
    end
  end

  def destroy
    @resourse = Post.find(params[:id])
    @resourse.destroy

    redirect_to resourses_path
  end


  private
	  def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end

    def authenticate_user!
      if session[:user_id] == nil
        redirect_to root_url
      end
    end

end
