def palindrome? (string)
	string = string.gsub(/[\W]/,"").downcase
	if string.match(string.reverse)
		return true
	else
		return false
	end
end

def count_words(string)
	hash = Hash.new()
	vetor_palavras = string.gsub(/[\W]/," ").downcase.split
	vetor_palavras.each do |palavra|
		if hash[palavra]==nil
			hash.store(palavra,1)
		else
			hash[palavra]= hash[palavra] + 1
		end
	end
	return hash
end


puts count_words("A man, a plan, a canal -- Panama").inspect
puts count_words("Madam, I'm Adam!").inspect
puts count_words("Abracadabra").inspect