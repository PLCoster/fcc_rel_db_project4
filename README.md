# Free Code Camp: Relational Database Project 4

## Periodic Table Database and Script

The aim of this project was to create a Bash script to get information about chemical elements from a PostgreSQL periodic table database.

## Project Requirements:

- **User Story #1:** You should rename the `weight` column to `atomic_mass`

- **User Story #2:** You should rename the `melting_point` column to `melting_point_celsius` and the `boiling_point` column to `boiling_point_celsius`

- **User Story #3:** Your `melting_point_celsius` and `boiling_point_celsius` columns should not accept null values

- **User Story #4:** You should add the `UNIQUE` constraint to the `symbol` and `name` columns from the `elements` table

- **User Story #5:** Your `symbol` and `name` columns should have the `NOT NULL` constraint

- **User Story #6:** You should set the `atomic_number` column from the `properties` table as a foreign key that references the column of the same name in the `elements` table

- **User Story #7:** You should create a `types` table that will store the three types of elements

- **User Story #8:** Your `types` table should have a `type_id` column that is an integer and the primary key

- **User Story #9:** Your `types` table should have a `type` column that's a `VARCHAR` and cannot be `null`. It will store the different types from the `type` column in the `properties` table

- **User Story #10:** You should add three rows to your `types` table whose values are the three different types from the `properties` table

- **User Story #11:** Your `properties` table should have a `type_id` foreign key column that references the `type_id` column from the `types` table. It should be an `INT` with the `NOT NULL` constraint

- **User Story #12:** Each row in your `properties` table should have a `type_id` value that links to the correct type from the `types` table

- **User Story #13:** You should capitalize the first letter of all the `symbol` values in the `elements` table. Be careful to only capitalize the letter and not change any others

- **User Story #14:** You should remove all the trailing zeros after the decimals from each row of the `atomic_mass` column. You may need to adjust a data type to `DECIMAL` for this. Be careful not to change the value

- **User Story #15:** You should add the element with atomic number `9` to your database. Its name is `Fluorine`, symbol is `F`, mass is `18.998`, melting point is `-220`, boiling point is `-188.1`, and it's a `nonmetal`

- **User Story #16:** You should add the element with atomic number `10` to your database. Its name is `Neon`, symbol is `Ne`, mass is `20.18`, melting point is `-248.6`, boiling point is `-246.1`, and it's a `nonmetal`

- **User Story #17:** You should create a `periodic_table` folder in the `project` folder and turn it into a git repository with `git init`

- **User Story #18:** Your repository should have a `main` branch with all your commits

- **User Story #19:** Your `periodic_table` repo should have at least five commits

- **User Story #20:** You should create an `element.sh` file in your repo folder for the program I want you to make

- **User Story #21:** Your script (`.sh`) file should have executable permissions

- **User Story #22:** If you run `./element.sh`, it should output `Please provide an element as an argument.` and finish running.

- **User Story #23:** If you run `./element.sh 1`, `./element.sh H`, or `./element.sh Hydrogen`, it should output `The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.`

- **User Story #24:** If you run `./element.sh` script with another element as input, you should get the same output but with information associated with the given element.

- **User Story #25:** If the argument input to your `element.sh` script doesn't exist as an `atomic_number`, `symbol`, or `name` in the database, the output should be `I could not find that element in the database.`

- **User Story #26:** The message for the first commit in your repo should be `Initial commit`

- **User Story #27:** The rest of the commit messages should start with `fix:`, `feat:`, `refactor:`, `chore:`, or `test:`

- **User Story #28:** You should delete the non existent element, whose `atomic_number` is `1000`, from the two tables

- **User Story #29:** Your `properties` table should not have a `type` column

- **User Story #30:** You should finish your project while on the `main` branch. Your working tree should be clean and you should not have any uncommitted changes

### Project Writeup:

The fourth Free Code Camp: Relational Database project is a program that returns information about periodic elements from a database. Running `element.sh` followed by an argument consisting of an element symbol, name or atomic number will return information about that element, if it is in the database.

The initial database for this project contained some errors that were fixed prior to creating the `periodic_table.sql` database dump.

### Usage

The database can be interacted with using `psql` in linux. First start up a PostgreSQL server using:

`$ sudo service postgresql start`

The periodic table database should then be loaded from the `periodic_table.sql` file using:

`$ psql --dbname=postgres < periodic_table.sql`

Optionally the database can be interacted with directly using:

`$ psql --dbname=postgres`

Once loaded, the bash script can be run for the element information program. (Note that you will have to change the `--username=freecodecamp` option on line 13 of the script to your linux username or remove this entirely):

```bash
$ ./element.sh 1 # Information by atomic number

$ ./element.sh He # Information by element symbol

$ ./element.sh boron # Information by element name
```

Save a dump of the live database using:

`$ pg_dump -cC --inserts periodic_table > periodic_table.sql`

Instructions for building the project can be found at https://www.freecodecamp.org/learn/relational-database/build-a-periodic-table-database-project/build-a-periodic-table-database
