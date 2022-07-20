require "benchmark"
require 'mini_magick'
require "image_processing/vips"
require "benchmark/memory"

loop_times = 1

puts "benchmark bm"
puts "==============================================================================="
Benchmark.bm do |bm|
  bm.report('mini_magick') do
    loop_times.times do |index|
      image = MiniMagick::Image.open('image_1.jpg')
      image.crop('1000x1000+0+0')
    end
  end

  bm.report('image_processing/vips') do
    loop_times.times do |index|
      image = ImageProcessing::Vips.source('image_1.jpg').crop(0, 0, 1000, 1000).call
    end
  end
end

puts "\n"
puts "benchmark memory"
puts "==============================================================================="
Benchmark.memory do |x|
  x.report("mini_magick") do
    loop_times.times do |index|
      image = MiniMagick::Image.open('image_1.jpg')
      crop_image = image.crop('1000x1000+0+0')
    end
  end

  x.report("image_processing/vips") do
    loop_times.times do |index|
      ImageProcessing::Vips.source('image_1.jpg').crop(0, 0, 1000, 1000).call
    end
  end

  x.compare!
end