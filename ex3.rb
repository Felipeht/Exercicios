def combine_anagrams(words)
	all_anagrams = Array.new()
	diff_sorted_words = Array.new()
	words.each do |palavra|
		sorted_word = palavra.downcase.each_char.to_a.sort
		if diff_sorted_words.include?(sorted_word)
			all_anagrams[diff_sorted_words.index(sorted_word)].push(palavra)
		else
			diff_sorted_words.push(sorted_word)
			all_anagrams.push(palavra.to_a)
		end
	end
	all_anagrams.each  {|a| puts a; puts ""}
	return all_anagrams
end


input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams',
'scream']
combine_anagrams(input)