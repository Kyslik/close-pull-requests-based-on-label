require 'octokit'

repo = ENV["GITHUB_REPOSITORY"]
label = ENV["LABEL"]

client = Octokit::Client.new(:access_token => ENV["GITHUB_TOKEN"])
client.auto_paginate = true

open_pull_requests = client.pull_requests(repo, {:state => 'open'})

open_pull_requests.each do |pull_request|
  if pull_request.labels.any? {|l| l.name == label }
    client.close_pull_request(repo, pull_request.number)
  end
end
