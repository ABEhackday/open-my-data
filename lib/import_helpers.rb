require 'csv'
require 'json'

def read_csv(content)
    content.force_encoding 'utf-8'
    list = CSV.parse content
    fields = list[0]
    result = []
    list[1..-1].each do |e|
        item = {}
        fields.length.times do |i|
            item[fields[i]] = e[i]
        end
        result << item
    end
    return result
end