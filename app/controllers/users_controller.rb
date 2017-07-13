get "/users" do
  @users = User.all

  erb :"users/index"
end

post "/users" do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    erb :"/users/show"
  else
    @errors = @user.errors.full_messages
    erb :"register"
  end
end

get "/users/new" do

  erb :"register"
end

get "/users/:id" do
  @user = User.find(params[:id])

  erb :"users/show"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])

  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find(params[:id])
  @user.update(params[:user])

  redirect :"/user/#{@user.id}"
end

delete "/users/:id/delete" do
  User.find(params[:id]).destroy

  redirect :"/users"
end
