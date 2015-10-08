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
