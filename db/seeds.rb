# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
kit = Kit.find_or_create_by_slug("tic-tac-toe")
kit.update_attributes(
  name: "Tic-Tac-Toe",
  slug: "tic-tac-toe",
  description: "Welcome to the Tic-Tac-Toe Kit by Hopscotch. We'll teach you step-by-step how to make your own Tic-Tac-Toe game you can play with your friends online. Afterwards you can share it with the world to show everyone what an awesome computer programmer you are."
)
Step.create({
  position: 1, description: "make the background yellow.",
  success_message: "good job! That's a yellow background", kit: kit,
  spec: '-> $("body").css("background-color") == "rgb(255, 255, 0)"'
})
Step.create({
  position: 2, description: "make the background blue.",
  success_message: "good job! That's a blue background", kit: kit,
  spec: '-> $("body").css("background-color") == "rgb(0, 0, 255)"'
})

Program.create(name: 'samantha', kit: kit)
