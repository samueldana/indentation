require 'indentation/string_mod.rb'
require 'indentation/array_mod.rb'

# Helpers for String and Array indentation methods
module Indentation
  # Parse legacy options for #find_least_indentation into new options format
  def self.parse_legacy_find_least_indentation_options!(options)
    legacy_ignore_blank = options.delete(:ignore_blank_lines)
    legacy_ignore_empty = options.delete(:ignore_empty_lines)
        
    unless legacy_ignore_empty.nil?
      warn "[DEPRECATED] Please use :include_whitespace_only_lines instead of :ignore_empty_lines option for String#find_least_indentation"
      options[:include_whitespace_only_lines] = !legacy_ignore_empty
      # old behavior was to never include blank lines if whitespace lines were not included
      options[:include_blank_lines] = options[:include_whitespace_only_lines]
    end
    unless legacy_ignore_blank.nil? # rubocop:disable Style/GuardClause
      warn "[DEPRECATED] Please use :include_blank_lines instead of :ignore_blank_lines option for String#find_least_indentation"
      options[:include_blank_lines] = !legacy_ignore_blank
      # old behavior was to also include whitespace only lines if including blank lines, unless otherwise specified
      options[:include_whitespace_only_lines] = true if options[:include_whitespace_only_lines].nil? && options[:include_blank_lines]
    end
  end
end
