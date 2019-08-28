require 'csv'

table = CSV.read("test.csv", headers: true)

CSV::Converters[:boolean] = ->(value) { value.downcase.to_s == "true" rescue value }

table = CSV.parse("1,true\n2,false\n3,false", converters: :boolean)

puts table[1][1].class

CSV.open('tester.csv', "wb") { |csv| csv << [1,"yes","yes"]; csv << [2,"no","no"] }
