require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)

  holiday_hash[:winter].each do |key, value|
    if(key.to_s == "christmas" || key.to_s == "new_years")
      holiday_hash[:winter][key] << supply
    end
  end


end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring].each do |key, value|
    holiday_hash[:spring][key] << supply
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # given that holiday_hash looks like this:
  # hash = {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  values = holiday_hash[:winter].values
  return values.flatten
  # return an array of all of the supplies that are used in the winter season

end

# iterate through holiday_hash and print items such that your readout resembles:
# Winter:
#   Christmas: Lights, Wreath
#   New Years: Party Hats
# Summer:
#   Fourth Of July: Fireworks, BBQ
# etc.

def all_supplies_in_holidays(holiday_hash)

  holiday_hash.each do |key, value|
    puts "#{symbolToString(key.to_s)}:"
    holiday_hash[key].each do |attribute, attrVal|
      attrString = symbolToString(attribute.to_s) #to format for the symbols
      puts "  #{attrString}: #{arrayToString(holiday_hash[key][attribute].flatten)}"
    end
  end
end

# def formatted_all_supplies_in_holidays(holiday_hash)
#
#   stringToPrint = ""
#
#   holiday_hash.each do |key, value|
#     keyString = symbolToString(key.to_s) + ":"
#     stringToPrint += "#{keyString}\n"
#     holiday_hash[key].each do |attribute, attrVal|
#       attrString = symbolToString(attribute.to_s) #to format for the symbols
#       stringToPrint << "  #{attrString}: #{arrayToString(holiday_hash[key][attribute].flatten)}\n"
#     end
#   end
#   puts stringToPrint
# end

def arrayToString(arr)
  return arr.collect {|v| capitalizeString(v)}.join(", ") #"Hello, Party Hats"
end

def symbolToString(symb)
  return capitalizeString((symb.to_s).split("_").join(" "))
end

def capitalizeString(str)
    arr = str.split().each do |value|
    if(value.downcase != "bbq") then
      value.capitalize!
    else
      value.upcase!
    end
  end

  arr.join(" ")
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  arr = []

  holiday_hash.each do |key, value|
    holiday_hash[key].each do |attribute, values|
      if(holiday_hash[key][attribute].include?("BBQ"))
        arr << attribute
      end
    end
  end

  return arr

end
