require "sinatra"

def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end

def save_content(title, content)
    File.open("pages/#{title}.txt", "w") do |file|
      file.print(content)
    end
end

get "/" do
  erb :welcome
end

get "/test" do
    erb :test
end

get "/new" do
    erb :new
end

get "/:title" do
    @title = params[:title]
    @content = page_content(@title)  
    erb :show
end

post "/create" do
   new_entity = params
   save_content(new_entity["title"], new_entity["content"])
   erb :create
end