def first_anagram?(str1, str2)
  generate_anagrams(str1).include?(str2)
end


def generate_anagrams(str)
  return [str] if str.size < 2
  anagrams = []
  letters = str.split('')
  temp_array = letters
  letters.each do |l|
    temp_array = letters - [l]
    generate_anagrams(temp_array.join).each do |remainder|
      anagrams << l + remainder
    end
  end

  anagrams
end

first_anagram?("the", "ehe")


def second_anagram?(str1, str2)
  arr1, arr2 = str1.split(''), str2.split('')

  return false if arr1.size != arr2.size
  arr1.each do |l|
    return false if !arr2.include?(l)
    arr1 - [l]
    arr2 - [l]
  end

  true #if arr1.empty? && arr2.empty?
end

second_anagram?("the", "ethh")

def third_anagram?(str1, str2)
  str1.split('').sort.join == str2.split('').sort.join
end

def fourth_anagram?(str1, str2)
  freq = Hash.new(0)
  str1.split('').each do |l|
    freq[l] += 1
  end
  str2.split('').each do |m|
    freq[m] -= 1
  end

  freq.values.all? { |v| v == 0 }
end
