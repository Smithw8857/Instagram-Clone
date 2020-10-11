# Instagram-Clone

## The goal of this project was to recreate a database similar to that of Instagram's 

The first step in achieving this goal was laying out the schema design for our future database.

**Taking a look at Instagram and its structure assisted me in laying out what tables needed to be created, their structure and how each table would relate to one another**


![](Images/Image%20Section.jpg)
![](Images/User%20Section.jpg)



**As seen above, Instagram stores**

 * users

 * photos/pictures

 * likes

 * comments

 * hashtags

 * followers

 * followees


**In order to achieve my goal, I would need to create tables representing these elements in my database**




### **Schema Design**



#### **Users Table**

**users** |     |            |     |
:----------:|:-----:|:------------:|:-----:|
  **id**      | int | auto_increment | primary key
  **username** | varchar(255) | unique
  **created_at** | timestamp default(now) | 
 

My first step in creating an Instagram database was to create a table to store users

 **The users table contains 3 columns**
   - an id column
   - a username column
   - a created_at column
   
**This table's goal is to store and display each individual user by an id number, their username as well as the date and time the user's account was created**
   
The **id** column gives each user a unique id number. The column is set to auto increment, allowing each new stored user to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The **username** column stores each username. The column is set to be unique, requiring each username to be distinct.

The **created_at** column is to mark a date and time a user is created. The column is set to be a timestamp. When a new user is entered the timestamp value will default to the current time and date that the user was entered.


Next, I created the photos table.

#### **Photos Table**

**photos** |      |       |             |
:-----------:|:------:|:-------:|:-------------:|
**id** | int | auto_increment | primary key | 
**image_url** | varchar(255) | not null |
**user_id** | int | not null | foreign key references users(id) |
**created_at** | timestamp default(now) |


**The photos table contains 4 columns**
   - an id column
   - an image_url column
   - a user_id column
   - a created_at column

**This table's goal is to store and display each individual photo using an id number, their image url, the user who submitted the photo as well as the date and time the photo was submitted**


The **id** gives each photo a unique id number. The column is set to auto increment, allowing each new stored photo to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The **image_url** displays the url for each image. The column is set to not null, requiring a value to be filled in the image_url column

The **user_id** column allows to see who posted a photo referenced by thier user id. The column is set to not null, requiring a value to be filled in the **user_id** column, therefore requiring each photo submitted to be related to a user in the database. This is achieved by making the **user_id** column a foreign key that references the **id** column from the **users** table. This allows the photos table to not only store the information of each inserted photo, but also store which user submitted each photo, signified by their **id** number stored in the **users** table.

The **created_at column** is to mark a date and time a photo is posted. The column is set to be a timestamp. When a new photo is entered, the timestamp value will default to the current time and date that the photo was entered.

I required values from both the users and photos tables in order to create a proper comments and likes table. With those completed, I started creating the table that would store user comments.  


#### **Comments Table**

**comments** |     |     |         |
:-------------:|:-----:|:-----:|:---------:|
**id** | int | auto_increment | primary key |
**comment_text** | varchar(255) | not null|
**user_id** | int | not null | foreign key references users(id) |
**photo_id** | int | not null | foreign key references photos(id) | 
**created_at** | timestamp default(now) |

**The comments table contains 5 columns**
   - an id column
   - an comment_text column
   - a user_id column
   - a photo_id column
   - a created_at column
   
**This table's goal is to store and display each comment made on a photo, who submitted the comment, which photo it was submitted on as well as the date and time the comment was created at** 


The **id** column gives each stored comment a unique id number. The column is set to auto increment, allowing each new stored comment to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The **comment_text** displays the text of each comment. The comment_text column is set to not null, requiring a value to be filled in the **comment_text** column preventing users from submitting any blank comments.

The **user_id** column allows us to see which user made each stored comment represented by a user id. The column is set to not null, requiring a value to be filled in the **user_id** column, therefore requiring each comment submitted to be related to a user in the database. This is achieved by making the **user_id** column a foreign key that references the **id** column from the **users** table. This allows the **comments** table to not only store each comment made, but also store which user wrote each, signified by their **id** number stored in the **users** table.

The **photo_id** column allows us to see which photo each stored comment was made in reference to represented by a photo id. The column is set to not null, requiring a value to be filled in the **photo_id** column, therefore requiring each comment submitted to be related to a photo in the database. This is achieved by making the **photo_id** column a foreign key that references the **id** column from the **photos** table. This allows the **comments** table to store which photo each comment was made on.

The **created_at column** is to mark the date and time a comment is made. The column is set to be a timestamp. When a new comment is written, the timestamp value will default to the current time and date that the comment was entered.

Next, I created the likes table.

#### **Likes Table**

**likes** |      |      |        |            |
:----------:|:------:|:------:|:--------:|:-----:|
**user_id** | int | not null | foreign key references users(id) | primary key |
**photo_id** | int | not null | foreign key references photos(id) | primary key |
**created_at** | timestamp default(now) |

**The likes table contains 3 columns**
   - a user_id column
   - a photo_id column
   - a created_at column
   
**This table's goal is to store each individual like by the user who likes a photo, the photo that is being liked as well as the date and time a like is made**

The **user_id** column allows us to see which user made each stored like represented by their user id. The column is set to not null, requiring a value to be filled in the **user_id** column, therefore requiring each like made to be related to a user in the database. This is achieved by making the **user_id** column a foreign key that references the **id** column from the **users** table. This allows the **likes** table to store which user liked a photo, signified by their **id** number stored in the **users** table. **user_id** is also a primary key, preventing users from liking the same photo more than once.

The **photo_id** column allows us to see which photo the like was made in reference to represented by a photo id. The column is set to not null, requiring a value to be filled in the **photo_id** column, therefore requiring each like to be related to a photo in the database. This is achieved by making the **photo_id** column a foreign key that references the **id** column from the **photos** table. This allows the **likes** table to relate each photo to a like. **photo_id** is also a primary key, preventing the same photo from recieving multiple likes from one user


The **created_at column** is to mark the date and time a like is made. The column is set to be a timestamp. When a new like is made, the timestamp value will default to the current time and date that the like was made.


#### **Follows Table**

**follows** |      |       |        |        |
:------------:|:------:|:-------:|:--------:|:--------:|
**follower_id** | int | not null | foreign key references users(id)| primary key |
**followee_id** | int | not null | foreign key references users(id) | primary key |
**created_at** | timestamp default(now) |


**The follows table contains 3 columns**
   - a follower_id column
   - a followee_id column
   - a created_at column
   
**This table's goal is to display users who are following other users. This is achieved by displaying a user (displayed by their user id) who follwed someone, the user (displayed by their user id) who recieved a follow as well as the date and time the follow is performed**

The **follower_id** column allows us to see which user is following someone, represented by the follower's user id. The column is set to not null, requiring a value to be filled in the **follower_id** column, therefore requiring each follow made to be from a user in the database. This is achieved by making the **follower_id** column a foreign key that references the **id** column from the **users** table. This allows the **follows** table to store which user followed someone, signified by their **id** number stored in the **users** table. **follower_id** is also a primary key, preventing users from following the same user multiple times.

The **followee_id** column allows us to see which user has recieved the follow, represented by the followee's user id. The column is set to not null, requiring a value to be filled in the **followee_id** column, therefore requiring each follow made to be related to a user in the database. This is achieved by making the **followee_id** column a foreign key that references the **id** column from the **users** table. This allows the **follows** table to store which user recieved a follow, signified by their **id** number stored in the **users** table. **followee_id** is a primary key, preventing a user from recieving multiple follows from the same user.

The **created_at column** is to mark the date and time a follow is made. The column is set to be a timestamp. When a new follow is made, the timestamp value will default to the current time and date that the follow was made.


#### Hashtag Tables

**The process of storing hashtags proved to be a bit of a challenge but was achieved by creating two separate tables. One table (tags) stores all the hashtags made and assigning them an id. The other table (pho stores which photos are taged with corresponding hashtags using photo_id and tag_id.**  

**tags** |      |       |         |
:---------:|:------:|:-------:|:---------:|
**id** | int | auto increment | primary key |
**tag_name** | varchar(255) | unique |
**created_at** | timestamp | 

**The tags table contains 3 columns**
   - an id column
   - a tag_name column
   - a created_at column

**This table's goal is to store each hashtag into our database. This is achieved by assigning each tag a unique id, displaying the tag name as well as a date and time the tag was created first**

The **id** column gives each stored tag a unique id number. The column is set to auto increment, allowing each new stored tag to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The **tag_name** column stores each hashtag. The column is set to be unique, requiring each tag to be distinct.

The **created_at column** is to mark the date and time a tag is made. The column is set to be a timestamp. When a new tag is made, the timestamp value will default to the current time and date that the tag was made.



**photo_tags** |       |      |        |         |
:---------:|:-------:|:------:|:--------:|:---------:|
**photo_id** | int | not null | foreign key references photos(id)| primary key |
**tag_id** | int | not null | foriegn key references tags(id)| primary key |

**The photo_tags table contains 2 columns**
   - a photo_id column
   - a tag_id column
   
**This table's goal is to display which photos have recieved which hashtags. This is achieved by displaying the photo id of the photo recieving the hashtag and the tag id of the hashtag used on the photo**
   
The **photo_id** column allows us to see which photo has recieved the tag, represented by the photo's photo id. The column is set to not null, requiring a value to be filled in the **photo_id** column, therefore requiring each tag made to be related to a photo in the database. This is achieved by making the **photo_id** column a foreign key that references the **id** column from the **photos** table. This allows the **photo_tags** table to store which photo recieved a tag, signified by its **id** number stored in the **photos** table. **photo_id** is a primary key, preventing a photo from recieving the same tag more than once.

The **tag_id** column allows us to see which tag is being used on a photo, represented by the tags's tag id. The column is set to not null, requiring a value to be filled in the **tag_id** column, therefore requiring each photo that recieves a tag, that tag is in the database. This is achieved by making the **tag_id** column a foreign key that references the **id** column from the **tags** table. This allows the **photo_tags** table to which tag a photo recieved by its **id** number stored in the **tags** table. **tag_id** is a primary key, preventing a photo from recieving the same tag more than once.

#### The complete schema code for this database can be found in the insta_schema.sql folder located in this repository.

### Database Diagram

![](Images/Database%20Diagram.jpg)

**Above is a database diagram to help visually represent my database and the relationships between tables** 

### Inserting Data

Following the completion of all the tables in my database, I bulk inserted 500 users into my database. This data can be seen in this repository's insta_data.sql file. 


### Working with the Data



### Final Thoughts






