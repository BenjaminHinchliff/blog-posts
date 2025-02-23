require 'uri'
require 'net/http'
require 'json'

module ProjectsPage
  class GithubRepoGenerator < Jekyll::Generator
    PER_PAGE = 100
    CACHE_FILE = File.join(Dir.pwd, ".cache",  "github_repo_cache.json") 
    CACHE_TTL = 3600

    def fetch_repos()
      if File.exist?(CACHE_FILE) && (Time.now - File.mtime(CACHE_FILE) < CACHE_TTL)
        Jekyll.logger.info "GitHubRepoGenerator:", "Using cached data from #{CACHE_FILE}"
        begin
          return JSON.parse(File.read(CACHE_FILE))
        rescue JSON::ParserError => e
          Jekyll.logger.warn "GitHubRepoGenerator:", "Cache file corrupted: #{e.message}. Refreshing..."
        end
      end

      # Cache miss or expired, fetch data from GitHub
      page = 1
      repos = []
      repo_page = nil

      while repo_page.nil? || repo_page.length == PER_PAGE
        # ... (rest of the API fetching code is the same as before)
         url = URI("https://api.github.com/users/BenjaminHinchliff/repos?type=owner&sort=pushed&per_page=#{PER_PAGE}&page=#{page}")
        response = Net::HTTP.get(url)

        begin
          repo_page = JSON.parse(response)
        rescue JSON::ParserError => e
          Jekyll.logger.error "GitHubRepoGenerator:", "Error parsing JSON response: #{e.message}"
          return # Stop processing if JSON parsing fails
        end

        repos.push(*repo_page)
        page += 1
      end
    end

    def generate(site)
      repos = fetch_repos()

      projects = site.pages.find { |page| page.name == 'projects.html'}

      projects.data['projects'] = repos

      # Write to cache
      begin
        FileUtils.mkdir_p(File.dirname(CACHE_FILE)) # Create cache directory if needed
        File.open(CACHE_FILE, 'w') do |f|
          f.write(JSON.pretty_generate(repos))
        end
        site.data['projects'] = repos # Update site data even when caching
      rescue IOError => e
        Jekyll.logger.error "GitHubRepoGenerator:", "Error writing cache or data file: #{e.message}"
      end
    end
  end
end
