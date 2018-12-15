require 'faker'
User.delete_all
Post.delete_all


photos = ["dog", "cat", "bunny", "fox", "koala", "lion", "tiger", "gorilla"]
nums = (1..100).to_a


100.times do
  User.create(
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    birthdate: Faker::Date.birthday,
    password: "1234",
    photo: photos.sample,
    tags: Faker::Lorem.words(6, true).join(",")
  )
end

1000.times do
  Post.create(
    title: Faker::Lorem.sentence(4, true, 4),
    content: Faker::Lorem.paragraph(6, false, 6),
    tags: Faker::Lorem.word(6, true).join(","),
    user: nums.sample,
)
end
