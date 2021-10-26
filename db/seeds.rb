# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              { id: 1, username: 'Vicky', password: 'vicky123' },
              { id: 2, username: 'David', password: 'david123' },
              { id: 3, username: 'Henok', password: 'henok123' }
            ])

Chatroom.create([
                  { id: 1, name: 'Engineers' },
                  { id: 2, name: 'Ruby on Rails' },
                  { id: 3, name: 'JavaScript' }
                ])

Message.create([
                 { content: 'Hi, how are you today, guys?', user_id: 1, chatroom_id: 1 },
                 { content: 'Hi, Vicky. Fine. How about you?', user_id: 2, chatroom_id: 1 },
                 { content: 'Hi, Vicky and David. I am great.', user_id: 3, chatroom_id: 1 },
                 { content: 'Can we talk about our project with Ruby on Rails?', user_id: 3, chatroom_id: 2 },
                 { content: 'Sure, Henok.', user_id: 2, chatroom_id: 2 },
                 { content: 'Why not? What can we discuss first?', user_id: 1, chatroom_id: 2 },
                 { content: 'Hi, I have an issue on my JavaScript project.', user_id: 2, chatroom_id: 3 },
                 { content: 'Hi David. What happened?', user_id: 3, chatroom_id: 3 },
                 { content: 'Hi Guys. How is the issue going?', user_id: 1, chatroom_id: 3 }
               ])
