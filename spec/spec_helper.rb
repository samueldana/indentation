require 'rspec'
require 'rspec-benchmark'
# Enable old syntax for Rspec 3.0
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.include RSpec::Benchmark::Matchers
end
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
end
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')
require 'indentation'

# Finds code examples in README.rdoc and executes them to ensure accuracy of docs.
# This method looks for the '===' headers under the '== Examples:' header, and then
# executes a comparison for any lines terminated with the comment, "# == X" where
# X is the expected value.
def rdoc_examples(examples_header = /^Examples:/i)
  readme_rdoc_filename = 'README.rdoc'
  readme_rdoc = File.join(File.dirname(__FILE__), '..', readme_rdoc_filename)
  rdoc_content = File.read(readme_rdoc)
  all_lines = rdoc_content.split("\n")
  example_content = rdoc_content.split(/^== /).select{|p| p =~ examples_header}.first
  raise "Couldn't find Examples header matching: #{examples_header}" unless example_content
  example_sections = example_content.split(/^=== /)
  examples = {}
  # Skipping first example section since it is "Examples:\n"
  example_sections[1..-1].each do |section|
    lines = section.split("\n")
    # Get starting line number for this section by adding 1 to the line's index
    start_line = all_lines.index{|l| l.match?(/=== #{lines.first}/)} + 1
    example_name = lines.shift.delete(':')
    example_code = make_executable_examples_from_section(lines)
    examples[example_name.to_sym] = {:code => example_code.join("\n"), :path => readme_rdoc_filename, :lineno => start_line}
  end
  examples
end

# Given an example section, derive RSpec expectation tests and return as an array
def make_executable_examples_from_section(section_lines)
  example_code = []
  section_lines.each do |line|
    next if line.strip.empty?
    if line.match?(/ # == /)
      rtest, check = line.split(/ # == /)
      line = "expect(#{rtest}).to eq(#{check})"
    end
    example_code << line
  end
end

# Make a array with the given length with random strings of the given length.
def random_string_array(array_length, string_length)
  str_array = []
  char_map = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
  array_length.times do
    str_array << (0..string_length).map{ char_map[rand(char_map.length)] }.join
  end
  str_array
end

def time
  t = Time.now
  yield
  Time.now - t
end
