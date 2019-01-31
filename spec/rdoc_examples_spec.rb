require 'spec_helper'

describe "Readme Rdoc examples" do
  rdoc_examples.each do |example_name, example_info|
    it "should pass the #{example_name} examples from the README" do
      instance_eval(example_info[:code], example_info[:path], example_info[:lineno])
    end
  end
end
