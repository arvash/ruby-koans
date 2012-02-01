@res = "y"
while @res.to_s=="y" do
print "want to continue?? press \"y\" else press any other key :"
@res = gets.downcase.to_s[0] 
if @res.to_s[0] == "y"
print "you entered yes\n" 

def promptAndGet(prompt)
   print prompt
   res = gets.chomp
   throw :quitRequested if !(res =~ /^\d/)
   return res
end

catch :quitRequested do
     @age = promptAndGet("Now enter your age :")
     #puts @age


case @age.to_i
when 0
    puts "just born"
    puts "newcomer"
when 1 .. 2
    puts "baby"
when 3 .. 6
    puts "little child"
when 7 .. 12
    puts "child"
when 13 .. 18
    puts "teenager babua"
when 19 .. 25
    puts "youth"
else
    puts "adult"
end
end
#puts "you entered a character in place of your age..please enter a number as your age."
else
   puts "you entered any other character..GOODBYE"
end
end
