CREATE TABLE IF NOT EXISTS public.readers (
  id_reader serial PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  surname VARCHAR(50),
  addres VARCHAR(255),
  phone_num VARCHAR(12)
);

CREATE TABLE IF NOT EXISTS public.publishing_houses (
  id_publishing_house serial PRIMARY KEY,
  publisher_name VARCHAR(255),
  city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS public.books (
  id_book serial PRIMARY KEY,
  title VARCHAR(255),
  id_publishing_house INTEGER,
  FOREIGN KEY (id_publishing_house) REFERENCES publishing_houses (id_publishing_house) ON DELETE SET NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INTEGER NOT NULL,
  page_count INTEGER NOT NULL,
  price FLOAT,
  copy_count INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS public.book_rental (
  id_rental serial PRIMARY KEY,
  id_reader INTEGER,
  id_book INTEGER,
  FOREIGN KEY (id_reader) REFERENCES readers (id_reader) ON DELETE SET NULL,
  FOREIGN KEY (id_book) REFERENCES books (id_book) ON DELETE SET NULL,
  issued DATE NOT NULL,
  returned DATE
);