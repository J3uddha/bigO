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
