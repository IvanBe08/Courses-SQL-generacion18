
-- Usé los cursos de Academlo como ejemplo

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher" varchar
);

CREATE TABLE "courses_categories" (
  "id" uuid,
  "course_id" uuid,
  "category_id" integer
);

CREATE TABLE "user_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "users_roles" (
  "id" uuid,
  "user_id" uuid,
  "role_id" integer
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "videos_url" (
  "id" uuid,
  "course_id" uuid,
  "videos_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "videos_url" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "videos_url" ADD FOREIGN KEY ("videos_id") REFERENCES "courses_videos" ("id");

-- Intrucciones para poner los datos en sus respectivas tablas
insert into users (
id, 
name, 
email, 
"password", 
age
) values (
'c6054de7-5972-4921-a422-164107f03428', 
'Ivan', 
'ivanbellido24@gmail.com', 
'estudiante', 
24
);

insert into users (
id, 
name, 
email, 
"password", 
age
) values (
'295e0c51-5702-43a0-b487-a4a43592c2b1', 
'Sofia', 
'sofiag@gmail.com', 
'estudiante2', 
23
);

insert into courses (
id, 
title, 
description, 
"level", 
teacher
) values (
'bfdbc827-7c97-4902-bd7e-18ee880120a4', 
'Desarrollo de aplicaciones web con React', 
'El estudiante aprenderá a crear aplicaciones web con React JS, logrando una gran interacción con el usuario usando los conocimientos previos de HTML, CSS y Javascript.', 
'Principiante', 
'Benjamin Flores'
);

insert into courses (
    id,
	title,
	description,
	"level",
	teacher
)
values (
'c74c2d9c-18d5-4ba1-9266-a6f582bb3e00', 
'Fundamentos de Desarrollo web', 
'El estudiante obtendrá las habilidades necesarias para desarrollar de manera correcta la parte visual de un sitio web responsivo sin utilizar librerías/frameworks, así como agregar contenido dinámico con javascript, trabajar de manera colaborativa con git. ', 
'Intermedio', 
'Jesus Fernandez'
);

insert into categories (id, name) values ('247', 'Programacion')

insert into courses_categories (id, course_id, category_id) values ('b5ccea43-9e91-4413-9391-5cd420eb0f0b', 'bfdbc827-7c97-4902-bd7e-18ee880120a4', '247')
insert into courses_categories (id, course_id, category_id) values ('9b8266b5-2919-4fb1-b189-1a1c3825bc5c', 'c74c2d9c-18d5-4ba1-9266-a6f582bb3e00', '247')


insert into roles (id, "name") values ('01', 'Estudiante')
insert into roles (id, "name") values ('02', 'Profesor')

insert into users_roles (id, user_id, role_id) values ('1e8791bf-1813-462b-9d2e-7f10e668ae3a', 'c6054de7-5972-4921-a422-164107f03428', '01')
insert into users_roles (id, user_id, role_id) values ('15fdb1d8-95a1-40fb-be26-a8108ed7bc66', 'c6054de7-5972-4921-a422-164107f03428', '01')

insert into courses_videos (id, title, url) values ('fe8ae3d6-233e-440b-935c-2baa22a5062e', 'Video React', 'https://academlo/cursos/react/01/01')
insert into courses_videos (id, title, url) values ('953aa35b-f54a-4e16-8c4e-f5eb88fb8ab0', 'Video JavaScript', 'https://academlo/cursos/javascript/01/01')

insert into videos_url (id, course_id, videos_id) values ('d72b049f-f1cd-40d1-8422-bb952cc6e325', 'bfdbc827-7c97-4902-bd7e-18ee880120a4', 'fe8ae3d6-233e-440b-935c-2baa22a5062e')
insert into videos_url (id, course_id, videos_id) values ('5e13aba7-3e7c-4a95-8404-6a4018e80a10', 'c74c2d9c-18d5-4ba1-9266-a6f582bb3e00', '953aa35b-f54a-4e16-8c4e-f5eb88fb8ab0')



