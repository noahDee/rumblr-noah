require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

if ENV['RACK_ENV']
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
  set :database, {adapter: "sqlite3", database: "database.sqlite3"}
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
  else
    redirect "/"
  end
end

post "/signup" do
  name = params['name']
  username = params['username']
  email = params['email']
  birthdate = params['birthdate']
  password = params['password']
  photo = params['photo']
  tags = params['tags']

  @user = User.new(name: name, username: username, email: email, birthdate: birthdate, password: password, photo: photo, tags: tags)
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
  tags = params['tags']
  user = User.find_by(id: session[:user_id])
  @post = Post.new(title: title, content: content, user: user, tags: tags)
  @post.save
  redirect "/profile"
end

post "/deletepost" do
  post = Post.find_by(id: params['post-id'])
  if post.user_id == session[:user_id]
  post.destroy
  redirect "/profile"
else
  redirect "/profile"
end
end

get "/feed" do
  if session[:user_id] == nil
    redirect "/"
  end
  erb :'/user/feed'
end

get "/post/:id" do
  @post = Post.find(params['id'])
  if @post.tags != nil
    @tags = @post.tags.split(',')
  else
    @tags = nil
  end
  erb :'/user/post'
end

get "/tag/:tag" do
  @tag = params['tag']
  @posts = []
  Post.find_each do |post|
    if post.tags !=nil && post.tags.include?("#{@tag}")

      @posts << post
    end
  end
  erb :'/user/tag'
end

post "/tag" do
  @tag = params["search"]
  redirect "/tag/#{@tag}"
end

post "/comment" do
  redirect "/feed"
end


get "/settings" do
  if session[:user_id] == nil
    redirect "/"
  else

  erb :'/user/settings'
end
end

post "/settings" do
  user = User.find(session[:user_id])
  user.destroy
  redirect "/profile"
end

post "/changephoto" do
  user = User.find_by(id: session[:user_id])
  user.update(photo: params['photo'])
  redirect "/profile"
end

post "/addtags" do
  user = User.find_by(id: session[:user_id])
  tags = "#{user.tags},#{params['tags']}"
  user.update(tags: tags)
  redirect "/profile"
end
