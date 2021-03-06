DELETE Characters;
DELETE Actors;

DBCC CHECKIDENT ('dbo.Actors', RESEED, 0);
DBCC CHECKIDENT ('dbo.Characters', RESEED, 0);

INSERT Actors ([Name]) VALUES (N'Billy West');
INSERT Actors ([Name]) VALUES (N'Katey Sagal');
INSERT Actors ([Name]) VALUES (N'John DiMaggio');
INSERT Actors ([Name]) VALUES (N'Lauren Tom');
INSERT Actors ([Name]) VALUES (N'Phil LaMarr');

INSERT Characters (ActorId, [Name], Species, Planet) VALUES (1, N'Philip J. Fry', N'Human', N'Earth');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (2, N'Turanga Leela', N'Mutant, Human', N'Earth');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (3, N'Bender Bending Rodriquez', N'Robot', N'Tijuana, Baja California');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (1, N'John A. Zoidberg', N'Decapodian', N'Decapod 10');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (4, N'Amy Wong', N'Human', N'Mars');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (5, N'Hermes Conrad', N'Human', N'Earth');
INSERT Characters (ActorId, [Name], Species, Planet) VALUES (1, N'Hubert J. Farnsworth', N'Human', N'Earth');
