
class Converter

      def num_to_words(number)
      	#read the dictionary file and store it in array
      	dictionary_words = File.read("lib/dictionary.txt").split("\r\n").map(&:downcase)
      	#hash of numbers associate with phone keypad
        keypad = {
          "2" => ['a','b','c'],
          "3" => ['d','e','f'],
          "4" => ['g','h','i'],
          "5" => ['j','k','l'],
          "6" => ['m','n','o'],
          "7" => ['p','q','r','s'],
          "8" => ['t','u','v'],
          "9" => ['w','x','y','z']
        }
        #checks validity of number
        #checks the number is of 10 digits and does not contains 0 or 1
        unless (number.length == 10 && number.match(/^[2-9]*$/))
           raise "The given number is not valid. Please try again"
        end
        # Convert the number into an array
        num_arr = number.split("")
        #convert that array of numbers into a array of characters matching each of the number from keypad list
        key_char = num_arr.collect{|x| keypad[x]}
        # take all possible combinations of the words on the keys. 
        # product of each key's characters with all other key's characters
        words = key_char.shift.product(*key_char).collect(&:join)
        #search all possible combinations against dictionary
        final_words = []
        # loop to get all combinations of words (Minimum word length 3)
        i = 2
        while i < 7 do
      		a = words.collect{|x| x[0..i]}.uniq
      		b = words.collect{|y| y[i+1..-1]}.uniq

          # get all matching words from dictionary
      		res_one = dictionary_words & a
      		res_two = dictionary_words & b

         # combining the result arrays
      		merge_res = res_one.product(res_two)
      		final_words << merge_res unless merge_res.empty?
      		i += 1
    	end

    	#get exact matches
        exact_matches = dictionary_words & words
        final_words << exact_matches

        p final_words.flatten(1)
      end

end

 unless ENV["CONVERTER_ENV"] == "test"
 	puts "Please enter a 10 digit phone number(it should not contain 0 or 1)"
 	val = STDIN.gets.chomp
 	num = Converter.new 
 	num.num_to_words(val)
 end