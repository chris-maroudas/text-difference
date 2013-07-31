



numbers = (1..100).to_a


numbers.each do |num|

	printable = ''
	if num % 3 == 0
		printable << "Fiz"
	end

	if num % 5 == 0
		printable << "Buzz"
	end

	if printable.empty?
		puts num
	else
		puts printable
	end

end


class Person

	def initialize name, surname, email
		@name = name
		@surname = surname
		@email = email
	end


end