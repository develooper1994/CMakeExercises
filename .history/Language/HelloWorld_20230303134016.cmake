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