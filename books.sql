CREATE TABLE books(
  bid INT PRIMARY KEY,
  title TEXT,
  image TEXT,
  year SMALLINT,
  pages SMALLINT,
  language TEXT
);

  'English'),

  'Danish'),

  'Italian'),

  'Akkadian'),

  'Hebrew'),

  'Arabic'),

  'Old Norse'),

  'English'),

  'French'),

  'French, English'),

  'Italian'),

  'Spanish'),

  'English'),

  'French'),

  'German'),

  'French'),

  'Spanish'),

  'English'),

  'Russian'),

  'English'),

  'English'),

  'French'),

  'German'),

  'Russian'),

  'Russian'),

  'Russian'),

  'Russian'),

  'English'),

  'English'),

  'Greek'),

  'English'),

  'English'),

  'French'),

  'French'),

  'Spanish'),

  'Spanish'),

  'Spanish'),

  'German'),

  'Russian'),

  'German'),

  'Portuguese'),

  'Norwegian'),

  'English'),

  'Greek'),

  'Greek'),

  'Norwegian'),

  'English'),

  'German'),

  'German'),

  'German'),

  'Sanskrit'),

  'Japanese'),

  'Greek'),

  'English'),

  'Icelandic'),

  'Italian'),

  'English'),

  'Swedish'),

  'Chinese'),

  'Arabic'),

  'German'),

  'German'),

  'English'),

  'French'),

  'Italian'),

  'English'),

  'Japanese'),

  'German'),

  'English'),

  'English'),

  'Classical Latin'),

  'Portuguese'),

  'English'),

  'French'),

  'French'),

  'Spanish'),

  'Persian'),

  'English'),

  'Persian'),

  'Arabic'),

  'Portuguese'),

  'English'),

  'English'),

  'English'),

  'Greek'),

  'French'),

  'English'),

  'Italian'),

  'English'),

  'Russian'),

  'Russian'),

  'Russian'),

  'English'),

  'Sanskrit'),

  'Classical Latin'),

  'Sanskrit'),

  'English'),

  'English'),

  'English'),

  'French');

  aid INT PRIMARY KEY,
  name TEXT,
  country TEXT
);

  bid INT REFERENCES books(bid) ON UPDATE CASCADE ON DELETE CASCADE,
  aid INT REFERENCES authors(aid) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY(bid,aid)
);





















































































































































































