use Lexer #lexer.pl will probably need renamed to lexer.pm (for perl module)
my $lexer; #http://www.modernperlbooks.com/mt/2013/11/context-and-the-comma-operator.html
my $parser; #the above comment is why these are on two separate lines.

sub run_Lexer() {
    my $code = #$user_input; fix this
    my $use_regex = #$regex? fix this
       #can skip lexer = new lexer because perl "class" has already been invoked with "use"
       Lexer->constructor($use_regex, $code);
       
       my $result = "<h2>Lexemes</h2><ol>"; #need to find out if perl interpolates html?
       for(my lexeme = )
}