def turn(num_dice)
roll = roll(num_dice)
score += score(roll)
set = Array.new
if score(roll) == 0
   return score
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
turn(roll.count)
end


