# Hello World
message("Hello World Captain!")

# variable Hello World
set(name "Captain")
message("Hello World ${name}!")

# variable from cmake argument
set(fromCmake "from cmake")  # variable comming from script
message("message ${fromCmake} argument: ${ARGUMENT}")  # variable comming from cmake argument
#[[
    RESULTS:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld  
Hello World Captain!
Hello World Captain!
message from
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DARGUMENT=  
Hello World Captain!
Hello World Captain!
message from cmake argument:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DARGUMENT=arg
Hello World Captain!
Hello World Captain!
message from cmake argument:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DARGUMENT=arg
Hello World Captain!
Hello World Captain!
message from cmake argument:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DARGUMENT=asd
Hello World Captain!
Hello World Captain!
message from cmake argument:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DNAME=Newman   
Hello World Captain!
Hello World Captain!
message from cmake argument:
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -P .\HelloWorld -DNAME=Newman
Hello World Captain!
Hello World Captain!
Hello !
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DNAME=Newman -P .\HelloWorld  
Hello World Captain!
Hello World Captain!
Hello Newman!
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DARGUMENT=Newman -P .\HelloWorld
Hello World Captain!
Hello World Captain!
Hello !
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DARGUMENT=Newman -P .\HelloWorld
Hello World Captain!
Hello World Captain!
message from cmake argument: Newman
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DARGUMENT=this is an argument -P .\HelloWorld
Hello World Captain!
Hello World Captain!
message from cmake argument: this
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DARGUMENT="this is an argument" -P .\HelloWorld
Hello World Captain!
Hello World Captain!
message from cmake argument: this is an argument
PS C:\Users\selcu\repos\CMakeExercises\Language> cmake -DARGUMENT='this is an argument' -P .\HelloWorld
Hello World Captain!
Hello World Captain!
message from cmake argument: this is an argument
]]


# data type simulation
set(MERCEDES "MERCEDES")
set(MERCEDES_MODEL "MERCEDES GT")
set(MERCEDES_YEAR "2017")
set(MERCEDES_KM "70.000")
message("MODEL: ${${MERCEDES}_MODEL} \nYEAR: ${${MERCEDES}_YEAR} \nKM:${${MERCEDES}_KM}")

# math
math(EXPR MY_SUM "1+1")
message("The sum is ${MY_SUM}")
math(EXPR MY_SUM_double ${MY_SUM}*2)
message("The sum is ${MY_SUM_double}")