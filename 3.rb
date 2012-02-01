@res = "y"
while @res.to_s=="y" do
print "want to continue?? press \"y\" else press any other key :"
@res = gets.downcase.to_s[0]
 
if @res.to_s[0] == "y"
print "you entered yes\n" 
print "now please enter your age :"
age = gets
age = age.strip.gsub(/\z\\n/, '')
while !(age =~ /\d/) do 
print "you have entered one or more characters and that suxx..please enter your age :"
age = gets
end
print "you are :" 
case age.to_i
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
else
   puts "you entered any other character..GOODBYE"
end
end
