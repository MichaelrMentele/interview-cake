def word_cloud(str)
    words = str.split.map { |word| strip_punctuation(word.downcase) }

    freq = {}
    words.each do |w|
       freq[w] ? freq[w] += 1 : freq[w] = 1
    end
    freq
end

def strip_punctuation(str)
   str.gsub(/[^a-zA-Z\s]/, "")
end

puts word_cloud "We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake."
puts word_cloud "The bill came to five dollars."

class WordCloudData
  attr_accessor :words_to_counts

  def initialize(str)
    @words_to_counts = {}
    self.populate_words_to_counts(str)
  end

  def populate_words_to_counts(str)
    current_word = ""
    (0...input_string.length).each do |i|
      char = input_string[i]

      # at end of string add the last word
      if i == str.length - 1
        current_word += character if self.is_letter(char)
        self.add_word_to_hash(current_word) if !current_word.empty?
      # if at a space or emdash we know we are at the end
      # of a word so add it to our hash and reset our current word
      elsif char == " " || char == "\u2014"
        self.add_word_to_hash(current_word) if !current_word.empty?
        current_word = ''
      # make sure to split on ellipses
      elsif char == '.'
        if i < str.length - 1 && str[i+1] == '.'
          self.add_word_to_hash(current_word) if !current_word.empty?
          current_word = ''
        end
      # if the character is a letter or an apostrophe add to our current word
      elsif self.is_letter(char) || char == '\''
        current_word += char
      # if the char is a hyphen we check if it's surrounded by letters
      # if so, add to our current word
      elsif char == '-'
        if i > 0 && self.is_letter(str[i-1]) && self.is_letter(str[i+1])
          current_word += char
        end
      end
    end
  end

  def add_word_to_hash(word)
    # if already in hash increment count
    if words_to_counts.include? word
      words_to_counts[word] += 1

    # if lowercase is in hash our word must be uppercase
    # we only include uppercase if they're always uppercase
    # so we just increment the lowercse version's count
    elsif words_to_counts.include? word.downcase
      words_to_counts[word.downcase] += 1

    # if an uppercase version is in the hash we know our
    # input word must be lowercase since we only include
    # uppercase words if they're always uppercase
    elsif words_to_counts.include? word.capitalize
      words_to_counts[word] = 1
      words_to_counts[word] += words_to_counts[word.capitalize]
      words_to_counts.delete[word.capitalize]

    else
      words_to_counts[word] = 1
    end
  end

  def is_letter(char)
    return ("a".."Z").include? char
  end
end

# Bonus - Answer and think through these
# This is really a question of what do we consider to be a word?
# If there are more characters in cahracter sets that are words
# let's whitelist words
