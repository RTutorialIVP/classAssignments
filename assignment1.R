# Create a sequence of numbers from 32 to 44.cnt<-32
while (cnt < 45) {
  print(cnt)
  cnt = cnt + 1
}
?seq
# Create a sequence of numbers from 32 to 44 using built-in function [HINT: ?seq]
seq(32,44)

# Create a function that takes two arguments - one number and one string to specify operation
# if the string is "sqrt", the function should return square root of the number
# if the string is "square", the function should return square of the number
# if the string is log, the function should return log base 10 of the number
# if any other string is given, it should return 0
My.function <- function(a,b) {
 if(b=="sqrt"){
  return( sqrt(a))
 }
   else if(b=="square"){
    return( sqrt(a))
    
  } else if(b=="log"){
    return(log10(a))
  }
  else{
    return(0)
  } 
}	

test<-My.function(16,"sqrt")
print(test)
#Write a function that takes three arguments - the first two should be numbers and the third should be a string.
#a. If the string "add", output should be addition of two numbers
#b. If the string is "subtract", output should be subtraction of two numbers
#c. If the string is "divide", output should be division of two numbers
#d. If the string is "multiply", output should be multuplication of two numbers
#e. If the string is "log", output should be log of the first number with second number as base
#f. If the string is "power", output should be the first number raised to the power of the second number
#g. If the string in anything else, return -1


MyMath.func <- function(a,c,b) {
  if(b=="add"){
    return( sum(a,c))
  }
  else if(b=="subtract"){
    return(a-c)
    
  } else if(b=="multiply"){
    return(a*c)
  }
  else if(b=="divide"){
    return(a/c)
  }
  else if(b=="log"){
    return(logb(a,base = c))
  }
  else{
    return(-1)
  } 
}	
test<-MyMath.func(1,2,"add")
print(test)
#Write a function that takes a number as input and outputs a sequence of odd numbers starting from 1 to that number.

MyOddSeq.func <- function(a) {
 return( seq(1,a,by=2))
  
  }

test<-MyOddSeq.func(10)
print(test)

#Write a program that iterates through all LETTERS and prints only the vowels.

v <- LETTERS[1:26]
for ( i in v) {
  if (i != "A" && i != "E"&& i != "I"&& i != "O"&&i != "U" ) {
    next
  }
  print(i)
  
}

#Write a function that returns the class of the supplied input

MyClass.fn<-function(a){
  return(class(a))
}

print(test<-MyClass.fn("b"))

#Write a program that checks whether a number is prime and return TRUE for prime and FALSE for not prime

Prime.fn<-function(a){
  if(a==0||a==1){return("not Prime")}
  else{
  i<-2
  while (a%%i!= 0) {
    
    i=i+1
    
  }
  if(i==a){
    return("prime")
  }
  else{
    return("not prime")
  }
  }
}

print(test<-Prime.fn(0))


