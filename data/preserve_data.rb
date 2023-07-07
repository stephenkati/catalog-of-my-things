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
  existing_data = file_read(file)
  all_data = existing_data + content.map(&:to_hash)
  json = JSON.generate(all_data)
  File.write(file, json)
end
