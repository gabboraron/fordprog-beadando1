%option noyywrap c++ yylineno

%{
#include <iostream>
#include <cstdlib>
using namespace std;
int nr_of_hashmark = 0;
%}

DIGIT		    [0-9]
WS  			[ \t\n]
CHAR  			[a-zA-Z]
UNDERSCORE		"_"

%%

program		      std::cout << "kulcsszo: program" 	<< std::endl;
begin       	  std::cout << "kulcsszo: begin" 	<< std::endl;
end         	  std::cout << "kulcsszo: end" 		<< std::endl;
natural           std::cout << "kulcsszo: natural" 	<< std::endl;
boolean        	  std::cout << "kulcsszo: boolean" 	<< std::endl;
true         	  std::cout << "kulcsszo: true" 	<< std::endl;
false          	  std::cout << "kulcsszo: false" 	<< std::endl;
div         	  std::cout << "kulcsszo: div" 		<< std::endl;
mod	        	  std::cout << "kulcsszo: mod" 		<< std::endl;
and    	      	  std::cout << "kulcsszo: and" 		<< std::endl;
or         	  	  std::cout << "kulcsszo: or" 		<< std::endl;
not         	  std::cout << "kulcsszo: not" 		<< std::endl;
skip         	  std::cout << "kulcsszo: skip" 	<< std::endl;
if         	 	  std::cout << "kulcsszo: if" 		<< std::endl;
then         	  std::cout << "kulcsszo: then" 	<< std::endl;
else         	  std::cout << "kulcsszo: else" 	<< std::endl;
elseif            std::cout << "kulcsszo: elseif" 	<< std::endl;
endif             std::cout << "kulcsszo: endif" 	<< std::endl;
while             std::cout << "kulcsszo: while" 	<< std::endl;
do         	  	  std::cout << "kulcsszo: do" 		<< std::endl;
done         	  std::cout << "kulcsszo: done" 	<< std::endl;
read         	  std::cout << "kulcsszo: read" 	<< std::endl;
write             std::cout << "kulcsszo: write" 	<< std::endl;


{DIGIT}+   		  std::cout << "karakter(ek): " << YYText()<< std::endl;
{WS}+       	  std::cout << "karakter(ek): " << YYText()<< std::endl;
"#".#\n			  std::cout << "megjegyzes: "   << YYText()<< std::endl;
"#"([^#]|\n)*"#"  std::cout << "megjegyzes: "   << YYText()<< std::endl;

({CHAR})+({CHAR}|{DIGIT}|{UNDERSCORE})*			std::cout << "azonosito: " << YYText() << std::endl;

":="        				std::cout << "ertekadas"   		<< YYText() << std::endl;
";"        				    std::cout << "pontosvesszo"   	<< YYText() << std::endl;
;":"        				    std::cout << "kettospont"   	<< YYText() << std::endl;
"."        				    std::cout << "pont"			   	<< YYText() << std::endl;
"<"         				std::cout << "kisebb"	    	<< YYText() << std::endl;
">"         				std::cout << "nagyobb" 			<< YYText() << std::endl;
;","         				std::cout << "vesszo"			<< YYText() << std::endl;
"="         				std::cout << "egynelo"			<< YYText() << std::endl;
"("         				std::cout << "nyito kerek"  	<< YYText() << std::endl;
")"         				std::cout << "zaro kerek"   	<< YYText() << std::endl;
"#"         				std::cout << "kettoskerszt"		<< YYText() << std::endl;
"+"         				std::cout << "plusz"			<< YYText() << std::endl;
"-"         				std::cout << "minusz"			<< YYText() << std::endl;
;"_"         				std::cout << "alahuzas"			<< YYText() << std::endl;
"*"         				std::cout << "csillag"			<< YYText() << std::endl;


.           {
                std::cerr << lineno() << ": Lexikalis hiba." << std::endl;
                exit(1);
            }

%%
