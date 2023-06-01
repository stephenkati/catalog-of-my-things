require 'json'

def file_read(file)
  if File.exist?(file)
    if File.empty?(file)
      []
    else
      file_data = File.read(file)
      JSON.parse(file_data)
    end
  else
    []
  end
end

def file_write(file, content)
  hashed_content = content.map(&:to_hash)
  json = JSON.generate(hashed_content)
  File.write(file, json)
end
