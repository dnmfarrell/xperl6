use v6;
use Test;
use lib './';

plan 21;

BEGIN { EVAL('use Example') }; pass 'Load module';

ok Bob.can('hey'), 'Class Bob has hey() method';

my @cases =
    # input                                           expected output        title
    ['Tom-ay-to, tom-aaaah-to.',                       'Whatever.',          'stating something'],
    ['WATCH OUT!',                                     'Woah, chill out!',   'shouting'],
    ['Does this cryogenic chamber make me look fat?',  'Sure.',              'question'],
    ['You are, what, like 15?',                        'Sure.',              'numeric question'],
    ["Let's go make out behind the gym!",              'Whatever.',          'talking forcefully'],
    ["It's OK if you don't want to go to the DMV.",    'Whatever.',          'using acronyms in regular speech'],
    ['WHAT THE HELL WERE YOU THINKING?',               'Woah, chill out!',   'forceful questions'],
    ['1, 2, 3 GO!',                                    'Woah, chill out!',   'shouting numbers'],
    ['1, 2, 3',                                        'Whatever.',          'only numbers'],
    ['4?',                                             'Sure.',              'question with only numbers'],
    ['ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!',  'Woah, chill out!',   'shouting with special characters'],
    ["ÜMLÄÜTS!",                                       'Woah, chill out!',   'shouting with umlauts'],
    ["\xdcML\xc4\xdcTS!",                              'Woah, chill out!',   'shouting with umlauts'],
    ["ÜMLäÜTS!",                                       'Whatever.',          'speaking calmly with umlauts'],
    ['I HATE YOU',                                     'Woah, chill out!',   'shouting with no exclamation mark'],
    ['Ending with ? means a question.',                'Whatever.',          'statement containing question mark'],
    ["Wait! Hang on. Are you going to be OK?",         'Sure.',              'prattling on'],
    ['',                                               'Fine. Be that way!', 'silence'],
    ['    ',                                           'Fine. Be that way!', 'prolonged silence'],
;

for @cases -> @c {
    is @c[1], Bob.hey(@c[0]), @c[2];
}
