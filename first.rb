def caesarCipher(string, shift)
	output = []
	letters = string.chars
	letters.each do |l|
		if l.ord.between?(65,90)
			if l.ord >= (90 - shift + 1)
				output << (l.ord - 26 + shift).chr
			else
				output << (l.ord + shift).chr
			end
		elsif l.ord.between?(97,122)
			if l.ord >= (122 - shift + 1)
				output << (l.ord - 26 + shift).chr
			else
				output << (l.ord + shift).chr
			end
		else
			output << l
		end
	end
	puts output.join
end

caesarCipher("The quick brown fox jumped over the lazy dog", 3)