class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    users = User.all
    #c = users.count

    #render json: { 'usuarios' => { users.each do |hola| hola.to_json(:except => ['created_at', 'updated_at']) } }




  end


  def show
    user = User.find(params[:id]) rescue nil
    if user
      render json: user, status: 201
    else
      render json: { errors: "Usuario no encontrado"}, status: 404
      ##manejar con handler errors ActiveRecord::RecordNotFound
    end
  end

  def create
    user=User.new(user_params)
      # if the user is saved successfully than respond with json data and status code 201
      if user.save
        render json: user, status: 201
      else
        #render json: { errors: user.errors}, status: 422
        render json: { errors: "La creacion ha fallado"}, status: 500
      end
    end

    # Updating users
    def update

      #primero revisar si el usuario existe.
      #error si se modifica el id
      current_query_string = URI(request.url).query  ##el problema es que no se prueba con url. 
      if current_query_string.include? "id"
        render json: { errors: 'id no es modificable' }, status: 400
      else
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user, status: 200
        else
          render json: { errors: user.errors }, status: 422
        end

      end



    end

    # Deleting users
    def destroy
      user = User.find(params[:id])
      user.destroy
      head 204
    end

    private
    def user_params
      params.require(:user).permit(:usuario, :nombre, :apellido, :twitter)
    end

end
