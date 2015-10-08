def windowed_max_range(arr, w)
  current_max = 0
  i = 0
  while i+w <= arr.length
    window = arr[i...(i+w)].sort
    right, left = window.last, window.first
    sum = (right - left)
    current_max = sum if sum > current_max
    i += 1
  end
  current_max
end

windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class
