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

def largest_contiguous_subsum(list)
  sub_arrays = []
  list.count.times do |idx1|
    list.count.times do |idx2|
      sub_arrays << list[idx1..idx2] if idx1 <= idx2
    end
  end
  largest_sum = sub_arrays.first.inject(:+)
  sub_arrays.each do |arr|
    largest_sum = arr.inject(:+) if arr.inject(:+) > largest_sum
  end

  largest_sum
end
