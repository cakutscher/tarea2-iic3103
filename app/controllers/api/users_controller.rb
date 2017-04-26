class Api::UsersController < ApplicationController
  protect_from_forgery prepend: true
  skip_before_filter :verify_authenticity_token

  def index
    users = User.all
    render json: { 'usuarios' => users,'total' => users.count}
  end


  def show
    begin
      user = User.find(params[:id])
      render json: user, status: 200
    end
  end

   def create
     begin
       user=User.new(user_params)
       body_request = request.raw_post
       if body_request.include? '"id"'
        render json: { error: "No se puede crear usuario con id"}, status: 400
       else
        if user.save
          render json: user, status: 201
        else
          #render json: { error: "La creacion ha fallado"}, status: :internal_server_error
          render json: { error: "La creacion ha fallado"}, status: 500
        end
       end
     end
    end

    # Updating users
    def update
      begin
        #begin para hacer catching exceptions. Bloque. Se sale cuando se llega a una exepcion
        #En ApplicationController se define ActiveRecord::Not found
        user = User.find(params[:id])
        body_request = request.raw_post
        if body_request.include? '"id"'
          render_400
        else
          user = User.find(params[:id])
          if user.update(user_params)
            render json: user, status: 200
          else
            render_500
            # else error 500 esta manejado implicitamente. corroborar NO
          end
        end
      end
    end

    # Deleting users
    def destroy
      user = User.find(params[:id])
      user.destroy
    end

    private
    def user_params
      params.require(:user).permit(:usuario, :nombre, :apellido, :twitter)
    end

    def render_400
      render json: { error: "id no es modificable"}, status: 400
    end

    def render_404
        render json: { error: "Usuario no encontrado"}, status: 404
    end

    def render_500
      render json: { error: "La modificación ha fallado"}, status: 500
    end

end
