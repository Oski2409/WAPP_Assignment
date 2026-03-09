INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES

(1,
'What aperture is commonly used for landscape photography?',
'f/1.8',
'f/16',
'f/2.8',
'f/4',
'B'),

(1,
'What time of day provides the best natural lighting for landscapes?',
'Midnight',
'Golden hour',
'Noon',
'Afternoon',
'B'),

(1,
'Which lens type is best suited for landscape photography?',
'Telephoto lens',
'Wide angle lens',
'Macro lens',
'Portrait lens',
'B'),

(1,
'Why is a tripod useful in landscape photography?',
'To increase zoom',
'To stabilize the camera',
'To change colors',
'To improve autofocus',
'B'),

(1,
'What composition rule is commonly used in landscapes?',
'Rule of thirds',
'Rule of shadows',
'Rule of colors',
'Rule of symmetry',
'A');



/*adding quizzes for other categories*/
INSERT INTO Quizzes (TutorialID, Title, Description, CreatedBy)
VALUES
(1,'Landscape Photography Quiz','Test landscape photography knowledge',1),
(2,'Wildlife Photography Quiz','Test wildlife photography knowledge',1),
(3,'Portrait Photography Quiz','Test portrait photography knowledge',1),
(9,'Street Photography Quiz','Test street photography knowledge',1),
(5,'Architectural Photography Quiz','Test architectural photography knowledge',1),
(6,'Videography Basics Quiz','Test videography knowledge',1),
(7,'Lighting Techniques Quiz','Test lighting knowledge',1),
(8,'Photo Editing Quiz','Test editing knowledge',1);