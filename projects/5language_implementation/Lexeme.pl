#so they have expanded scopes for this class
my $source;
my $token;

sub constructor(){
    $source = shift;
    $token = shift;
    }

sub check_token{
    my $expected_token = shift;
    return ($token =~ $expected_token);
    }
    #the values of the token hash are the defining regular expressions
my %tokens =   (
                white_space         => /^\s+\W/,
                start               => /start\W/,
                end                 => /^end\W/,
                print               => /^print\W/,
                assignment_operator => /^=/,
                open_paren          => /^\(/,
                close_paren         => /^\)/,
                open_comment        => /^\/\*/,
                close_comment       => /^\*\//,
                identifier          => /^[a-zA-Z]+[\w]/,
                number              => /^\d+\W/,
                unrecognized        => /^[^.*]+/,
            );