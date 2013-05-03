def palindrome? (string)
	string = tira_nao_letras(string).downcase
	string.eql?(string.reverse)
end

def tira_nao_letras(string)
  string.gsub(/[\W]/,"")
end

def count_words(string)
	num_repeticoes = {}
	para_vetor_palavras_downcase(string).each do |palavra|
		num_repeticoes[palavra]||=0
		num_repeticoes[palavra]= num_repeticoes[palavra] + 1
	end
	return num_repeticoes
end

def para_vetor_palavras_downcase(string)
  string.gsub(/[\W]/," ").downcase.split
end


puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
puts count_words("A man, a plan, a canal -- Panama").inspect
puts count_words("Madam, I'm Adam!").inspect
puts count_words("Abracadabra").inspect