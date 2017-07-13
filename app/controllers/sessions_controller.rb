get "/sessions/new" do

  erb :"login"
end

post "/sessions" do
  @user = User.find_by(email: params[:email])

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Crap, something went wrong.  Try again."]
    erb :"login"
  end

end

get '/sessions/delete' do
  session[:user_id] = nil

  redirect :"/sessions/new"
end
