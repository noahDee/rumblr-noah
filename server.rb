require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

if ENV['RACK_ENV'] == 'development'
set :database, {adapter: "sqlite3", database: "database.sqlite3"}
else
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
end

class Post < ActiveRecord::Base
  belongs_to :user, counter_cache: true
end



get "/" do
  session[:user_id] == nil
  erb :landing
end

post "/login" do
  p params
  user = User.find_by(email: params['email'])
  if user != nil
    if user.password == params['password']
      session[:user_id] = user.id
      redirect "/profile"
    else
      redirect "/"
    end
  end
end

post "/signup" do
  name = params['name']
  username = params['username']
  email = params['email']
  birthdate = params['birthdate']
  password = params['password']

  @user = User.new(name: name, username: username, email: email, birthdate: birthdate, password: password)
  @user.save
  session[:user_id] = @user.id

  redirect "/profile"
end

get "/profile" do
  if session[:user_id] == nil
    redirect "/"
  else
  @user = User.find_by(id: session[:user_id])
  erb:'/user/profile'
end
end

post "/profile" do
  title = params['title']
  content = params['content']
  user = User.find_by(id: session[:user_id])
  @post = Post.new(title: title, content: content, user: user)
  @post.save
  redirect "/profile"
end

get "/feed" do
  erb :'/user/feed'
end

get "/post/:id" do
  @post = Post.find(params['id'])
  erb :'/user/post'
end

get "/settings" do
  erb :'/user/settings'
end

post "/settings" do
  user = User.find(session[:user_id])
  user.destroy
  redirect "/"
end
