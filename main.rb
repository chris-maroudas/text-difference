class TextDifferenceFinder

	attr_accessor :first_file, :second_file, :first_file_contents, :second_file_contents

	def initialize first_file = nil, second_file = nil
		@first_file           = first_file
		@second_file          = second_file
		@first_file_contents  = []
		@second_file_contents = []
	end

	def ask_for_files
		puts "Enter the first filename: "
		file_name       = gets.chomp.downcase.strip
		self.first_file = file_name << ".txt"  # call first_file= method
		open_file_and_get_contents(first_file)

		puts "Enter the second filename: "
		file_name        = gets.chomp.downcase.strip
		self.second_file = file_name << ".txt" # call second_file= method
		open_file_and_get_contents(second_file)
	end

	def find_difference_by_letter
		# @b.split(//) - @a.split(//)
	end

	def find_difference_by_word
		puts "\nThe #{second_file} when compared to #{first_file} has:\n"
		num = 0
		first_file_contents.each do |line_text|
			differences = line_text.split - second_file_contents[num].split
			num         += 1

			unless differences.empty?
				puts "Difference at line: #{num}"
				differences.each { |difference| puts "\"#{difference}\"" }
			end
		end


		puts "---------------------------------------"

		puts "The #{first_file} when compared to #{second_file} has:\n"
		num = 0
		second_file_contents.each do |line_text|
			differences = line_text.split - first_file_contents[num].split
			num         += 1

			unless differences.empty?
				puts "Difference at line: #{num}"
				differences.each { |difference| puts "\"#{difference}\"" }
			end
		end

	end

	private

	def open_file_and_get_contents file_name
		text = File.open(file_name).read
		text.each_line do |line|  # Push contents to the appropriate array
			self.first_file_contents << "#{line}".gsub(".","") if file_name == first_file
			self.second_file_contents << "#{line}".gsub(".", "") if file_name == second_file
		end

	end

end

diff_finder = TextDifferenceFinder.new
diff_finder.ask_for_files
diff_finder.find_difference_by_word

