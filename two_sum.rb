def bad_two_sum?(arr, target_sum)
  possibilites = []
  (arr.length-1).times do |idx|
    idy = 1 + idx
    while idy < arr.length
      possibilites << [arr[idx],arr[idy]]
      idy += 1
    end
  end

  possibilites.each do |pair|
    return true if pair.first + pair.last == target_sum
  end
  false
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6)
bad_two_sum?(arr, 10)

# This is o(n^2+n) AKA o(n^2)


def okay_two_sum?(arr, target_sum)
  arr.sort
  arr.each do |el|
      new_target = target_sum - el
      return true unless binary_search((arr - [el]), new_target).nil?
  end
  false
end

def binary_search(arr, target)
  return nil if arr.size == 0
  split = arr.size / 2
  case target <=> arr[split]
  when -1
    binary_search(arr.take(split), target)
  when 0
    arr[split]
  when 1
    result = binary_search(arr.drop(split + 1), target)
    (result.nil?) ? nil : (split + 1) + result
  end
end

def pair_sum?(arr, target_sum)
  # arr.sort
  nums = Hash.new(0)
  arr.each do |el|
    nums[el] += 1
  end

  arr.each do |first|
    new_target = target_sum - first
    nums[first] -= 1
    return true if nums[new_target] > 0
  end

  false
end



arr = [0, 1, 5, 7]
pair_sum?(arr, 6)
pair_sum?(arr, 10)



def four_sum?(arr, target_sum)
  arr.sort
  new_target = 0
  nums = Hash.new(0)
  arr.each do |el|
    nums[el] += 1
  end

  arr.each do |first|
    new_target = target_sum - first
    nums[first] -= 1
  end
  arr.each do |second|
    new_target = new_target - second
    nums[second] -= 1
  end
  arr.each do |third|
    new_target = new_target - third
    nums[third] -= 1
  end
  return true if nums[new_target] > 0
  false
end

arr = [0, 1, 5, 7]
four_sum?(arr, 6)
four_sum?(arr, 13)
