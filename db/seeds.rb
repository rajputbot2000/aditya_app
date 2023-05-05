# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Player.create!([{
    name: "Rohit Sharma",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "KL Rahul",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Virat Kohli",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
}, 
{
    name: "Suryakumar Yadav",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)  
},
{
    name: "Hardik Pandya",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Rishabh Pant",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)

},
{
    name: "Ravindra Jadeja",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Bhuvneshwar Kumar",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Mohammad Shami",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Yuzvendra Chahal",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
},
{
    name: "Mohammad Siraj",
    score: "84, 23, 9, 10, 69",
    team: Team.find(2)
}
])



p "Created #{Player.count} players" 

