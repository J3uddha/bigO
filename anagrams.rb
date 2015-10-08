def first_anagram?(str)
  return str if str.size < 2
  anagrams = []
  letters = str.split('')
  temp_array = letters
  letters.each do |l|
    temp_array = letters - [l]
    first_anagram?(temp_array.join).split('').each do |remainder|
      anagrams << l + remainder
    end
  end

  anagrams
end

first_anagram?("the")
