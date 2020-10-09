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
   
The id column is set to auto increment, allowing each new stored user to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The username column is set to be unique, requiring each username to be distinct.

The created_at column is set to be a timestamp. When a new user is entered the timestamp value will default to the current time and date that the user was entered.


Next, I created the photos table.

#### **Photos Table**

**photos** |      |       |             |
:-----------:|:------:|:-------:|:-------------:|
**id** | int | auto_increment | primary key | 
**image_url** | varchar(255) | not null |
**user_id** | int | not null | foreign key references users(id) |
**created_at** | timestamp default(now) |


**The photos table contains 3 columns**
   - an id column
   - an image_url column
   - a user_id column
   - a created_at column


The photo column is set to auto increment, allowing each new stored photo to be automatically issued an id number. the id column is also a primary key, requiring the id value to be unique as well as to prevent any null variables.

The image_url table is set to not null, requiring a value to be filled in the image_url column

The user_id table is set to not null, requiring a value to be filled in the user_id column, therefore requiring each photo submitted to be related to a user in the database. This is achieved by making the user_id column a foreign key that references the id column from the users table. This allows the photos table to not only store the information of each inserted photo, but also store which user submitted each photo, signified by their user_id number.

The created_at column is set to be a timestamp. When a new photo is entered the timestamp value will default to the current time and date that the user was entered.



#### **Comments Table**

**comments** |     |     |         |
:-------------:|:-----:|:-----:|:---------:|
**id** | int | auto_increment | primary key |
**comment_text** | varchar(255) | not null|
**user_id** | int | not null | foreign key
**photo_id** | int | not null | primary key
**created_at** | timestamp default(now) |


#### **Likes Table**

**likes** |      |      |        |
:----------:|:------:|:------:|:--------:|
**user_id** | int | not null | foreign key
**photo_id** | int | not null | foreign key
**created_at** | timestamp |


#### **Follows Table**

**follows** |      |       |        |        |
:------------:|:------:|:-------:|:--------:|:--------:|
**follower_id** | int | not null | foreign key | primary key |
**followee_id** | int | not null | foreign key | primary key |
**created_at** | timestamp |



#### Hashtag Tables

**tags** |      |       |         |
:---------:|:------:|:-------:|:---------:|
**id** | int | auto increment | primary key |
**tag_name** | varchar(255) | unique |
**created_at** | timestamp | 



**photo_tags** |       |      |        |         |
:---------:|:-------:|:------:|:--------:|:---------:|
**photo_id** | int | not null | foreign key| primary key |
**tag_id** | int | not null | foriegn key | primary key |










