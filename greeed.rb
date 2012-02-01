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
return arr
end

#.........................................................
def conv(arr)
i = 0
roll_look = Array.new
for i in 0...arr.size
  if arr[i] == 1
      roll_look << "."
  elsif arr[i] == 2
      roll_look << ":"
  elsif arr[i] == 3
      roll_look << ":."
  elsif arr[i] == 4
      roll_look << "::"
  elsif arr[i] == 5
      roll_look << ":.:"
  elsif arr[i] == 6
      roll_look << ":::"
  end
end
print roll_look
end
#.........................................................
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
@pl_num = gets
@pl_num = @pl_num.strip.gsub(/\z\\n/, '')
while !(@pl_num =~ /\d/) do 
print "you have entered one or more characters and that suxx..please enter the number of players :"
@pl_num = gets
end
@pl_num = @pl_num.to_i
@pl_names = Array.new(@pl_num)
@pl_scores = Array.new(@pl_num,0)




for i in (0...@pl_num)
print "Enter the name of player #{i+1} :"
@pl_names[i] = gets.chomp!
end

puts "\n\n\n"


#..........................................................................
def start_game

i=0
   for i in (0...@pl_num)
	if @pl_scores[i] == 0
	puts "Welcome aboard :-> #{@pl_names[i].upcase} ...you are Player->#{i+1}..please roll the die to begin your game...All the best  !! "
	puts "rolling your die...\n\n"
	puts " *****&(&(&(&(&(&******* "

	@pl_roll=roll(5) 
	@pl_scores[i] = (score(@pl_roll) < 300)?0:score(@pl_roll)

	print "#{conv(@pl_roll)}...and your initial score is...:#{@pl_scores[i]} ****\n\n"
	end
	puts "\n\n\n"
   end

end

#............................................................................................

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
	puts "Dear #{@pl_names[j]}, You have Scored #{@score_array_sum} till now in this turn, Total #{@pl_scores[j]+@score_array_sum} and #{num_dice} number of #{d = (num_dice > 1?"Die":"Dice")} to roll.Hit \"Enter\" to roll the #{d = (num_dice > 1?"Die":"Dice")} and \"any other key+ Enter\" to abort..."
	res = gets
	if (res == "\n")
	  roll_arr = roll(num_dice)
	  print "new roll #{conv(roll_arr)} has score :"
	  score = score(roll_arr)
	  puts score
	  @score_array << score
	  @score_array_sum = @score_array_sum + @score_array.last
          
		set = Array.new
		if score(roll_arr) == 0
			puts " Bad luck Dear..  :( Your last roll #{conv(roll_arr)}yielded 0 point..you lose all points accumulated in this round"   
			return 0
			else
   				for i in 0..5
   				set[i] = roll_arr.count(i+1)
   				end
   					i = 0
   					for i in 0..5
					if set[i] >= 3
	   				num_dice -= 3
        				end
   					end

					num_dice = (num_dice- (roll_arr.count(1)%3) - (roll_arr.count(5)%3))

				if num_dice==0
	  	   		turn(5,j) 
				else
  	  	   		turn(num_dice,j)
				end
			end
	else
            return 0
        end
end


#...............................................................................................................
def in_roll(k)
 roll = roll(5)
 score = score(roll)  
if score >= 300
   @pl_scores[k]=score
   puts " Congrats #{@pl_names[k].upcase}..you#{conv(roll)} have crossed the initial barrier of 300...your score is now #{@pl_scores[k]}..Now play\n\n"
   
else
   puts "#{conv(roll)} This is your roll and your score is still 0..Sorry\n\n"

end
end
#..................................................................................................................

def game
	@pl_turn = 0
	while (@pl_scores.max < 3000) do

		if ((@pl_turn%@pl_num) == 0)
		puts "***************************    NEXT  ROUND  *************************************************" 
		end

	puts "we are now in the game..This is round #{(@round+(@pl_turn/@pl_num))}...Its now player :#{(@pl_turn%@pl_num)+1} i.e #{@pl_names[(@pl_turn%@pl_num)].upcase}'s turn to roll the die.."

		if @pl_scores[(@pl_turn%@pl_num)] == 0
		   print "you haven't yet crossed the initial barrier of 300..Please roll the die to open your account  ;)..\n"
		   in_roll((@pl_turn%@pl_num))
		   @pl_turn += 1
		  next
		else
			@score_array = Array.new(1,0)
			@score_array_sum = 0 
			turn(5,(@pl_turn%@pl_num))
		end

		if @score_array.last > 0 
   		@pl_scores[(@pl_turn%@pl_num)] = @pl_scores[(@pl_turn%@pl_num)].to_i + @score_array_sum
		end
 
		puts "#{@pl_names[(@pl_turn%@pl_num)].upcase} gathered :#{(@score_array.last > 0)?@score_array_sum:0} in last round..His/Her Total score now is :#{@pl_scores[(@pl_turn%@pl_num)]}\n\n"
		@pl_turn += 1

	end
end

#..........................................................................................................
def end_game
puts "**********AWESOME...#{@pl_names[((@pl_turn-1)%@pl_num)].upcase} HAS CROSSED THE MAGIC FIGURE OF 3000...THE GAME IS NOW IN THE LAST ROUND**************"
@pl_turn=0
	for @pl_turn in 0...@pl_num
		puts "Player #{@pl_names[@pl_turn].upcase} will now play the final round..ROLLING ALL DIE for last round!!!!!"
		if @pl_scores[@pl_turn] == 0
                        in_roll(@pl_turn)
		else
			@score_array = Array.new(1,0)
			@score_array_sum = 0
			turn(5,@pl_turn)
				if @score_array.last > 0 
   				@pl_scores[(@pl_turn%@pl_num)] = @pl_scores[(@pl_turn%@pl_num)].to_i + @score_array_sum
				end
			puts "total score = #{@pl_scores[@pl_turn]}"
		end
		puts "*****************ENDGAME FOR PLAYER #{@pl_turn+1}: #{@pl_names[@pl_turn].upcase}***************************************\n"
	end
	i=0
	for i in 0...@pl_num
	puts "final scores are--- Player #{i+1}->#{@pl_names[i]} = #{@pl_scores[i]}"
	end
puts "AND THE WINNER IS :#{@pl_names[@pl_scores.index(@pl_scores.max)].upcase}........CONGRATS!!!!!!\n\n"
puts "**********************THANX FOR PLAYING****************************"
end

game
end_game
#..............FINISH...........................................................................................................
