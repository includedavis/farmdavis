# FARM Davis

[Heroku Link](https://guarded-savannah-63523.herokuapp.com/)

## Contributing
The code base is version controlled with git. There are tons of tutorials online but github has a decent one [here](https://try.github.io/levels/1/challenges/1).

If you are looking for a visual git client check out:
+ [Github Desktop](https://desktop.github.com/) (Windows/Mac)
+ [Gitkraken](https://www.gitkraken.com/) (Windows/Mac/Linux).

### Best Practices
1. Never work on master!
2. Work on a feature branch. Name the branch something like "user-authentication" or "donation-page".
3. Pull before you work.
4. Commit in present tense. "Add feature" instead of "Added a feature"
5. Only submit pull requests if the code is tested. _(Preferably with RSpec)_

### Running Tests
1. ```$ rspec```
2. For more info: http://rspec.info/

## Running the server

1. ```$ heroku local```  
2. Navigate to _localhost:5000_ in your browser
3. Make sure you have [postgres](https://www.postgresql.org/download) installed on your computer
4. You need the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) to run heroku commands
