# Write a program that, given a filename, returns the number of times the word “Thrillist” appears in the named file.  

# puts __FILE__


def countWord(filename, targetWord)
  wordCount = 0
  File.open(filename).readlines.each do |line|
    line.scan(/(?=#{targetWord})/) { wordCount += 1}
  end
  puts "The word '#{targetWord}' appears #{wordCount} times."
  
  wordCount
end


def numWords(word, filename)
  word_count = 0
  File.open(filename).readlines.each do |line|
    line.scan(/(?=#{word})/) { word_count += 1 }
    
  end
  
  word_count
end

countWord("dictionary.txt", "Thrillist")







# IO.read(File.join(File.dirname(__FILE__)))























