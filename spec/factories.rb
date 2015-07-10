FactoryGirl.define do
  factory :skill do
    name 'ruby'
    description 'Ruby is my favorite language.'
  end

  factory :project do
    name 'Poker'
    description "Texas Hold'em game made with Ruby/Sinatra/ActiveRecord"
    github_url "https://github.com/bencornelis/poker"
  end

  factory :user do
    name 'bob'
    email 'bob@example.com'
    password 12345678
  end

  factory :admin, class: User do
    name 'ben'
    email 'ben@gmail.com'
    password 'password'
    admin true
  end

  factory :post do
    title 'epicodus'
    content 'it was great!'
  end

  factory :comment do
    text 'cool!'
  end
end
