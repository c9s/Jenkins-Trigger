use inc::Module::Install;
name 'Jenkins-Trigger';
all_from 'lib/Jenkins/Trigger.pm';

# requires '';

tests 't/*.t';
# author_tests 'xt';
# test_requires 'Test::More';
# auto_set_repository;
auto_include;
WriteAll;