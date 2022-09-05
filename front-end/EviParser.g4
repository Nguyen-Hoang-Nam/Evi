parser grammar EviParser
    ;

options
{
    tokenVocab = EviLexer;
}

mod
    : 'mod' identifier 'do'
        (function)*
    'end' EOF
    ;

function
    : 'fn' identifier '(' functionParameters? ')' whereClause? 'do'
        (blockExpression)
    'end'
    ;

blockExpression
    : (statement)*
    ;

statement
    : assignStatement
    | expression
    ;

assignStatement
    : identifier '=' expression
    ;

functionParameters
    : functionParameter ','?
    | (functionParameter ',')? functionParameter (',' functionParameter)*
    ;

functionParameter
    : (identifier | literalExpression | '_')
    ;

whereClause
    : 'where' expression
    ;

anonymousFunction
    : '(' functionParameters? ')' '=>'
        (blockExpression)
    'end'
    ;

matchExpression
    : 'match' expression 'do'
        (matchArm '=>' (blockExpression) 'end')*
    'end'
    ;

matchArm
    : '(' expression (',' expression)* ')'
    ;

expression
    : anonymousFunction
    | literalExpression 
    | matchExpression
    | identifier
    | expression '.' identifier '(' callParams? ')'
    | expression ('*' | '/' | '%') expression
    | expression ('+' | '-') expression
    | expression comparisonOperator expression
    | expression
        ('|>' (identifier | expression '.' identifier) '(' callParams? ')')+
    | '[' (expression (',' expression)*)? ']'
    | '(' expression (',' expression)* ')'
    | '{' ( STRING_LITERAL ':' expression (',' STRING_LITERAL ':' expression)* )? '}'
    | '<' expression (',' expression)* '>'
    ;

callParams
    : expression (',' expression)*
    ;

comparisonOperator
    : '=='
    | '!='
    | '>'
    | '<'
    | '>='
    | '<='
    ;

literalExpression
    : STRING_LITERAL
    | INTEGER_LITERAL
    | FLOAT_LITERAL
    | KW_TRUE
    | KW_FALSE
    ;

identifier
    : NON_KEYWORD_IDENTIFIER
    ;

keyword
    : KW_DO
    | KW_END
    | KW_FALSE
    | KW_FN
    | KW_MATCH
    | KW_MOD
    | KW_TRUE
    | KW_WHERE
    ;
