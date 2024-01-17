def page_content(title)
    File.read("pages/#{title}.txt")
rescue Errno::ENOENT
    return nil
end

puts page_content("John Doe")