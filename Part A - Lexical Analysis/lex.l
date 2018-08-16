/*lex.l for the project part 1*/
%option main
digit  [0-9]
sign  [+-]
or_operator \|\|
and_operator \&\&
xor_operator x\|
if-then_op \=\>
if-biconditional_op \<\=\>
not_operator \!
isequal_operator \=\=
lessthan_operator \<\<
lessthan-equal_operator \<\<\=
greaterthan_operator \>\>
greaterthan-equal_operator \>\>\=
letter [A-Za-z_$]
newline \n
character ( {digit}|{letter}|<|>|!|@|#|$|%|^|&|*|(|)|_|+|}|{|]|[|”|:|\|’|;|,|.|/|)
left_pth \(
right_pth \)
left_curly \{
right_curly \}
left_sqr-bracket \[
right_sqr-bracket \]
assignment_operator \<\-
true true
false false
truth_value ({true}|{false})
quot \"
alphanumeric ({letter}|{digit})
plus \+
minus \-
mult \*
divi \/
semicolon \;
increment \+\+
decrement \-\-
comment #
whitespace [ \t\n]
%%
{or_operator}                          {printf("OR_OPERATOR ");}
{and_operator}                         {printf("AND_OPERATOR ");}
{xor_operator}                         {printf("XOR_OPERATOR ");}
{if-then_op}                           {printf("IF-THEN_OP ");}
{if-biconditional_op}                  {printf("IF-BICONDITIONAL_OP ");}
{not_operator}                         {printf("NOT_OPERATOR ");}
{isequal_operator}                     {printf("ISEQUAL_OPERTOR ");}
{lessthan_operator}                    {printf("LESSTHAN_OPERATOR ");}
{greaterthan_operator}                 {printf("GREATERTHAN_OPERATOR ");}
{greaterthan-equal_operator}           {printf("GREATERTHAN_EQUAL ");}
{lessthan-equal_operator}              {printf("LESSTHAN_EQUAL ");}
{left_pth}                             {printf("LEFT_PARENTHESIS ");}
{right_pth}                            {printf("RIGHT_PARENTHESIS ");}
{left_curly}                           {printf("LEFT_CURLY ");}
{right_curly}                          {printf("RIGHT_CURLY ");}
{left_sqr-bracket}                     {printf("LEFT_SQUARE_BRACKET ");}
{right_sqr-bracket}                    {printf("RIGHT_SQUARE_BRACKET ");}
{assignment_operator}                  {printf("ASSIGNMENT_OPERATOR ");}
{plus}                                 {printf("PLUS ");}
{minus}                                {printf("MINUS ");}
{mult}                                 {printf("MULTIPLICATION ");}
{divi}                                 {printf("DIVISION ");}
{semicolon}                            {printf("SEMICOLON ");}
{increment}                            {printf("INCREMENT ");}
{decrement}                            {printf("DECREMENT ");}
{true}                                 {printf("TRUE ");}
{false}                                {printf("FALSE ");}
while                                  {printf("WHILE ");}
for                                    {printf("FOR ");}
do                                     {printf("DO ");}
if                                     {printf("IF ");}
else                                   {printf("ELSE ");}
readbool                               {printf("READ_BOOLEAN ");}
readinteger                            {printf("READ_INTEGER ");}
write                                  {printf("WRITE ");}
constvar                               {printf("CONST_VAR ");}
boolvar                                {printf("BOOLEAN_VAR ");}
intvar                                 {printf("INTEGER_VAR ");}
void                                   {printf("VOID ");}
public                                 {printf("PUBLIC ");}
protected                              {printf("PROTECTED ");}
private                                {printf("PRIVATE ");}
fixed                                  {printf("FIXED ");}
{newline}                              {printf("\n");}
[\#]([ \t\n]+|[a-zA-Z0-9]*)+           {printf("COMMENT");}
{sign}{digit}+                         {printf("INTEGER ");}
{letter}|({alphanumeric}|_)*           {printf("IDENTIFIER ");}
quot.quot                              {printf("SENTENCE ");}
