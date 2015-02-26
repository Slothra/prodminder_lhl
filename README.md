```
      .--.
   ."";  |
   |  |  |
   |  |  |
   |  |  |
   |  |  |--._
   |  | _|  | `|
   |  /` )  |  |
   | /  /'--:__/
   |/  /       |
   (  ' \      |
    \    `.   /
     |       |
     |       |

```

# Prodminder
Midterm Project for Lighthouse Labs

## Running the Project

1. `bundle install`
2. `shotgun config.ru`
3. In your browser goto `http://localhost:9393/`
4. Boom success!

### Git work flow for working on featuress

* `git checkout master`
* `git pull` look for `Everything is up to date`
* `git checkout -b feature_branch_name`
* `git commit` and `git push feature_branch_name origin` as many times as you like
  * This will only commit and push your work to the origin (remote server), thus allowing you a copy of your work in case you fuck up.

When merging these features back in, we'll do two things, one command you might not be aware of.

* `git checkout master`
* `git pull` look for `Everything is up to date`
  * grab latest commites from master
* `git checkout feature_branch_name`
  * switch to feature branch
* `git rebase master`
  * this will merge in the latest commits from master on top of your local branch, this may result in git conflicts.
