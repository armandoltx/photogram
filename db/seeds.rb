User.create!(
                  name: 'Admin',
                  email: "test@t.com",
                  password: 123456,
                  password_confirmation: 123456
                )
puts "1 Admin user created"

User.create!(
                  name: 'Armando',
                  email: "armando@t.com",
                  password: 123456,
                  password_confirmation: 123456
                )
puts "1 regular user created"

5.times do |pic|
  Pic.create!(
    title: "Image Title n #{pic} Admin",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor.",
    image: "https://www.fillmurray.com/500/500",
    user_id: 1
  )
end

puts "Pics created for Admin"

5.times do |pic|
  Pic.create!(
    title: "Image Title n #{pic} Armando",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sagittis lacus eu erat malesuada pretium quis vel nisl. Nunc lobortis dui sit amet ipsum ultrices viverra. Morbi laoreet, est et venenatis vestibulum, nibh mauris mattis lacus, ac tincidunt purus neque a nisi. Nulla malesuada porttitor malesuada. Nam id odio in dolor sollicitudin tempor.",
    image: "https://www.fillmurray.com/500/500",
    user_id: 2
  )
end

puts "Pics created for Armando"