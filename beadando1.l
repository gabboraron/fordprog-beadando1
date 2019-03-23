%option noyywrap c++ yylineno

%{
#include <iostream>
#include <cstdlib>
%}

DIGIT		    [0-9]
WS  			[ \t\n]
ID  			[a-z][A-Z]
SPECIAL 		[():+-*<>=_;.#]
ID_WITH_SPECIAL [a-z][A-Z]_
TYPE			[natural, boolean]

%%

{DIGIT}+   		  std::cout << "karakter(ek)" << YYText()<< std::endl;
{ID}+   		  std::cout << "karakter(ek)" << YYText()<< std::endl;
{WS}+       	  std::cout << "karakter(ek)" << YYText()<< std::endl;
{SPECIAL}+     	  std::cout << "karakter(ek)" << YYText()<< std::endl;

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

natural           std::cout << "tipus: natural" 	<< std::endl;
boolean           std::cout << "tipus: boolean" 	<< std::endl;


^"#".#\n			  							std::cout << "megjegyzes"  			<< YYText() << std::endl;
({CHAR})+({CHAR}{DIGIT}{"_"})*	 				std::cout << "Azonosito"		    << YYText() << std::endl;
; ({CHAR})+({ID}{DIGIT})*				 		std::cout << "Azonosito"		    << YYText() << std::endl;
; ({CHAR})+({ID_WITH_SPECIAL}{DIGIT})* 		std::cout << "Azonosito"  			<< YYText() << std::endl;
; ({CHAR})+({DIGIT}{ID_WITH_SPECIAL})* 		std::cout << "Azonosito"  			<< YYText() << std::endl;
; ^("program").						 		std::cout << "Szignatura" 			<< YYText() << std::endl;
; ("program").("begin")				 		std::cout << "Deklaracio" 			<< YYText() << std::endl;
; ^("begin").							 		std::cout << "Torzs"				<< YYText() << std::endl;
; ^("end")							 		std::cout << "Vege"				  	<< YYText() << std::endl;
; ({TYPE})+({CHAR}{ID_WITH_SPECIAL})+(";")	std::cout << "Valtozodeklaracio"  	<< YYText() << std::endl;


; "write(".");"								std::cout << "Utasitas: kiiratas"	<< YYText() << std::endl;
; "read(".");"								std::cout << "Utasitas: olvasas"	<< YYText() << std::endl;
; .":=".										std::cout << "Utasitas: ertekadas"	<< YYText() << std::endl;
; "while"."do"."done"							std::cout << "while ciklus"			<< YYText() << std::endl;

.           {
                std::cerr << lineno() << ": Lexikalis hiba." << std::endl;
                exit(1);
            }

<<EOF>>     { return yyterminate(); }


%%
