INSERT INTO `resource` (`id_resource`, `id_cat`, `name`, `path`, `visibility`) VALUES
(11, 2, 'cvbcvb', 'cvbcvb', 0),
(12, 1, 'Vidéo 1', 'dsf', 1),
(13, 2, 'PDF 1', 'zeze', 3),
(14, 1, 'Vidéo 2', 'er', 1),
(15, 2, 'PDF 2', 'zeze', 1),
(16, 1, 'Vidéo fsdsfd', 'sdfsdf', 3),
(17, 1, 'Vidéo gfddsf', 'dff', 2),
(18, 2, 'PDF erfsdgdxdf', 'fdsfgfsdgfg', 3),
(19, 1, 'Vidéodsqfdfqsdf', 'sdfsdf', 3),
(20, 2, 'PDF zrzer', 'eter', 1),
(21, 1, 'Vidéodqdqd', 'sdf', 1),
(22, 2, 'PDF fdfgdfgfg', 'dsfgd', 1),
(23, 1, 'Vidéosdfsdf', 'sdfsdf', 1),
(24, 2, 'PDF\r\nhfghgfh', 'qsdqsdqsd', 1),
(25, 1, 'Vidéo sqdfqsdsd', 'qsfsddf', 1);

INSERT INTO `theme` (`id_theme`, `name`) VALUES
(1, 'RH'),
(2, 'TEST TH'),
(3, 'TEST2 THEME'),
(4, 'TEST 3 THEME');


INSERT INTO `theme_to_ressources` (`id_theme`, `id_ressource`) VALUES
(1, 15),
(3, 15),
(4, 17);

INSERT INTO `users` (`id_users`, `firstname`, `lastname`, `email`, `password`, `phone`, `birthday`, `user_level`, `adresse`, `in_post`, `free_date`, `job_search`, `job_name`, `job_date`, `id_enterprise`, `enterprise_name`, `signin_options`) VALUES
(1, 'Pierre', 'Dupont', 'pdupont@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$TjBtb7+zxRDu+ruGC6w6/w$/gLrwRKGswrdhW6OqIoMUuPKqoMUoyTvfFvGmjD2huI', NULL, NULL, 1, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 7),
(4, 'jean', 'Némarre', 'jean.nemarre@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$PDNntMzECe/hvaNaZUkxnQ$sT4D7lEjO3OFQENYEqVQUDQbW1FK75ghUp/Fe52Wjak', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 3),
(5, 'jean', 'Cérien', 'jean.cerien@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$HvvTsaK9/0Xc1hZx8ZHqgg$gfp2/WvoOLYP6Lvm3LDGIKf9lpBhAPECTESNTNA/ZHc', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 2),
(6, 'Jérémie', 'Piazza', 'jeremie@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$vZNOjRxkfrnoAUN7+dsrxg$Z5SmKLyLIcFZQ6Xz2KCY4D8y/Aw8FQIHzaxw5fXMA7U', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1),
(7, 'a', 'b', 'ab@b.com', '$argon2id$v=19$m=65536,t=5,p=1$LQZcR0ErvGgZZhUmP+lKSA$u/DzN3UQpZGeKLFRWuO8fAQAdGD2VNKSPV61T9NrDIE', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1),
(8, 'a', 'v', 'av@b.com', '$argon2id$v=19$m=65536,t=5,p=1$ZiJAZPuvPNRXiUtWQrhPwA$hWt9iNEhfSyPh35F46vNv5kZ9Alcq3rJGvoUMHbs3uw', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1),
(9, 'titi', 'Toto', 'toto@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$mBk+Q4oDHB/0Vgq/y0NNwA$LJJBZ1aNhE98odOLnDXkp61vhsjs0FhKg0nhAMG9i3Y', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1),
(10, 'titi', 'Toto', 'toto2@gmail.com', '$argon2id$v=19$m=65536,t=5,p=1$CeuyhQxON2gkIlALwRayMw$NlpBYc7Y1UnJBYo5nDdm72MMZjMaBiMw3lgTKQ/67ss', NULL, NULL, 2, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1),
(11, 'toto', 'tutu', 'baba@free.fr', '$argon2id$v=19$m=65536,t=5,p=1$bdMdajVyC7Z6NYFKbDm/6Q$pymfsEkOXSFa44q2x6ZHIM5WlyMOVKVzeW1CavyLBtc', NULL, NULL, 5, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 1);

INSERT INTO `opinion` (`id_opinion`, `id_user`, `opinion`, `id_enterprise`, `is_valid`) VALUES
(1, 1, 'Sed erat ante, porta in ultrices id, porttitor at lacus. Vivamus tellus lacus, mollis in lectus nec, molestie pulvinar nibh. Nunc tempus tempus odio, nec faucibus ante molestie ac. Sed vitae nulla lorem. Nam et scelerisque risus. Etiam convallis, ex in vehicula convallis, ipsum dui aliquet mi, et hendrerit quam lectus pellentesque lacus. Phasellus ullamcorper, nibh id ultrices iaculis, urna lacus molestie massa, quis scelerisque arcu est ac sapien. ', 2, 1),
(5, 5, 'Très bonne entreprise', 2, 1),
(6, 10, 'Expérience parfaite', 2, 1),
(7, 8, 'A refaire', 2, 0),
(8, 7, 'A refaire', 2, 0);

ALTER TABLE `event_to_user`  ADD `is_valid` BOOLEAN NOT NULL DEFAULT FALSE  AFTER `is_owner`;


INSERT INTO `resource` (`id_resource`, `id_cat`, `name`, `path`, `visibility`) VALUES
(1, 2, '5 astuces pour ne pas angoisser avant un entretien part 1', 'aaa', 1 ),
(2, 2, 'La prime Macron part 1', 'bbb', 1 ),
(3, 2, 'Que recherche une entreprise part 1', 'ccc', 1 ),
(4, 2, 'Comment bien préparer un entretien part 1', 'ddd', 1 ),
(5, 2, 'Les questions à poser lors d un entretien part 1', 'eee', 1 ),
(6, 2, 'Comment se renseigner sur une entreprise part 1', 'fff', 1 ),
(7, 2, 'Comment aborder la question du salaire part 1', 'ggg', 1 ),
(8, 2, 'Quels défauts dire en entretien part 1', 'hhh', 1 ),
(9, 2, 'Comment faire face aux questions destabilisantes part 1', 'iii', 1 ),
(10, 2, 'Comment mettre en avant ses compétences part 1', 'jjj', 1 ),
(11, 2, '5 astuces pour ne pas angoisser avant un entretien part 2', 'aaa', 2 ),
(12, 2, 'La prime Macron part 2', 'bbb', 2 ),
(13, 2, 'Que recherche une entreprise part 2', 'ccc', 2 ),
(14, 2, 'Comment bien préparer un entretien part 2', 'ddd', 2 ),
(15, 2, 'Les questions à poser lors d un entretien part 2', 'eee', 2 ),
(16, 2, 'Comment se renseigner sur une entreprise part 2', 'fff', 2 ),
(17, 2, 'Comment aborder la question du salaire part 2', 'ggg', 2 ),
(18, 2, 'Quels défauts dire en entretien part 2', 'hhh', 2 ),
(19, 2, 'Comment faire face aux questions destabilisantes part 2', 'iii', 2 ),
(20, 2, 'Comment mettre en avant ses compétences part 2', 'jjj', 2 ),
(21, 3, 'Plombier', 'aaabbb', 1 ),
(22, 3, 'Développeur web', 'bbbccc', 1 ),
(23, 3, 'Carreleur', 'cccddd', 1 ),
(24, 3, 'Stripteaseur', 'dddeee', 1 ),
(25, 3, 'Conducteur de bus', 'eeefff', 1 ),
(26, 3, 'Comptable', 'fffggg', 1 ),
(27, 3, 'Technicien de laboratoire', 'ggghhh', 1 ),
(28, 3, 'Agent de sécurité', 'hhhiii', 1 ),
(29, 3, 'Commercial', 'iiijjj', 1 ),
(30, 3, 'agent d entretien', 'jjjkkk', 1 ),
(31, 3, 'Conducteur de travaux', 'aaaccc', 2 ),
(32, 3, 'Barman', 'bbbddd', 2 ),
(33, 3, 'Serveur', 'ccceee', 2 ),
(34, 3, 'Boucher', 'dddfff', 2 ),
(35, 3, 'Boulanger', 'eeeggg', 2 ),
(36, 3, 'Banquier', 'fffhhh', 2 ),
(37, 3, 'Prêtre', 'gggiii', 2 ),
(38, 3, 'Mécanicien', 'hhhjjj', 2 ),
(39, 3, 'Assistante maternelle', 'iiikkk', 2 ),
(40, 3, 'Dogsitter', 'jjjlll', 2 ),
(41, 1, 'Vidéo 1 part 1', 'https://www.youtube.com/embed/244YJXYE7Mg', 1 ),
(42, 1, 'Vidéo 2 part 1', 'https://www.youtube.com/embed/KKOHoN9ikGw', 1 ),
(43, 1, 'Vidéo 3 part 1', 'https://www.youtube.com/embed/9RdbUDTXjFs', 1 ),
(44, 1, 'Vidéo 4 part 1', 'https://www.youtube.com/embed/L6rB3C1SaLk', 1 ),
(45, 1, 'Vidéo 5 part 1', 'https://www.youtube.com/embed/0Aa8WMkt9T8', 1 ),
(46, 1, 'Vidéo 6 part 1', 'https://www.youtube.com/embed/p7azMCA_9Lg', 1 ),
(47, 1, 'Vidéo 7 part 1', 'https://www.youtube.com/embed/5DG6M2Q9uIQ', 1 ),
(48, 1, 'Vidéo 8 part 1', 'https://www.youtube.com/embed/ePFrJ4QGbg8', 1 ),
(49, 1, 'Vidéo 9 part 1', 'https://www.youtube.com/embed/D9CpDzcxb5M', 1 ),
(50, 1, 'Vidéo 10 part 1', 'https://www.youtube.com/embed/AmL-cYGJDbY', 1 ),
(51, 1, 'Vidéo 1 part 2', 'https://www.youtube.com/embed/MbsDJTQ_a5Q', 2 ),
(52, 1, 'Vidéo 2 part 2', 'https://www.youtube.com/embed/TWvrFfU-iV8', 2 ),
(53, 1, 'Vidéo 3 part 2', 'https://www.youtube.com/embed/QrLYAvUG7DM', 2 ),
(54, 1, 'Vidéo 4 part 2', 'https://www.youtube.com/embed/e8C5JqPSg6A', 2 ),
(55, 1, 'Vidéo 5 part 2', 'https://www.youtube.com/embed/2N3nF93ySaY', 2 ),
(56, 1, 'Vidéo 6 part 2', 'https://www.youtube.com/embed/FV2ug950tnI', 2 ),
(57, 1, 'Vidéo 7 part 2', 'https://www.youtube.com/embed/VigGlZpbbW0', 2 ),
(58, 1, 'Vidéo 8 part 2', 'https://www.youtube.com/embed/vT-lZVKihKI', 2 ),
(59, 1, 'Vidéo 9 part 2', 'https://www.youtube.com/embed/_CO8oiFrQ_U', 2 ),
(60, 1, 'Vidéo 10 part 2', 'https://www.youtube.com/embed/RNMe5gJv2CM', 2 );







