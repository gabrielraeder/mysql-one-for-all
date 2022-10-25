DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan VARCHAR(50) NOT NULL,
      valor_plano DOUBLE NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.artist(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      release_year INT(4) NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.songs(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      album_id INT NOT NULL,
      duration INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      plan_id INT NOT NULL,
      age INT NOT NULL,
      signature_date DATE NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.historic(
      user_id INT NOT NULL,
      song_id INT NOT NULL,
      play_date DATETIME NOT NULL DEFAULT NOW(),
      PRIMARY KEY (user_id, song_id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.songs(song_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.user_artist(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      PRIMARY KEY (user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.plans (plan, valor_plano)
	VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    
  INSERT INTO SpotifyClone.artist (nome)
	VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
  INSERT INTO SpotifyClone.albuns (nome, artist_id, release_year)
	VALUES
    ('Renaissance', 1, 2022),
    ('Jazz',2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);
    
  INSERT INTO SpotifyClone.songs (nome, album_id, duration)
	VALUES
    ('BREAK MY SOUL', 1, 279),
    ("VIRGO’S GROOVE", 1, 369),
    ('ALIEN SUPERSTAR', 1, 116),
    ("Don’t Stop Me Now", 2, 203),
    ('Under Pressure', 3, 152),
    ('Como Nossos Pais', 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Samba Em Paris', 6, 267),
    ("The Bard’s Song", 7, 244),
    ('Feeling Good', 8, 100);
    
  INSERT INTO SpotifyClone.users (nome, plan_id, age, signature_date)
	VALUES
    ('Barbara Liskov', 1, 82, '2019-10-20'),
    ('Robert Cecil Martin', 1, 58, '2017-01-06'),
    ('Ada Lovelace', 2, 37, '2017-12-30'),
    ('Martin Fowler', 2, 46, '2017-01-17'),
    ('Sandi Metz', 2, 58, '2018-04-29'),
    ('Paulo Freire', 3, 19, '2018-02-14'),
    ('Bell Hooks', 3, 26, '2018-01-05'),
    ('Christopher Alexander', 4, 85, '2019-06-05'),
    ('Judith Butler', 4, 45, '2020-05-13'),
    ('Jorge Amado', 4, 58, '2017-02-17');
    
  INSERT INTO SpotifyClone.historic (user_id, song_id, play_date)
	VALUES
    (1, 8, "2022-02-28 10:45:55"),
    (1, 2, "2020-05-02 05:30:35"),
    (1, 10, "2020-03-06 11:22:33"),
    (2, 10, "2022-08-05 08:05:17"),
    (2, 7, "2020-01-02 07:40:33"),
    (3, 10, "2020-11-13 16:55:13"),
    (3, 2, "2020-12-05 18:38:30"),
    (4, 8, "2021-08-15 17:10:10"),
    (5, 8, "2022-01-09 01:44:33"),
    (5, 5, "2020-08-06 15:23:43"),
    (6, 7, "2017-01-24 00:31:17"),
    (6, 1, "2017-10-12 12:35:20"),
    (7, 4, "2011-12-15 22:30:49"),
    (8, 4, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (10, 3, "2015-12-13 08:30:22");
    
  INSERT INTO SpotifyClone.user_artist (user_id, artist_id)
	VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
