require 'json'
require 'csv'

# Read JSON from a file
json_file = ARGV[0]

unless json_file && File.exist?(json_file)
  puts "Usage: ruby #{__FILE__} <json_file>"
  exit 1
end

# Parse JSON
json_data = File.read(json_file)
movies = JSON.parse(json_data)

# Create CSV filename by replacing .json with .csv
csv_file = File.basename(json_file, ".json") + ".csv"

# Write to CSV
CSV.open(csv_file, "w", write_headers: true, headers: ["url", "title", "date"]) do |csv|
  movies.each do |movie|
    csv << [movie["url"], movie["title"], movie["date"]]
  end
end

puts "CSV file '#{csv_file}' created successfully!"