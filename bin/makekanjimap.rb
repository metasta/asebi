uni2cid = Hash[*(open(ARGV[0]).read).split("\n").map{|e|e.split(" ")}.flatten]
mj2glyph = Hash[*(open(ARGV[1]).read).split("\n").map{|e|e.split(" ")}.flatten]

array = []
while line = STDIN.gets
  next if /^#/ =~ line
  char, mj = line.split(" ")
  begin
    array.push uni2cid[char.unpack('U')[0].to_s] + "\t" + mj2glyph[mj]
  rescue
    warn line
  end
end

puts "mergeFonts"
puts array.sort {|x, y| x.split("\t")[0].to_i <=> y.split("\t")[0].to_i}
