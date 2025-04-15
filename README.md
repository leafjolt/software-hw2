# Software Engineering - HW2 (Shaan Desai)
Setup:
The file [script.sql](./script.sql) contains all the statements for initially setting up the database and populating it with initial data.
As you add recipes, they'll get added dynamically to the `recipes` table.
After running the [script.sql](./script.sql) file on your own machine, my code requires a `.env` file to be set up with your own database info for security reasons.
The following environment variables need to be filled out:
```
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME=
```
After filling these out, the site should run on [`localhost:3000`](localhost:3000) with a simple `npm start`!
