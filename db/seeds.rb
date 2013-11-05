Category.create(title: "For Sale")
Category.create(title: "Housing")
Category.create(title: "Services")
Category.create(title: "Personals")

Posting.create(title: "NEED: Tape", body: "For my box.", location: "Chinatown", category_id: 1)
Posting.create(title: "Cardboard Box, nearly mint", body: "$1000 OBO", location: "Chinatown", price: 1000, category_id: 2)
Posting.create(title: "Will work for booze", body: "Mmm... booze", location: "Tenderloin", price: 0, category_id: 3)
Posting.create(title: "Zeke:", body: "You owe me money!", location: "Castro", category_id: 4)