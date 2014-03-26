task :default => [:build]

task :download do
  system "git submodule update"
end

task :build do
  system "cheatset generate font-awesome-cheatset.rb"
end

task :install do
  system "open 'Font Awesome.docset'"
end
