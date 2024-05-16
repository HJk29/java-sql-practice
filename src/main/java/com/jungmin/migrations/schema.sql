CREATE table Users (
    user_id bigint not null auto_increment primary key,
    username varchar(255) not null UNIQUE,
    email varchar(255) not null UNIQUE,
    password varchar(255) not null,
    created_at datetime not null default CURRENT_TIMESTAMP
);

CREATE table Boards (
  board_id bigint not null auto_increment primary key,
  name varchar(255) not null,
  description text
);

CREATE table Posts(
  post_id bigint not null auto_increment primary key,
  title varchar(255) not null,
  content text not null,
  user_id bigint,
  board_id bigint,
    foreign key (user_id) REFERENCES Users (user_id),
    foreign key (board_id) REFERENCES Boards(board_id),
  created_at datetime not null default CURRENT_TIMESTAMP
);
CREATE table Comments(
  comment_id bigint not null auto_increment primary key,
    content text not null,
    user_id bigint,
    post_id bigint,
    created_at datetime not null default CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) references Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

Create table Tags(
  tag_id bigint not null auto_increment primary key,
    name varchar(255) not null unique
);
Create table Post_tags(
  post_id bigint not null,
  tag_id bigint not null,
  FOREIGN KEY (post_id) references Posts(post_id),
    FOREIGN KEY (tag_id) references Tags(tag_id)
);

