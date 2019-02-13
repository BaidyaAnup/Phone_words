class Converter
      def num_to_words(number)
      	#read the dictionary file and store it in array
      	dictionary_words = File.read("dictionary.txt").split("\n").map(&:downcase)
      	#hash of numbers associate with phone keypad
        @keypad = {
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
        key_char = num_arr.map{|x| @keypad[x]}

        #print key_char
      end

end
num = Converter.new
puts num.num_to_words("9999999994")