sub new(){
    my $class = shift;
    my $self    {
                source  => shift;
                token   => shift;
                };
    
    bless $self, $class;
    }

sub check_token{
    my $lexeme          = shift;
    my $expected_token  = shift;
    if($lexeme->{token} =~ $expected_token){
        return "true"; #return true
        }
    else{
        return ""; #return false
        }
    }
    #the values of the token hash are the defining regular expressions
my %tokens =   (
                white_space         => /(^\s+\W)/,
                start               => /(^start\W)/,
                end                 => /(^end\W)/,
                print               => /(^print\W)/,
                assignment_operator => /(^=)/,
                open_paren          => /(^\()/,
                close_paren         => /(^\))/,
                open_comment        => /(^\/\*)/,
                close_comment       => /(^\*\/)/,
                identifier          => /(^[a-zA-Z]+[\w])/,
                number              => /(^\d+\W)/,
                unrecognized        => /(^[^.*]+)/,
                );