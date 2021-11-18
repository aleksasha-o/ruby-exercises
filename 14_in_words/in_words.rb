require 'to_words'

class Integer
  NUMBERS = {1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine",
             10=>"ten",11=>"eleven",12=>"twelve",13=>"thirteen",14=>"fourteen",15=>"fifteen",16=>"sixteen",
             17=>"seventeen", 18=>"eighteen",19=>"nineteen",
             20=>"twenty",30=>"thirty",40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",80=>"eighty",90=>"ninety"}
  SCALE = {2 =>"thousand",3=>"million",4=>"billion", 5=>"trillion"}

  def in_words
    num = self
    if num == 0
      "zero"
    else
    str_num = num.to_s
    numbers = Hash.new
    key_count = 0

      while str_num != ""
        key_count += 1
        numbers[key_count] = str_num.slice!(/.{1,3}$/)
      end

    numbers = numbers.to_a.reverse.to_h

    str = ""
      numbers.each_pair do |key, value|
        hundreds = value.to_i / 100
        tens = value.to_i % 100
        hundreds == 0 ? str << "#{tens_calculate(tens)} #{key_check(key, value)} " : str << "#{NUMBERS[hundreds]} hundred #{tens_calculate(tens)} #{key_check(key, value)} "
      end
    str.squeeze!(" ").chomp!(" ")
    end
    end

  def key_check(key, value)
    SCALE[key] if SCALE.has_key?(key) && (/[1-9]/).match?(value)
  end

    def tens_calculate(num)
        units = num % 10
        tens = num % 100
        if NUMBERS.has_key?(tens)
        "#{NUMBERS[tens]}"
        else
          tens = num - units
          "#{NUMBERS[tens]} #{NUMBERS[units]}"
        end
      end
end