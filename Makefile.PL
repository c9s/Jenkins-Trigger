use inc::Module::Install;
name 'Jenkins-Trigger';
all_from 'lib/Jenkins/Trigger.pm';

requires 'Moose';
requires 'LWP::UserAgent';

readme_from_pod 'lib/Jenkins/Trigger.pm';
readme_markdown_from_pod 'lib/Jenkins/Trigger.pm';

tests 't/*.t';
# author_tests 'xt';
# test_requires 'Test::More';
# auto_set_repository;
auto_include;
WriteAll;
