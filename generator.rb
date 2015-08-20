class Generator
  @adjectives = ['happy', 'big', 'little', 'small', 'great', '']
  @animals = %w[  dog walrus galah roo wombat koala mouse horse frog hare rabbit lizard  ]
  @colours = ['red', 'black', 'purple', 'yellow', 'white', 'green', '']

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
