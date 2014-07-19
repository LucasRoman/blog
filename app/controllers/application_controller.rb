class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
 
  def index
    @resourses = klass.all.to_a
  end

  def new
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.new
  end

  def show
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.find params[:id]
  end

  def create
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.new instancia_params
    
    if instancia.save
      redirect_to instancia
    else
      render 'new'
    end
  end

  def edit
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.find params[:id]
  end

  def update
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.find params[:id]

    if instancia.update(instancia_params)
      redirect_to instancia
    else
      render 'edit'
    end
  end

  def destroy
    instancia = "@#{klass.to_s.downcase}"
    instance_variable_set instancia, klass.find params[:id]
    instancia.destroy

    redirect_to instancias_path
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

    def instancia_params
      params.require(:instancia).permit(:title, :body)
    end

end
