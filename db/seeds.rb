# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "felixwor@aol.com", password: "12345678")
Project.create(user: User.last, title: "Project 1")
ProjectChat.create(project: Project.last)
Message.create(project_chat: ProjectChat.last, user: User.last, content: "This is my first message")
