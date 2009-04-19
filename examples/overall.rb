require File.join(File.dirname(__FILE__), '..', 'lib', 'octopi')

include Octopi

# user information
user = User.find("fcoury")
puts "#{user.name} is being followed by #{user.followers.join(", ")} and following #{user.following.join(", ")}"

# the bang version of followers and following 
# fetches user object for each user, but is 
# a lot more expensive
user.followers!.each do |u|
  puts "  - #{u.name} (#{u.login}) has #{u.public_repo_count} repo(s)"
end

# search user
users = User.find_all("silva")
puts "#{users.size} users found for 'silva':"
users.each do |u|
  puts "  - #{u.name}"
end

# repository information
repo = Repository.find("fcoury", "octopi")
puts "Repository: #{repo.name} - #{repo.description} (by #{repo.owner}) - #{repo.url}"

# repository search
repos = Repository.find_all("ruby", "git")
puts "#{repos.size} repository(ies) with 'ruby' and 'git':"
repos.each do |r|
  puts "  - #{r.name}"
end

# connect "webbynode", "b759631557bb98fb8d656ba9df5f692f" do |github|
#   puts github.user.name
# end