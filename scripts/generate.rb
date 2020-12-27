singular = ARGV.shift
plural = ARGV.shift
capital_singular = singular.capitalize
capital_plural = plural.capitalize

fields = ARGV.map do |field|
  field.split(":")
end

puts fields[0][0]
puts fields[1]
puts fields[2]
