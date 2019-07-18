#!/usr/bin/ruby
require "fileutils"

puts "Enter in a project:"

project = gets.chomp

FileUtils.cd('../')
FileUtils.mkdir("#{project}")
FileUtils.mkdir("#{project}/lib")
FileUtils.mkdir("#{project}/spec")
FileUtils.cd("#{project}")
FileUtils.touch("lib/#{project}.rb")
FileUtils.touch("spec/#{project}_spec.rb")
FileUtils.touch("Gemfile")
File.write("lib/#{project}.rb", "require 'pry'

Class Blank
  def initialize
  end
end")
File.write("Gemfile", "source 'https://rubygems.org'
gem 'pivotal_git_scripts'
gem 'rspec'
gem 'pry'")

File.write("spec/#{project}_spec.rb", "require 'rspec'
require 'Blank'

describe('#Blank')
  it('rocks') do
     something()
  expect(words()).to(eq(something))
 end
end")
