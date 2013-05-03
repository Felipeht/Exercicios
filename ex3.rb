def combine_anagrams(words)
	all_anagrams = {}
	words.each do |palavra|
		sorted_word = para_vetor_chars_ordenado_downcase(palavra)
		all_anagrams[sorted_word] ||= []
		all_anagrams[sorted_word].push(palavra)
	end
	return all_anagrams.each_value.to_a
end

def para_vetor_chars_ordenado_downcase(string)
	string.downcase.each_char.to_a.sort
end

input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams',
'scream']
puts combine_anagrams(input).inspect