# Software Engineering - HW2 (Shaan Desai)
Setup:
The file [`script.sql`] contains all the statements for initially setting up the database and populating it with initial data.
As you add recipes, they'll get added to the `recipes` table.
After running the [`script.sql`] file on your own machine, my code requires a `.env` file to be set up for security reasons.
The following environment variables need to be filled out:
```
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME=
```
After filling these out, the site should run with a simple `npm start`!