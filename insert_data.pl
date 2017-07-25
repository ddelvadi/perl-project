#!/usr/bin/perl

#Reference - https://www.tutorialspoint.com/sqlite/sqlite_perl.htm

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "information.db";
my $dsn = "DBI:$driver:dbname=$database";
my $username = "";
my $pass = "";
my $dbh = DBI->connect($dsn, $username, $pass, { RaiseError => 1 })
   or die $DBI::errstr;
print "Opened database successfully\n";

my $query = qq(INSERT INTO USER_INFORMATION (ID, FIRST_NAME, LAST_NAME, HOME) VALUES (1, 'Rose', 'Tyler', 'Earth'));
my $row = $dbh->do($query) or die $DBI::errstr;

$query = qq(INSERT INTO USER_INFORMATION (ID, FIRST_NAME, LAST_NAME, HOME) VALUES (2, 'Dipen', 'Delvadiya', 'Earth'));
$row = $dbh->do($query) or die $DBI::errstr;

print "Data was inserted successfully\n";
$dbh->disconnect();