# def page_content(title)
#     File.read("pages/#{title}.txt")
# rescue Errno::ENOENT
#     return nil
# end

# puts page_content("John Doe")

def save_content(title, content)
    File.open("pages/#{title}.txt", "w") do |file|
      file.print(content)
    end
end

save_content("Adnan Is-haq", "Software Developer Pro")