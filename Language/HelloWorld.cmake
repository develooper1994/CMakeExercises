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
message("-------------------------------------")
## ENG: You Can Simulate a Data Structure using Prefixes
## TR : Alt tirelerle veri yapılarını taklit edilebilir.
set(MERCEDES "MERCEDES")
set(MERCEDES_MODEL "MERCEDES GT")
set(MERCEDES_YEAR "2017")
set(MERCEDES_KM "70.000")
message("MODEL: ${${MERCEDES}_MODEL} \nYEAR: ${${MERCEDES}_YEAR} \nKM:${${MERCEDES}_KM}")

# math
message("-------------------------------------")
## ENG: Every Statement is a Command
## TR : Her ifade bir komuttur.
math(EXPR MY_SUM "1+1")
message("The sum is ${MY_SUM}")
math(EXPR MY_SUM_double ${MY_SUM}*2)
message("The sum is ${MY_SUM_double}")


# Flow Control
message("-------------------------------------")
## if-elseif-else
if(WIN32)
    message("You are creating a WIN32 project")
elseif(LINUX)
    message("You are creating a LINUX project")
else()
    message("You are creating a <unknown os> project")
endif(WIN32)

## loop
### while
set(AGE1 "21")
set(AGE2 "31")
#set(AGE2 "11")

while("1")
    if(${AGE1} LESS ${AGE2})  # AGE1 < AGE2
        message("${AGE1} < ${AGE2}")
        math(EXPR AGE2 "${AGE2}-1")
    elseif(${AGE1} GREATER ${AGE2})    # AGE1 > AGE2
        message("${AGE1} > ${AGE2}")
        math(EXPR AGE2 "${AGE2}+1")
    elseif(${AGE1} EQUAL ${AGE2})    # AGE1 == AGE2
        message(message("${AGE1} == ${AGE2}"))
        break()
    endif()
endwhile()


# lists
message("-------------------------------------")
## ENG: Lists are Just Semicolon-Delimited Strings
## TR : Liste yapısı sadece noktalı virgülle ayrılmış stringlerdir.
set(LIST1 This is a semicolon sperated string)
message("LIST1: ${LIST1}")

set(ARGS "EXPR;T;1 + 1")
math(${ARGS})  # Equivalent to calling math(EXPR T "1 + 1")
math(EXPR T2 "3 + 2")  
message(${ARGS})
message("${ARGS}")

message(${T2})
message("${T2}")

## foreach loop over list
foreach(ARG This is a semicolon sperated string)
    message("${ARG}")  # prints with new lines.
endforeach()
message("-------------------------------------")

set(LIST2 Apple Orange Banana Kiwie)
foreach(ARG ${LIST2})
    message("${ARG}")
endforeach()

# function
message("-------------------------------------")
## ENG: Functions Run In Their Own Scope; Macros Don’t
## TR : Fonksiyonlar kendi içinde çalışırken macrolar çalışmaz.
