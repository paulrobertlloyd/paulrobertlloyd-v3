#
# A plugin for Jekyll that converts numbers into Roman numerals
# 
# USAGE
# <h1>{% page.date | date: "%Y" | roman %}</h1>
#

module Jekyll
  module RomanNumeralFilter # TODO: Make this work better, i.e. 2014 => MMXIV
    def roman(input)
      number = input.chomp.to_i

      def convert_to_roman number
        romans_array = [[1000,'M'],[500,'D'],[100,'C'],[50,'L'],[10,'X'],[5,'V'],[1,'I']]
        converted_array = []

        romans_array.each do |rom_num|
          num = rom_num[0]
          letter = rom_num[1]

          if number > num
            times = number / num
            roman_letter = letter*times
            converted_array.push(roman_letter)
            number = number % num
          end
        end
        converted_array.join()
      end

      while number != 0
        roman_number = convert_to_roman number
        return roman_number
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::RomanNumeralFilter)
