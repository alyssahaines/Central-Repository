

puts "Welcome to The Game Of Set! How many players do you have?\n"
players = gets.chomp
playerToInt = players.to_i
playersArray = Array.new(playerToInt)
#determines players name and inserts them into array
for i in 1..playerToInt
	puts "Enter player #{i}!\n"
	name = gets.chomp
	puts "Welcome, #{name}!\n"
	playersArray.insert((i-1),name)
puts "\n"
end 

#card features arrays
shapeArray = ["diamond", "squiggle", "oval"]
numberShapeArray = ["one", "two","three"]
shadingArray = ["solid", "striped", "open"]
colorArray = ["red", "green", "purple"]

#rule descriptions
puts "enter 1 to read rules:\n"
gets.chomp
puts "\n"
puts "Each player will be given a description of 12 different cards. After being dealt the cards, your job is to enter a 3 number combination (ex. 1 2 3, 5 10 11 : note exactly one space in between entries) that has exacty one matching attribute set with the rest different OR a 3 number combination of completely unique cards. If you feel no cards match that description, enter 0 and your turn will be given to the next player:\n"
puts "Whoever gets to 3 sets first wins the game!\n"
puts "\n" 

puts "enter 1 to start game!:\n"
gets.chomp

#arrays/variables used in card dealing
cards = Array.new(13)
input = Array.new(3)
active = true
j = 0

scoreArray = Array.new(playerToInt)
#initializes each players score to 0
for i in 0..playerToInt - 1
scoreArray[i] = 0
end

#will loop until active = false or a players score is 3 
while active
puts "\n"
puts "Welcome, #{playersArray[j]} to your turn! Here are your cards:\n"
#4 rand method calls will be used to determine features each card and they will be stored in cards array
for i in 0..11
random = rand(0..2)
random1 = rand(0..2)
random2 = rand(0..2)
random3 = rand(0..2)
puts "#{i+1}. #{shapeArray[random]} , #{numberShapeArray[random1]} , #{shadingArray[random2]} , #{colorArray[random3]} \n"
cardID = random.to_s << random1.to_s << random2.to_s << random3.to_s
cards[i+1] = cardID
end
puts "\n"
puts "Enter 3 numbers of the winning (one space inbetween each number in ascending order EX. 1 2 3) set OR 0 to give up your turn:\n"
response = gets.chomp
index = 0

#determines if user input is valid match
if response != "0"
input = response.split(' ')
int1 = Integer(input[0],10)
int2 = Integer(input[1],10)
int3 = Integer(input[2],10)
firstCard = cards[int1]
secondCard = cards[int2]
thirdCard = cards[int3]
match = true
x=0
for i in 0..3
if match
#if matching set of one feature is found, need to check that the rest are different
 if  firstCard[i] == secondCard[i] && secondCard[i] == thirdCard[i]
	for j in 0..3
	if i != j && firstCard[j] == secondCard[j] && secondCard[j] == thirdCard[j]
	#user input is invalid if two sets of features are the same	
	match  = false
	end
	end

elsif firstCard[i] == secondCard[i] && secondCard[i] != thirdCard[i] || firstCard[i] == thirdCard[i] && secondCard != thirdCard 
match = false
end
end

#a match is made if all cards are unique
if firstCard[i] != secondCard[i] && secondCard[i] != thirdCard[i] && firstCard[i] != thirdCard[i]
x =x +1
end
end


if x ==4 || match
scoreArray[j] = scoreArray[j] + 1
puts "Wow! Congrats on the matching set #{playersArray[j]} Your score is now  #{scoreArray[j]}"
end
#check if winner is found
if scoreArray[j] == 3
active = false
puts "Good game! Congrats to winner #{playersArray[j]}"
end 
end
#loops which players turn it is 
j = j + 1
if j == playerToInt
	j = 0 
end	

end
puts "\n"
puts "Thank you for playing!\n"
