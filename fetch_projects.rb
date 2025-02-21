require 'uri'
require 'net/http'
require 'json'

PER_PAGE = 100

page = 1
repos = []
repo_page = nil
while repo_page.nil? or repo_page.length() == PER_PAGE
  response = Net::HTTP.get URI("https://api.github.com/users/BenjaminHinchliff/repos?type=owner&sort=pushed&per_page=#{PER_PAGE}&page=#{page}")

  repo_page = JSON.parse(response)

  repos.push(*repo_page)
  page += 1
end

File.open("_data/projects.json", "w") do |f|
  f.write(JSON.pretty_generate(repos))
end
