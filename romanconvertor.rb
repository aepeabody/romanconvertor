
def arabicToRoman
  { 1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
     90 => "XC",
     50 => "L",
     40 => "XL",
     10 => "X",
     9 => "IX",
     5 => "V",
     4 => "IV",
     1 => "I"}
  end

def toRoman(arabicNumber)
  if arabicNumber <= 0 || arabicNumber >= 4000
    raise RangeError
  end
  roman = ""
  arabicToRoman.each do |number, letter|
    roman << letter*(arabicNumber / number)
    arabicNumber = arabicNumber % number
  end
  roman
end


def fromRoman(romanNumber)
  if arabicToRoman.value?(romanNumber[0]) == false
    raise TypeError
  end
  arabic = 0
  arabicToRoman.values.each do |letter|
    while romanNumber.start_with?(letter)
        arabic += arabicToRoman.invert[letter]
        romanNumber = romanNumber.slice(letter.length, romanNumber.length)
      end
    end
  arabic
end
