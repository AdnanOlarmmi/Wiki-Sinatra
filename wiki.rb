require "sinatra"

def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end

puts page_content("John Doe")

get "/" do
  erb :welcome
end

get "/test" do
    erb :test
end

get "/:title" do
    @title = params[:title]
    @content = page_content(@title)  
    erb :show
end