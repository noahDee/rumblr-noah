require 'faker'
# User.delete_all
# Post.delete_all


photos = ["dog", "cat", "bunny", "fox", "koala", "lion", "tiger", "gorilla"]
nums = (2..4).to_a
tags = ["bird", "cow", "horse", "dog", "pig"]

User.create(
  name: Faker::Name.name,
  username: 'whoishe',
  email: 'email@example.com',
  birthdate: Faker::Date.birthday,
  password: "1234",
  photo: photos.sample,
  tags: tags.join(',')
)

20.times do
  Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(6, false, 6),
    # tags: Faker::Lorem.word(6, true).join(","),
    tags: tags.sample,
    user_id: 1
  )
end

4.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    birthdate: Faker::Date.birthday,
    password: "1234",
    photo: photos.sample,
    tags: tags.sample
  )
end




40.times do
  Post.create(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(6, false, 6),
    # tags: Faker::Lorem.word(6, true).join(","),
    tags: tags.sample,
    user_id: nums.sample,
)
end
