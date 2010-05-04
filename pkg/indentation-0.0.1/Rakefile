require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/indentation'

Hoe.plugin :newgem
# Hoe.plugin :website
Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'indentation' do
  self.developer 'Samuel Dana', 's.dana@prometheuscomputing.com'
  self.post_install_message = File.read(File.join(File.dirname(__FILE__),'PostInstall.txt'))
  self.rubyforge_name       = self.name # TODO this is default value
  # self.extra_deps         = [['activesupport','>= 2.0.2']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]

# Add rvm gem install tasks
desc 'Install the package as a gem for rvm (no sudo), without generating documentation(ri/rdoc)'
task :rvm_install_gem_no_doc => [:clean, :package] do
  sh "gem install pkg/*.gem --no-rdoc --no-ri"
end

desc 'Shortcut to rvm_install_gem_no_doc task'
task :rig => [:rvm_install_gem_no_doc] do
end

desc 'Install the package as a gem for rvm (no sudo)'
task :rvm_install_gem => [:clean, :package] do
  sh "gem install pkg/*.gem"
end