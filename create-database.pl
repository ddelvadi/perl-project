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

my $query = qq(CREATE TABLE USER_INFORMATION
   (ID INT PRIMARY KEY     NOT NULL,
      FIRST_NAME           TEXT    NOT NULL,
      LAST_NAME            TEXT    NOT NULL,
      HOME                 TEXT ););

my $row = $dbh->do($query);
if($row < 0) {
   print $DBI::errstr;
} else {
   print "Table in Database Was created successfully\n";
}
$dbh->disconnect();