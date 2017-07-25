#!/usr/bin/perl

# Reference: https://www.tutorialspoint.com/sqlite/sqlite_perl.htm

use DBI;
use strict;

my $driver   = "SQLite";
my $database = "information.db";
my $dsn = "DBI:$driver:dbname=$database";
my $username = "";
my $pass = "";
my $dbh = DBI->connect($dsn, $username, $pass, { RaiseError => 1 })
   or die $DBI::errstr;
print "Opened database successfully\n\n";

my $query = qq(SELECT ID, FIRST_NAME, LAST_NAME, HOME from USER_INFORMATION;);
my $statement = $dbh->prepare($query);
my $r = $statement->execute() or die $DBI::errstr;

if($r < 0) {
   print $DBI::errstr;
}

while(my @row = $statement->fetchrow_array()) {
	print "ID : ".$row[0] . "\n";
	print "First Name : ".$row[1]. "\n";
	print "Last Name : ".$row[2]. "\n";
	print "Home : ".$row[3]. "\n\n"; 
}

$dbh->disconnect();