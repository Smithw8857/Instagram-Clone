# Instagram-Clone

## The goal of this project was to recreate a database similar to that of Instagram's 

The first step in achieving this goal was laying out the schema design for our future database.

**Taking a look at Instagram and its structure assisted me in laying out what tables needed to be created as well as how each table would relate to one another**


![](Images/Image%20Section.jpg)
![](Images/User%20Section.jpg)



**As seen above, Instagram stores**


-users

-photos/pictures

-likes

-comments

-hashtags

-followers

-followees


**In order to achieve my goal, I would need to create tables representing these elements in my database**


## Users Table

**users** |     |            | 
----------|-----|------------|
  id      | int | primary key
  username| varchar | unique
  created_at| timestamp | 
 


