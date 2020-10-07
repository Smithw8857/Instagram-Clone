# Instagram-Clone

## The goal of this project was to recreate a database similar to that of Instagram's 

The first step in achieving this goal was laying out the schema design for our future database.

**Taking a look at Instagram and its structure assisted me in laying out what tables needed to be created, their structure and how each table would relate to one another**


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




### **Schema Design**



#### **Users Table**

**users** |     |            |     |
----------|-----|------------|-----|
  **id**      | int | auto_increment | primary key
  **username** | varchar(255) | unique
  **created_at** | timestamp | 
 

#### **Photos Table**

**photos** |      |       |             |
-----------|------|-------|-------------|
**id** | int | auto_increment | primary key | 
**image_url** | varchar(255) | not null |
**user_id** | int | not null | foreign key |
**created_at** | timestamp |


#### **Comments Table**

**comments** |     |     |         |
-------------|-----|-----|---------|
**id** | int | auto_increment | primary key |
**comment_text** | varchar(255) | not null|
**user_id** | int | not null | foreign key
**photo_id** | int | not null | primary key
**created_at** | timestamp |


#### **Likes Table**

**likes** |      |      |        |
----------|------|------|--------|
**user_id** | int | not null | foreign key
**photo_id** | int | not null | foreign key
**created_at** | timestamp |











