get "/sessions/new" do

  erb :"login"
end

post "/sessions" do
  @user = User.find_by(email: params[:email])

  if @user
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :"login"
    end
  else
    @errors = ["Oops!  You need to register, let's take care of that now."]
    @user = params[:user]
    erb :"register", locals: {user: @user}
  end

end

get '/sessions/delete' do
  session[:user_id] = nil

  redirect :"/sessions/new"
end
