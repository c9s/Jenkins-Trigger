#!/usr/bin/env perl
use Test::More tests => 2;
use Jenkins::Trigger;

$trigger = Jenkins::Trigger->new( host => 'localhost' );
ok $trigger;
ok $trigger->user_agent;

$trigger->trigger( 'test',  'BUILD' );
