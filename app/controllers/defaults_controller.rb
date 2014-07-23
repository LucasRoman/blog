class DefaultsController < ApplicationController
	
  helper_method :current_user
 
  before_action: instance_name, except: [:index]

  def instance_name
    instancia = "@#{klass.to_s.downcase}"
  end

  def index
    @instancias = "@#{klass.to_s.downcase.pluralize}"
  end

  def new
    instance_variable_set instancia, klass.new
  end

  def show
    instance_variable_set instancia, klass.find params[:id]
  end

  def create
    instance_variable_set instancia, klass.new instancia_params
    
    if instancia.save
      redirect_to instancia
    else
      render 'new'
    end
  end

  def edit
    instance_variable_set instancia, klass.find params[:id]
  end

  def update
    instance_variable_set instancia, klass.find params[:id]

    if instancia.update(instancia_params)
      redirect_to instancia
    else
      render 'edit'
    end
  end

  def destroy
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
