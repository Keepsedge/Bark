package Bark::Utils;

use constant SALT => "0zG7pqsi9";

# static
sub hashValue {
    return crypt($_, SALT);
}

1;
__END__