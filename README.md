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
  **created_at** | timestamp | 
 

My first step in creating an Instagram database was to create a table to store users

 **The users table contains 3 columns**
   - an id column
   - a username column
   - a created at column
   





#### **Photos Table**

**photos** |      |       |             |
:-----------:|:------:|:-------:|:-------------:|
**id** | int | auto_increment | primary key | 
**image_url** | varchar(255) | not null |
**user_id** | int | not null | foreign key |
**created_at** | timestamp |


#### **Comments Table**

**comments** |     |     |         |
:-------------:|:-----:|:-----:|:---------:|
**id** | int | auto_increment | primary key |
**comment_text** | varchar(255) | not null|
**user_id** | int | not null | foreign key
**photo_id** | int | not null | primary key
**created_at** | timestamp |


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










