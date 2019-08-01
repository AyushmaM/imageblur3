class Image

  attr_accessor :image

  def initialize(pixel)
    @image = pixel
  end

  def output_image
    @image.each do |num|
      puts num.join
    end
  end

  

  def find_1!
    ones = []
    @image.each_with_index do |arr, row_index|

      arr.each_with_index do |element, column_index|
        ones << [row_index, column_index] if element == 1
        
      end
    end
    #puts ones.inspect

    ones.each do |blur|
     x = blur[0]
    y = blur[1]

     @image[x][y + 1] = 1 if y + 1 <= @image[x].count - 1
     @image[x][y - 1] = 1 if y - 1 >= 0
     @image[x + 1][y] = 1 if x + 1 <= @image.count - 1
     @image[x - 1][y] = 1 if x - 1 >= 0

    end

  end

  def blur3!(distance=2)
    distance.times do
      find_1!
    end
  end

  
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]
])


#image.find_1!
image.blur3!
image.output_image

