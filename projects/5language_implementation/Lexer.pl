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
my lexer = Lexer->constructor();

sub lex(){ #jss has some variables in the parenthesis, however "signatures" as they're called in perl are still experimental
    my $code = shift;
    my $use_regex = shift;
    #while still code to process
    while($code > 1){#originally considered code an array, but if orginally in scalar context, this doesn't work...
        #since we are going to use regular expression for simplicity, I'm going to skip the conditional
        #extract lexeme
        my $lexeme = extract_next_lexeme();
        
        
    }
    
}

sub extract_next_lexeme(){
    my $code = shift;
    my $lexeme = 0;
    for(){
        my $result = ()
    }
}