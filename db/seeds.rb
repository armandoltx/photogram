10.times do |pic|
  Pic.create!(
    title: "Image Title n #{pic}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor.",
    image: "https://www.fillmurray.com/500/500"
  )
end

puts "Pics created"