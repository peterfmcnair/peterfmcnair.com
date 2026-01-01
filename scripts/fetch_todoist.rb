require "net/http"
require "json"
require "yaml"
require "uri"

TOKEN = ENV["TODOIST_TOKEN"]
PROJECT_ID = ENV["TODOIST_PROJECT_ID"]
SECTION_ID = ENV["TODOIST_SECTION_ID"]

abort "Missing TODOIST_TOKEN" unless TOKEN
abort "Missing TODOIST_PROJECT_ID" unless PROJECT_ID
abort "Missing TODOIST_SECTION_ID" unless SECTION_ID

uri = URI("https://api.todoist.com/rest/v2/tasks?project_id=#{PROJECT_ID}&section_id=#{SECTION_ID}")

req = Net::HTTP::Get.new(uri)
req["Authorization"] = "Bearer #{TOKEN}"

res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
  http.request(req)
end

abort "Todoist API error: #{res.code}" unless res.code == "200"

tasks = JSON.parse(res.body)

# Sort by created_at (newest first)
tasks.sort_by! { |t| t["created_at"] }

File.write("_data/todoist.yml", tasks.to_yaml)

puts "Fetched #{tasks.length} tasks"