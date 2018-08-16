%token OR AND XOR IF_THEN IF_BICONDITIONAL NOT ISEQUAL LESSTHAN CONST TRUE FALSE CONST_VAR BOOLEAN_VAR INTEGER_VAR INTEGER
%token GREATERTHAN GREATERTHAN_EQUAL LESSTHAN_EQUAL LP RP LEFT_CURLY RIGHT_CURLY RETURN COMMA MAIN EXEC STRING
%token LEFT_SQUARE_BRACKET RIGHT_SQUARE_BRACKET ASSIGN PLUS MINUS MULT DIVI SEMICOLON IDENTIFIER SENTENCE NL
%token INCREMENT DECREMENT WHILE FOR DO IF ELSE READ_BOOLEAN READ_INTEGER WRITE VOID PUBLIC PROTECTED PRIVATE FIXED COMMENT NEWLINE
%right ASSIGN
%union {
  int integer;
  char string[32];
}
%token <string> ERROR
%start main
%%
main : MAIN LEFT_CURLY program RIGHT_CURLY {printf("The code is correct \n");}
    | MAIN NL LEFT_CURLY program RIGHT_CURLY {printf("The code is correct \n");}
    ;
program: lines
   ;

lines:
     | lines line
     ;

line:  NL
     | statements NL
     | COMMENT
     ;

statements: statement SEMICOLON
   | statement SEMICOLON statements
   ;
statement: if_statement
    | non_if_statement
    ;

non_if_statements: non_if_statement SEMICOLON
    | non_if_statement SEMICOLON NL
    | non_if_statement SEMICOLON non_if_statements
    | non_if_statement SEMICOLON NL non_if_statements
    ;
non_if_statement: while_statement
   | expression
   | declarations
   | function_call
   | assignment
   | input_statement
   | dowhile_statement
   | output_statement
   ;
while_statement: WHILE LP expression RP LEFT_CURLY lines RIGHT_CURLY
   ;
dowhile_statement: DO LEFT_CURLY lines RIGHT_CURLY WHILE LP expression RP
   ;
if_statement : matched
   | unmatched
   ;
matched: IF LP expression RP  matched  ELSE  matched
   | LEFT_CURLY non_if_statements RIGHT_CURLY
   | LEFT_CURLY NL non_if_statements RIGHT_CURLY
   ;
unmatched: IF LP expression RP  if_statement
   | IF LP expression RP  matched  ELSE  unmatched
   ;
input_statement: READ_BOOLEAN IDENTIFIER
   | READ_INTEGER IDENTIFIER
   ;
output_statement: WRITE expression
   | WRITE STRING
   ;

functiondec: datatype IDENTIFIER LP functiondec_parameterlist RP LEFT_CURLY lines RETURN expression SEMICOLON RIGHT_CURLY
   | datatype IDENTIFIER LP functiondec_parameterlist RP LEFT_CURLY lines RETURN expression SEMICOLON NL RIGHT_CURLY
   ;
function_call: IDENTIFIER LP functioncall_parameterlist RP
   ;
functiondec_parameterlist: functiondec_parameter
   | empty
   | functiondec_parameterlist COMMA functiondec_parameter
   ;
functiondec_parameter: datatype IDENTIFIER
   ;

empty:
   ;
functioncall_parameterlist: functioncall_parameter
   | functioncall_parameterlist COMMA functioncall_parameter
   | empty
   ;
functioncall_parameter: IDENTIFIER
   | truthvalue
   | INTEGER
   | arraycall
   ;

datatype: BOOLEAN_VAR
    | INTEGER_VAR
    ;
declarations: vardec
   | constvardec
   | constdec
   | arrayvardec
   | functiondec
   ;
vardec: datatype vardeclist
   ;
vardeclist: IDENTIFIER
   | IDENTIFIER COMMA vardeclist
   ;
constvardec: CONST_VAR vardec ASSIGN expression
   ;

arrayvardec: datatype LEFT_SQUARE_BRACKET RIGHT_SQUARE_BRACKET vardeclist
   ;

variable: IDENTIFIER
   | arraycall
   ;

arraycall: IDENTIFIER LEFT_SQUARE_BRACKET INTEGER RIGHT_SQUARE_BRACKET
   ;

assignment: variable ASSIGN expression
   | variable ASSIGN function_call
   ;

expression: arithmetic_exp
   | logical_exp
   | equality_exp
   | NOT equality_exp
   | NOT logical_exp
   ;
arithmetic_exp: arithmetic_exp PLUS term
   | arithmetic_exp MINUS term
   | variable INCREMENT
   | variable DECREMENT
   | term
   ;
term: factor
   | term MULT factor
   | term DIVI factor
   | truthvalue
   ;
factor: LP arithmetic_exp RP
   | variable
   | INTEGER
   ;
logical_exp:  logical_exp IF_BICONDITIONAL logical_term
   |  logical_exp IF_THEN logical_term
   ;
logical_term: logical_and
   |  logical_term OR logical_and
   |  logical_term XOR logical_and
   ;


logical_and: logical_finish
   | logical_and AND logical_finish
   ;

logical_finish: truthvalue
    | LP logical_exp RP
    | variable
    ;

equality_exp: functioncall_parameter ISEQUAL functioncall_parameter
   | functioncall_parameter LESSTHAN functioncall_parameter
   | functioncall_parameter GREATERTHAN functioncall_parameter
   | functioncall_parameter GREATERTHAN_EQUAL functioncall_parameter
   | functioncall_parameter LESSTHAN_EQUAL functioncall_parameter
   ;

truthvalue: TRUE
    | FALSE
    ;

constdec: CONST STRING ASSIGN truthvalue
   ;

%%
#include "lex.yy.c"
int lineno;
int main(void){
 return yyparse();
}
yyerror( char *s ) { fprintf( stderr, "%s in line: %d\n", s, lineno); };
