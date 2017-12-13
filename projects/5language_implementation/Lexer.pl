use Lexeme;

sub constructor(){
    $class = shift;
    $self = {
            lexemes         =>  [],
            in_comment      =>  0,
            lexeme_index    =>  0,
            }
    bless $self, $class;
    }

#actually construct lexical object
my $lexer = Lexer->constructor();

sub lex(){ #jss has some variables in the parenthesis, however "signatures" as they're called in perl are still experimental
    my $code = shift;
    my $use_regex = shift;
    #while still code to process
    while((length($code)) > 1){#originally considered code an array, but if orginally in scalar context, this doesn't work...
        #extract lexeme
        my $lexeme = extract_next_lexeme($code);
        #pulls the lexeme off the code
        $code = substr($code, ($lexeme->{length}));
        if($lexeme->check_token($tokens[open_comment])){
            $lexer->{in_comment} = "true";
            }
        elsif($lexeme->check_token($tokens[close_comment])){
            $lexer->{in_comment} = ""; #false
            }
        elsif((!(check_token(lexeme->$tokens[white_space]))) && !($lexer->{in_comment}){
            push $lexer->{lexemes}, $lexeme->{source}; #so if it's not in a comment or whitespace, push the source code into lexemes
            }
        }
    }

sub extract_next_lexeme(){
    my $code = shift;
    my $lexeme = 0;
    foreach(%tokens){
        if($code =~ $tokens[$_]){
            my $result = $1;
            $lexeme = Lexeme->new($result, $1);
            $lexeme->{length} = length($lexeme->{source});
            last;
            }
        }
    return $lexeme;
    }