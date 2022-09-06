lexer grammar EviLexer
    ;

KW_DO: 'do';
KW_END: 'end';
KW_FALSE: 'false';
KW_FN: 'fn';
KW_MATCH: 'match';
KW_COND: 'cond';
KW_MOD: 'mod';
KW_TRUE: 'true';
KW_WHERE: 'where';

LINE_COMMENT: '//' ~[\r\n]* -> channel (HIDDEN);
WHITESPACE: [\p{Zs}] -> channel(HIDDEN);
NEWLINE: ('\r\n' | [\r\n]) -> channel(HIDDEN);

NON_KEYWORD_IDENTIFIER: [a-zA-Z_][a-zA-Z0-9_]*;

STRING_LITERAL
    : '"'
    (
        ~["]
        | QUOTE_ESCAPE
        | ESC_NEWLINE
    )* '"'
    ;

INTEGER_LITERAL
    : DEC_LITERAL
    ;

FLOAT_LITERAL
    : DEC_LITERAL ( '.' DEC_LITERAL )?
    ;

DEC_LITERAL: DEC_DIGIT+;

fragment QUOTE_ESCAPE: '\\' ['"];
fragment ESC_NEWLINE: '\\' '\n';
fragment COMMON_ESCAPE: '\\' [nrt\\0];

fragment DEC_DIGIT: [0-9];

PLUS: '+';
MINUS: '-';
STAR: '*';
SLASH: '/';
PERCENT: '%';
NOT: '!';
AND: '&&';
OR: '||';
PLUSEQ: '+=';
MINUSEQ: '-=';
STAREQ: '*=';
SLASHEQ: '/=';
PERCENTEQ: '%=';
EQ: '=';
EQEQ: '==';
NE: '!=';
GT: '>';
LT: '<';
GE: '>=';
LE: '<=';
UNDERSCORE: '_';
DOT: '.';
COMMA: ',';
COLON: ':';
ARROW: '=>';
PIPE: '|>';

LCURLYBRACE: '{';
RCURLYBRACE: '}';
LSQUAREBRACKET: '[';
RSQUAREBRACKET: ']';
LPAREN: '(';
RPAREN: ')';
