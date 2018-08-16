/*Revised TheLanguage.l for the project part 2*/
%option yylineno
DIGIT  [0-9]
SIGN [+-]
OR_OPERATOR \|\|
AND_OPERATOR \&\&
XOR_OPERATOR x\|
IF-THEN \=\>
IF-BICONDITIONAL \<\=\>
NOT \!
ISEQUAL \=\=
LESSTHAN \<\<
LESSTHAN-EQUAL \<\<\=
GREATERTHAN \>\>
GREATERTHAN-EQUAL \>\>\=
LETTER [A-Za-z]
COMMA ,
CHARACTER ({DIGIT}|{LETTER}|<|>|!|@|#|$|%|^|&|*|(|)|_|+|}|{|]|[|”|:|\|’|;|,|.|/|)
LEFT_PTH \(
RIGHT_PTH \)
LEFT_CURLY \{
RIGHT_CURLY \}
LEFT_SQR_BRACKET \[
RIGHT_SQR_BRACKET \]
ASSIGNMENT <-
TRUE true
FALSE false
TRUTH_VALUE ({TRUE}|{FALSE})
QUOT \"
ALPHANUMERIC ({LETTER}|{DIGIT})
PLUS \+
MINUS \-
MULT \*
DIVI \/
SEMICOLON \;
INCREMENT \+\+
DECREMENT \-\-
WHITESPACE [ \t\n]
WHILE while
FOR for
DO do
IF if
ELSE else
CONSTANT const
READBOOL readbool
READINTEGER readinteger
WRITE write
CONSTANTVAR constantvar
BOOLVAR boolvar
INTVAR intvar
VOID void
PUBLIC public
PROTECTED protected
PRIVATE private
FIXED fixed
COMMENT [\#]([ \t]+|[a-zA-Z0-9]*)*
INTEGER {SIGN}?{DIGIT}+
EXEC exec
MAIN main
RETURN return
LOWERCASE [a-z]
UPPERCASE [A-Z]
IDENTIFIER {LETTER}|({ALPHANUMERIC}|_)*
STRING \"([^\\\"]|\\.)*\"
%%
{OR_OPERATOR} return OR;
{AND_OPERATOR} return AND;
{XOR_OPERATOR} return XOR;
{IF-THEN} return IF_THEN;
{IF-BICONDITIONAL} return IF_BICONDITIONAL;
{NOT} return NOT;
{ISEQUAL} return ISEQUAL;
{LESSTHAN} return LESSTHAN;
{LESSTHAN-EQUAL} return LESSTHAN_EQUAL;
{GREATERTHAN} return GREATERTHAN;
{GREATERTHAN-EQUAL} return GREATERTHAN_EQUAL;
{LEFT_PTH} return LP;
{RIGHT_PTH} return RP;
{LEFT_CURLY} return LEFT_CURLY;
{RIGHT_CURLY} return RIGHT_CURLY;
{LEFT_SQR_BRACKET} return LEFT_SQUARE_BRACKET;
{RIGHT_SQR_BRACKET} return RIGHT_SQUARE_BRACKET;
{ASSIGNMENT} return  ASSIGN;
{PLUS} return PLUS;
{MINUS} return MINUS;
{MULT} return MULT;
{DIVI} return DIVI;
{SEMICOLON} return SEMICOLON;
{COMMA} return COMMA;
{INCREMENT} return INCREMENT;
{DECREMENT} return DECREMENT;
{TRUE} return TRUE;
{FALSE} return FALSE;
{WHILE} return  WHILE;
{FOR} return FOR;
{DO}  return DO;
{IF} return IF;
{ELSE} return ELSE;
{READBOOL} return READ_BOOLEAN;
{READINTEGER} return READ_INTEGER;
{WRITE} return WRITE;
{CONSTANTVAR} return CONST_VAR;
{BOOLVAR} return BOOLEAN_VAR;
{INTVAR} return INTEGER_VAR;
{MAIN} return MAIN;
{VOID} return VOID;
{EXEC} return EXEC;
{RETURN} return RETURN;
{PUBLIC} return PUBLIC;
{PROTECTED} return PROTECTED;
{PRIVATE} return PRIVATE;
{FIXED} return FIXED;
{CONSTANT} return CONST;
{STRING} return STRING;
{COMMENT}  return COMMENT;
{INTEGER} return INTEGER;
{IDENTIFIER} return IDENTIFIER;
[ \t\r] ;
\n { extern int lineno; lineno++;
                  return NL;
                }
. { strcpy(yylval.string, yytext);
    return ERROR;
    }
%%
int yywrap(void){	return 1;}
