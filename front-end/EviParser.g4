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

statement
    : assignStatement
    | expression
    ;

assignStatement
    : identifier '=' expression
    ;

function
    : 'fn' identifier '(' functionParameters? ')' whereClause? 'do'
        (blockExpression)
    'end'
    ;

blockExpression
    : (statement)*
    ;

functionParameters
    : (identifier | literalExpression | '_') ','?
    | (',' (identifier | literalExpression | '_'))*
    ;

whereClause
    : 'where' expression
    ;

expression
    : literalExpression 
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
