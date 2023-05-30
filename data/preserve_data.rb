require 'json'

def file_read(file)
  if File.exist?(file)
    file_data = File.read(file)
    JSON.parse(file_data)
  else
    []
  end
end

def file_write(file, content)
  hashed_content = content.map(&:to_hash)
  json = JSON.generate(hashed_content)
  File.write(file, json)
end