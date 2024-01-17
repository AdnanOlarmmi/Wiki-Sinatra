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
  page_content(params[:title])  
end