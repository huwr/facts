class Generator
  @adjectives = ['happy', 'big', 'little', 'small', 'great', '']
  @animals = %w[  dog walrus galah roo wombat koala mouse horse frog hare snake rabbit lizard parrot bird elephant quokka hippo possum emu pademelon ]
  @colours = ['red', 'black', 'purple', 'yellow', 'white', 'green', 'grey', 'brown', 'golden', 'silver', '']

  def self.generate(n)
    names = []
    (0..n).each do
      names << choose(@adjectives) + choose(@colours) + choose(@animals)
    end
    names
  end

  def self.choose(array)
    str = array.sample
    return '' if str == ''

    str[0] = str[0].upcase
    str + ' '
  end
end
