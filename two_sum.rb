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
bad_two_sum?(arr, 6) # => should be true
bad_two_sum?(arr, 10)
