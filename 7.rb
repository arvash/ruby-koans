#greed game
#a program by ARVASH


@round = 1
def roll(size)
arr = Array.new(size)
i=0
while i<size
     arr[i] = (1+Random.rand(6))
     i+=1
end
##@arr = arr  
return arr
end

#.................................................
def score(dice)
a = dice
sum = 0
if (a.count == 0)  
sum = 0  

elsif (a.count(1) > 2)
sum = (1000+ ((a.count(1)-3)*100)+(a.count(5)*50))

elsif (a.count(2) > 2)
sum = ((100*2)+(a.count(1)*100)+(a.count(5)*50))

elsif (a.count(3) > 2)
sum = ((100*3)+(a.count(1)*100)+(a.count(5)*50))

elsif (a.count(4) > 2)
sum = ((100*4)+(a.count(1)*100)+(a.count(5)*50))

elsif (a.count(5) > 2)
sum = ((100*5)+(a.count(1)*100)+((a.count(5)-3)*50))

elsif (a.count(6) > 2)
sum = ((100*6)+(a.count(1)*100)+(a.count(5)*50))

else
sum = ((a.count(1)*100) + (a.count(5)*50))

return sum
end
end

#..............................................................
puts "Welcome to GREED..Please enter the number of players :"
@pl_num = gets.to_i
@pl_names = Array.new(@pl_num)
@pl_scores = Array.new(@pl_num,0)

for i in (0...@pl_num)
print "Enter the name of player #{i+1} :"
@pl_names[i] = gets.chomp!
end

puts "\n\n\n"

def start_game

i=0
for i in (0...@pl_num)
if @pl_scores[i] == 0
puts "Welcome aboard :-> #{@pl_names[i].upcase} ...you are Player->#{i+1}..please roll the dice to begin your game...All the best  !! "
puts "rolling your dice...\n\n"
puts " *****&(&(&(&(&(&******* "

@pl_roll=roll(5) 
@pl_scores[i] = (score(@pl_roll) < 300)?0:score(@pl_roll)

print "your roll resulted in #{@pl_roll}...and your initial score is...:#{@pl_scores[i]} ****\n\n"
end
puts "\n\n\n"
end

end

while @pl_scores.max == 0 do
puts "THIS IS ROUND #{@round}..of initial rolling as everyone has score of 0"
start_game                                                       #starting the game here.....
@round+=1
end
i=0
for i in 0...@pl_num
puts "Initial Score for player #{@pl_names[i].upcase} is #{@pl_scores[i]} \n"
end

#...........................................................................................
def turn(num_dice,j)
roll = roll(num_dice)
print "new roll #{roll} has score :"
score = score(roll)
puts score
@pl_scores[j] = @pl_scores[j].to_i + score
set = Array.new
if score(roll) == 0
   return @pl_scores[j]
else
   for i in 0..5
   set[i] = roll.count(i+1) 
   end
   
   for i in 0..5
	if set[i] >= 3
	   roll=roll-[roll[i+1]]
         end
   end
 roll = roll-[1,5]
if roll.count==0
  turn(5,j) 
else
  turn(roll.count,j)
end
end
return @pl_scores[j]
end
#...............................................................................................................
def in_roll(k)
 roll = roll(5)
 score = score(roll)  
if score >= 300
   @pl_scores[k]=score
   puts "congrats #{@pl_names[k].upcase}..you got #{roll} and have crossed the initial barrier of 300...your score is now #{@pl_scores[k]}..Now play\n\n"
   
else
   puts "sorry man...your roll came out #{roll} and your score is still 0\n\n"

end
end
#..................................................................................................................

def game
#include 'turn'
@pl_turn = 0
while (@pl_scores.max < 3000) do

if ((@pl_turn%@pl_num) == 0)
puts "***************************    NEXT  ROUND  *************************************************" 
end

puts "we are now in the game..This is round #{(@round+(@pl_turn/@pl_num))}...Its now player :#{(@pl_turn%@pl_num)+1} i.e #{@pl_names[(@pl_turn%@pl_num)].upcase}'s turn to roll the dice.."

if @pl_scores[(@pl_turn%@pl_num)] == 0
   print "you haven't yet crossed the initial barrier of 300..Please roll the dice to open your account  ;)..\n"
   in_roll((@pl_turn%@pl_num))
   @pl_turn += 1
  next
else
turn(5,(@pl_turn%@pl_num))
end

puts "His score now is :#{@pl_scores[(@pl_turn%@pl_num)]}"
@pl_turn += 1

end
end


def end_game
#include 'turn'
puts "**********AWESOME...SOMEONE CROSSED THE MAGIC FIGURE OF 3000...THE GAME IS NOW IN THE LAST ROUND**************"
puts "player #{@pl_names[((@pl_turn-1)%@pl_num)].upcase} has passed the score of 3000."
@pl_turn=0
for @pl_turn in 0...@pl_num
puts "Player #{@pl_names[@pl_turn].upcase} will now play the final round.."
if @pl_scores[@pl_turn] == 0
  puts "Sorry #{@pl_names[@pl_turn].upcase}.You could not open your account..Better luck next time!!"
else
turn(5,@pl_turn)
puts "total score = #{@pl_scores[@pl_turn]}"
end
puts "*****************ENDGAME FOR PLAYER #{@pl_turn+1}: #{@pl_names[@pl_turn].upcase}*******\n"
end
i=0
for i in 0...@pl_num
puts "final scores are--- Player #{i+1}->#{@pl_names[i]} = #{@pl_scores[i]}"
end
puts "AND THE WINNER IS :#{@pl_names[@pl_scores.index(@pl_scores.max)].upcase}\n\n"
puts "**********************THANX FOR PLAYING****************************"
end

game
end_game













