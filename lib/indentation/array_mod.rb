# Monkey patch Array with indentation methods
class Array
  # Appends a given separator(s) to all but the last element in an array of Strings
  # or if performed on an array of arrays, appends the separator element to the end of each array except the last
  def append_separator(*separators)
    len = length
    ret_array = []
    each_with_index do |element, i|
      new_element = element.dup
      unless i == len - 1
        separators.each do |separator|
          new_element << separator
        end
      end
      ret_array << new_element
    end
    ret_array
  end

  # Append the given separator(s) to the current array
  def append_separator!(*separators)
    len = length
    each_with_index do |element, i|
      next if i == len - 1
      separators.each do |separator|
        element << separator
      end
    end
  end
  
  # Return an indented array of strings (or an array of other arrays containing strings)
  # Arguments:
  # * num - How many of the specified indentation to use.
  #         Default for spaces is 2. Default for other is 1.
  #         If set to a negative value, removes that many of the specified indentation character,
  #         tabs, or spaces from the beginning of the string
  # * i_char - Character (or string) to use for indentation
  def indent(num = nil, i_char = ' ')
    collect do |array_element|
      array_element.indent(num, i_char)
    end
  end
  
  # Apply indentation to this array
  # Arguments:
  # * num - How many of the specified indentation to use.
  #         Default for spaces is 2. Default for other is 1.
  #         If set to a negative value, removes that many of the specified indentation character,
  #         tabs, or spaces from the beginning of the string
  # * i_char - Character (or string) to use for indentation
  def indent!(num = nil, i_char = ' ')
    collect! do |array_element|
      array_element.indent!(num, i_char)
    end
  end
  
  # Get the least indentation of all elements
  def find_least_indentation(*args)
    collect{|array_element| array_element.find_least_indentation(*args) }.min
  end
  
  # Find the least indentation of all elements and remove that amount (if any)
  # Can pass an optional modifier that changes the indentation amount removed
  def reset_indentation(modifier = 0)
    indent(-find_least_indentation + modifier)
  end
  
  # Replaces the current array with one that has its indentation reset
  # Can pass an optional modifier that changes the indentation amount removed
  def reset_indentation!(modifier = 0)
    indent!(-find_least_indentation + modifier)
  end
  
  # Join an array of strings using English list punctuation.
  def english_join(conjunction = 'and', separator = ', ', oxford_comma = true)
    len = length
    # Return empty string for empty array
    return '' if len == 0
    # Return only element as string if length is 1
    return self[0].to_s if len == 1
    # Return comma-less conjunction of elements if length is 2
    return "#{self[0]} #{conjunction} #{self[1]}" if len == 2
    # Return comma joined conjunction of elemements
    join_str = ''
    each_with_index{|ele, i|
      str = if !oxford_comma && i == len - 2
          "#{ele} #{conjunction} " # rubocop:disable Layout/IndentationWidth
        elsif i == len - 2
          "#{ele}#{separator}#{conjunction} "
        elsif i == len - 1
          ele.to_s
        else
          "#{ele}#{separator}"
        end
      join_str << str
    }
    join_str
  end
end
