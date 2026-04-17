require 'json'
require 'pathname'

# Check if a filename was provided
if ARGV.empty?
  puts "Usage: ruby script.rb <input_file.json>"
  exit
end

input_path = ARGV[0]

# 1. Construct the output filename
# This gets the directory, the filename without extension, and the extension
dirname  = File.dirname(input_path)
basename = File.basename(input_path, ".*") # e.g., "data" from "data.json"
extname  = File.extname(input_path)        # e.g., ".json"

output_path = File.join(dirname, "#{basename}-posts#{extname}")

begin
  # 2. Read and parse
  file_content = File.read(input_path)
  data = JSON.parse(file_content)

  # 3. Extract and flatten
  all_posts = data.flat_map { |page| page['posts'] || [] }

  # 4. Write to the new path
  File.open(output_path, 'w') do |f|
    f.write(JSON.pretty_generate(all_posts))
  end

  puts "Done! Flattened #{all_posts.size} posts."
  puts "Output saved to: #{output_path}"

rescue Errno::ENOENT
  puts "Error: File '#{input_path}' not found."
rescue JSON::ParserError
  puts "Error: Failed to parse JSON. Check the input file format."
rescue => e
  puts "An unexpected error occurred: #{e.message}"
end