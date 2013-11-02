require 'csv'
require 'json'

def read_csv(content)
    # Dirty hack: all the TPE open data CSV encoded in Big5 instead of UTF-8
    content = content.encode "utf-8", "big5"
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