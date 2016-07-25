# User story 1
  ## As a User
  ## so that I can see my bookmarked sites
  ## I want to be able to see a list of my links

# User story 2
  ## As a User
  ## So that I can add to my list
  ## I want to be able to add new links

# User story 3
  ## As a User
  ## so that I can append information to the links
  ## I want to be able to tag my saved links

# User story 4
  ## As a User
  ## so that I can view related links
  ## I want to be able to filter using tags

# Extra User story
  ## As a User
  ## So that I can quickly find web sites I recently bookmarked
  ## I would like to see links in descending chronological order

# Domain model
    user <--> bookmark_manager(tags/filters) <--> links <--> web_sites
