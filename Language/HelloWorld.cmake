# [Thansk to RESOURCE]: (https://preshing.com/20170522/learn-cmakes-scripting-language-in-15-minutes/)
# Commandline: cmake -DARGUMENT='this is an argument' -P .\HelloWorld.cmake

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
function(ADD VARNAME VALUE1 VALUE2)
    math(EXPR RESULT "${VALUE1}+${VALUE2}")
    #set(${VARNAME} "${RESULT}")
    set(${VARNAME} "${RESULT}" PARENT_SCOPE)  # Return a value
endfunction()
set(A1 "1")
set(A2 "2")
ADD(RESULT ${A1} ${A2})  # to get value from function name your return variable
message("function SUM: ${RESULT}")

## macro
message("-------------------------------------")
## ENG: Functions Run In Their Own Scope; Macros Don’t
## TR : Fonksiyonlar kendi içinde çalışırken macrolar çalışmaz.
macro(ADD VARNAME VALUE1 VALUE2)
    math(EXPR RESULT "${VALUE1}+${VALUE2}")
    set(${VARNAME} "${RESULT}")  # There is "no-scope" ;)
    #set(${VARNAME} "${RESULT}" PARENT_SCOPE)  # Return a value
endmacro()
set(A1 "1")
set(A2 "2")
ADD(RESULT ${A1} ${A2})  # to get value from function name your return variable
message("macro SUM: ${RESULT}")

#[[
- Both functions and macros accept an arbitrary number of arguments. 
- Unnamed arguments are exposed to the function as a list, through a special variable named """ARGN""". 
- Here’s a function that doubles every argument it receives, printing each one on a separate line:
]]
## example
message("-------------------------------------")
function(doubleEach RETURNNAME)
    set(TEMP)
    foreach(ARG ${ARGN})
        math(EXPR A "${ARG}*2")
        #set(${TEMP} "${TEMP} ${A}")
        list(APPEND TEMP ${A})
    endforeach()
    set(${RETURNNAME} "${TEMP}" PARENT_SCOPE)
endfunction()

# only returns last element
doubleEach(RESULT 0 1 2 3 4 5 6 7 8 9)
message("doubleEach: ${RESULT}")




# Including Other Scripts
#[[
- CMake variables are defined at file scope. The include command executes another CMake script in the same scope as the calling script. 
It’s a lot like the #include directive in C/C++. It’s typically used to define a common set of functions or macros in the calling script. 
It uses the variable """CMAKE_MODULE_PATH""" as a search path.
- The """find_package""" command looks for scripts of the form """Find*.cmake""" and also runs them in the same scope. Such scripts are often used to help find external libraries. For example, 
if there is a file named FindSDL2.cmake in the search path, """find_package(SDL2) is equivalent to include(FindSDL2.cmake)""". 
(Note that: there are several ways to use the find_package command – this is just one of them.)
- CMake’s """add_subdirectory""" command, on the other hand, """creates a new scope""", then executes the script named """CMakeLists.txt""" from the specified directory in that new scope. You """typically use it to add another CMake-based subproject""", such as a library or executable, to the calling project. The targets defined by the subproject are added to the build pipeline unless otherwise specified. None of the variables defined in the subproject’s script will pollute the parent’s scope unless the set command’s PARENT_SCOPE option is used.
]]
