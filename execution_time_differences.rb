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

def largest_contiguous_subsum(list)
  largest_sum = list.first
  start = 0
  list.count.times do |i|
    largest_sum = list[start..i].inject(:+) if list[start..i].inject(:+) > largest_sum
    if list[i] > list[start..i].inject(:+)
      start = i
      largest_sum = list[i]
    end
  end

  largest_sum
end

def largest_contiguous_subsum(list)
  largest_sum = list.first
  curr_sum = list.first
  start = 0
  list.each do |el|
    curr_sum += el
    largest_sum = curr_sum if curr_sum > largest_sum
    curr_sum = 0 if curr_sum < 0
    #largest_sum, curr_sum = el, el if el > largest_sum
  end

  largest_sum
end
