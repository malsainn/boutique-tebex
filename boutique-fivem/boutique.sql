ALTER TABLE `users` ADD coin int;
ALTER TABLE `users` ALTER coin SET DEFAULT '0';
ALTER TABLE `users` MODIFY coin int NOT NULL;