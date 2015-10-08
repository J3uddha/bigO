def my_min(array)
  array.each do |first|
    smallest = true
    array.each do |second|
        smallest = false if first > second
    end
    return first if smallest
  end
  
  nil
end


def my_min(array)
  smallest = array.first
  array.each do |el|
    smallest = el if el < smallest
  end
  smallest
end
