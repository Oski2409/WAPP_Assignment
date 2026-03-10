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



/*adding quizzes for  tutorials*/
INSERT INTO Quizzes (TutorialID, Title, Description, CreatedBy)
VALUES
(1,'Aperture Basics Quiz','Test understanding of aperture and depth of field',1),
(2,'ISO and Shutter Speed Quiz','Test understanding of ISO and shutter speed',1),
(3,'Natural Lighting Quiz','Test knowledge of natural lighting techniques',1),
(4,'Composition Rules Quiz','Test knowledge of rule of thirds and framing',1),
(5,'Smartphone Photography Quiz','Test smartphone photography techniques',1);

/*After that run these to add questions*/
INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES
(23,'What does aperture control?','Camera battery','Amount of light entering lens','Image color','Zoom level','B'),
(23,'What happens when you use a low f-number?','Less light','More light and blurry background','Sharper image','No change','B'),
(23,'Which f-stop gives the most depth of field?','f/1.8','f/2.8','f/16','f/4','C'),
(23,'A wide aperture results in what effect?','Blurry background','Darker photo','Higher ISO','More noise','A');

INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES
(24,'What does ISO control?','Lens zoom','Sensor sensitivity to light','Focus','Image resolution','B'),
(24,'High ISO can cause what issue?','Noise in image','Blur','Overexposure','Dark images','A'),
(24,'Fast shutter speed is used to?','Blur motion','Freeze motion','Increase brightness','Change colors','B'),
(24,'Slow shutter speed creates?','Motion blur','Sharp images','Less light','Lower ISO','A');

INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES
(25,'What time gives the best natural lighting?','Noon','Golden hour','Midnight','Early afternoon','B'),
(25,'Golden hour occurs when?','Midnight','Sunrise or sunset','Noon','Afternoon','B'),
(25,'Why use window light for portraits?','Soft lighting','More noise','More shadows','Overexposure','A'),
(25,'Backlighting creates what effect?','Silhouette','Blur','Noise','Zoom','A');

INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES
(26,'Rule of thirds divides the frame into?','4 parts','6 parts','9 parts','12 parts','C'),
(26,'Subjects should be placed where?','Center only','Grid intersections','Edges only','Corners','B'),
(26,'Why use rule of thirds?','Better composition','More brightness','More zoom','Better ISO','A'),
(26,'Which photography aspect does it improve?','Composition','Lighting','Exposure','ISO','A');

INSERT INTO Questions
(QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer)
VALUES
(27,'What mode creates blurred background on phones?','Portrait mode','Night mode','HDR','Macro','A'),
(27,'What improves smartphone photo lighting?','Flash always','Natural light','Digital zoom','Low battery','B'),
(27,'Why avoid digital zoom?','Lower image quality','Better color','More blur','Higher ISO','A'),
(27,'Best lighting source for phone photos?','Sunlight','Flashlight','Monitor','TV light','A');