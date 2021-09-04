-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2021 at 10:37 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nwp`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT 0,
  `review_id` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `text`, `user_id`, `movie_id`, `review_id`, `created_at`) VALUES
(1, 'dobar film', 1, 1, 0, '2021-09-02 17:49:00'),
(3, 'bas dobar', 1, 1, 0, '2021-09-02 17:52:00'),
(6, 'odlican review', 1, 0, 1, '2021-09-02 18:30:00'),
(7, 'bas dobar!!!!!', 1, 0, 1, '2021-09-02 18:31:00'),
(8, 'dbra!!!', 1, 0, 1, '2021-09-02 18:32:00'),
(12, 'eeaaa', 1, 0, 1, '2021-09-02 19:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `stars` varchar(255) NOT NULL,
  `release_date` varchar(255) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `trending` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' ''img_';

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `genre`, `director`, `stars`, `release_date`, `img_url`, `video_url`, `description`, `trending`) VALUES
(1, 'The Shawshank Redemption', 'drama', 'Frank Darabont', 'Tim Robbins, Morgan Freeman, Bob Gunton', '1994', 'https://wallpaperaccess.com/full/1632068.jpg', 'https://www.youtube.com/embed/NmzuHjWmXOc', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 0),
(2, 'The Godfather', 'crime', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino, James Caan', '1972', 'https://vistapointe.net/images/the-godfather-1.jpg', 'https://www.youtube.com/embed/sY1S34973zA', 'An organized crime dynasty\'s aging patriarch transfers control of his clandestine empire to his reluctant son.', 1),
(3, 'The Godfather: Part II', 'crime', 'Francis Ford Coppola', 'Al Pacino, Robert De Niro, Robert Duvall', '1974', 'https://wallpaperaccess.com/full/2678646.jpg', 'https://www.youtube.com/embed/9O1Iy9od7-A', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 0),
(4, 'The Dark Knight', 'action', 'Christopher Nolan', 'Christian Bale, Heath Ledger, Aaron Eckhart', '2008', 'https://wallpaperaccess.com/full/3089145.jpg', 'https://www.youtube.com/embed/EXeTwQWrcwY', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 1),
(5, '12 Angry Men', 'drama', 'Sidney Lumet', 'Henry Fonda, Lee J. Cobb, Martin Balsam', '1957', 'https://wallpapercave.com/wp/wp2330961.jpg', 'https://www.youtube.com/embed/_13J_9B5jEk', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 0),
(6, 'Schindler\'s List', 'drama', 'Steven Spielberg', 'Liam Neeson, Ralph Fiennes, Ben Kingsley', '1993', 'https://wallpaperaccess.com/full/2006523.jpg', 'https://www.youtube.com/embed/mxphAlJID9U', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 0),
(7, 'The Lord of the Rings: The Return of the King', 'adventure', 'Peter Jackson', 'Elijah Wood, Viggo Mortensen, Ian McKellen', '2003', 'https://wallpapercave.com/wp/wp4119586.jpg', 'https://www.youtube.com/embed/r5X-hFf6Bwo', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 1),
(8, 'The Lord of the Rings: The Fellowship of the Ring', 'adventure', 'Peter Jackson', 'Elijah Wood, Ian McKellen, Orlando Bloom', '2001', 'https://wallpapercave.com/wp/wp3873604.jpg', 'https://www.youtube.com/embed/V75dMMIW2B4', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 0),
(9, 'The Lord of the Rings: The Two Towers', 'adventure', 'Peter Jackson', 'Elijah Wood, Ian McKellen, Orlando Bloom', '2002', 'https://wallpapercave.com/wp/wp3871647.jpg', 'https://www.youtube.com/embed/LbfMDwc4azU', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.', 0),
(10, 'Pulp Fiction', 'crime', 'Quentin Tarantino', 'John Travolta, Uma Thurman, Samuel L. Jackson', '1994', 'https://www.pcclean.io/wp-content/uploads/2020/4/2ArI3e.jpg', 'https://www.youtube.com/embed/s7EdQ4FqbhY', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 1),
(11, 'Inception', 'Action', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt, Elliot Page', '2010', 'https://www.themoviedb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg', 'https://www.youtube.com/embed/YoHD9XEInc0', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `movie_id`, `user_id`, `text`, `created_at`) VALUES
(1, 'The Shawshank redemption summary', 1, 1, 'The Shawshank Redemption\" is a movie about time, patience and loyalty -- not sexy qualities, perhaps, but they grow on you during the subterranean progress of this story, which is about how two men serving life sentences in prison become friends and find a way to fight off despair.\r\n\r\nThe story is narrated by \"Red\" Redding (Morgan Freeman), who has been inside the walls of Shawshank Prison for a very long time and is its leading entrepreneur. He can get you whatever you need: cigarettes, candy, even a little rock pick like an amateur geologist might use. One day he and his fellow inmates watch the latest busload of prisoners unload, and they make bets on who will cry during their first night in prison, and who will not. Red bets on a tall, lanky guy named Andy Dufresne (Tim Robbins), who looks like a babe in the woods.\r\n\r\nBut Andy does not cry, and Red loses the cigarettes he wagered. Andy turns out to be a surprise to everyone in Shawshank, because within him is such a powerful reservoir of determination and strength that nothing seems to break him. Andy was a banker on the outside, and he\'s in for murder. He\'s apparently innocent, and there are all sorts of details involving his case, but after a while they take on a kind of unreality; all that counts inside prison is its own society -- who is strong, who is not -- and the measured passage of time.\r\n\r\nRed is also a lifer. From time to time, measuring the decades, he goes up in front of the parole board, and they measure the length of his term (20 years, 30 years) and ask him if he thinks he has been rehabilitated. Oh, most surely, yes, he replies; but the fire goes out of his assurances as the years march past, and there is the sense that he has been institutionalized -- that, like another old lifer who kills himself after being paroled, he can no longer really envision life on the outside.\r\n\r\nRed\'s narration of the story allows him to speak for all of the prisoners, who sense a fortitude and integrity in Andy that survives the years. Andy will not kiss butt. He will not back down. But he is not violent, just formidably sure of himself. For the warden (Bob Gunton), he is both a challenge and a resource; Andy knows all about bookkeeping and tax preparation, and before long he\'s been moved out of his prison job in the library and assigned to the warden\'s office, where he sits behind an adding machine and keeps tabs on the warden\'s ill-gotten gains. His fame spreads, and eventually he\'s doing the taxes and pension plans for most of the officials of the local prison system.\r\n\r\nThere are key moments in the film, as when Andy uses his clout to get some cold beers for his friends who are working on a roofing job. Or when he befriends the old prison librarian (James Whitmore). Or when he oversteps his boundaries and is thrown into solitary confinement. What quietly amazes everyone in the prison -- and us, too -- is the way he accepts the good and the bad as all part of some larger pattern than only he can fully see.\r\nThe partnership between the characters played by Tim Robbins and Morgan Freeman is crucial to the way the story unfolds. This is not a \"prison drama\" in any conventional sense of the word. It is not about violence, riots or melodrama. The word \"redemption\" is in the title for a reason. The movie is based on a story, Rita Hayworth and the Shawshank Redemption, by Stephen King, which is quite unlike most of King\'s work. The horror here is not of the supernatural kind, but of the sort that flows from the realization than 10, 20, 30 years of a man\'s life have unreeled in the same unchanging daily prison routine.\r\nThe director, Frank Darabont, paints the prison in drab grays and shadows, so that when key events do occur, they seem to have a life of their own.\r\n\r\nAndy, as played by Robbins, keeps his thoughts to himself. Red, as Freeman plays him, is therefore a crucial element in the story: His close observation of this man, down through the years, provides the way we monitor changes and track the measure of his influence on those around him. And all the time there is something else happening, hidden and secret, which is revealed only at the end.', '2021-08-22'),
(2, 'Schindler\'s List: Imagining the Holocaust to Remember It', 6, 2, 'There is a real photographic record of some of the people and places depicted in \"Schindler\'s List,\" and it has a haunting history. Raimund Titsch, an Austrian Catholic who managed a uniform factory within the Plaszow labor camp in Poland, surreptitiously took pictures of what he saw. Fearful of having the pictures developed, he hid his film in a steel box, which he buried in a park outside Vienna and then did not disturb for nearly 20 years. Although it was sold secretly by Titsch when he was terminally ill, the film remained undeveloped until after his death.\r\n\r\nThe pictures that emerged, like so many visual representations of the Holocaust, are tragic, ghostly and remote. The horrors of the Holocaust are often viewed from a similar distance, filtered through memory or insulated by grief and recrimination. Documented exhaustively or dramatized in terms by now dangerously familiar, the Holocaust threatens to become unimaginable precisely because it has been imagined so fully. But the film \"Schindler\'s List,\" directed with fury and immediacy by a profoundly surprising Steven Spielberg, presents the subject as if discovering it anew.\r\n\r\n\"Schindler\'s List\" brings a pre-eminent pop mastermind together with a story that demands the deepest reserves of courage and passion. Rising brilliantly to the challenge of this material and displaying an electrifying creative intelligence, Mr. Spielberg has made sure that neither he nor the Holocaust will ever be thought of in the same way again. With every frame, he demonstrates the power of the film maker to distill complex events into fiercely indelible images. \"Schindler\'s List\" begins with the sight of Jewish prayer candles burning down to leave only wisps of smoke, and there can be no purer evocation of the Holocaust than that.\r\n\r\nA deserted street littered with the suitcases of those who have just been rounded up and taken away. The look on the face of a captive Jewish jeweler as he is tossed a handful of human teeth to mine for fillings. A snowy sky that proves to be raining ashes. The panic of a prisoner unable to find his identity papers while he is screamed at by an armed soldier, a man with an obviously dangerous temper. These visceral scenes, and countless others like them, invite empathy as surely as Mr. Spielberg once made viewers wish E.T. would get well again.\r\nBut this time his emphasis is on the coolly Kafkaesque aspects of an authoritarian nightmare. Drawing upon the best of his storytelling talents, Mr. Spielberg has made \"Schindler\'s List\" an experience that is no less enveloping than his earlier works of pure entertainment. Dark, sobering and also invigoratingly dramatic, \"Schindler\'s List\" will make terrifying sense to anyone, anywhere.\r\n\r\nThe big man at the center of this film is Oskar Schindler, a Catholic businessman from the Sudetenland who came to occupied Poland to reap the spoils of war. (You can be sure this is not the last time the words \"Oscar\" and \"Schindler\" will be heard together.) Schindler is also something of a cipher, just as he was for Thomas Keneally, whose 1982 book, \"Schindler\'s List,\" marked a daring synthesis of fiction and fact. Reconstructing the facts of Schindler\'s life to fit the format of a novel, Mr. Keneally could only draw upon the memories of those who owed their lives to the man\'s unexpected heroism. Compiling these accounts (in a book that included some of the Titsch photographs), Mr. Keneally told \"the story of the pragmatic triumph of good over evil, a triumph in eminently measurable, statistical, unsubtle terms.\"\r\n\r\nThe great strength of Mr. Keneally\'s book, and now of Mr. Spielberg\'s film, lies precisely in this pragmatism. Knowing only the particulars of Schindler\'s behavior, the audience is drawn into wondering about his higher motives, about the experiences that transformed a casual profiteer into a selfless hero.\r\nSchindler\'s story becomes much more involving than a tale of more conventional courage might be, just as Mr. Spielberg\'s use of unfamiliar actors to play Jewish prisoners makes it hard to view them as stock movie characters (even when the real events that befall these people threaten to do just that). The prisoners\' stories come straight from Mr. Keneally\'s factual account, which is beautifully recapitulated by Steven Zaillian\'s screenplay.\r\n\r\nOskar Schindler, played with mesmerizing authority by Liam Neeson, is unmistakably larger than life, with the panache of an old-time movie star. (The real Schindler was said to resemble George Sanders and Curt Jurgens.) From its first glimpse of Oskar as he dresses for a typically flamboyant evening socializing with German officers -- and even from the way his hand appears, nonchalantly holding a cigarette and a bribe -- the film studies him with rapt attention.\r\nMr. Neeson, captured so glamorously by Janusz Kaminiski\'s richly versatile black-and-white cinematography, presents Oskar as an amalgam of canny opportunism and supreme, well-warranted confidence. Mr. Spielberg does not have to underscore the contrast between Oskar\'s life of privilege and the hardships of his Jewish employees.\r\n\r\nTaking over a kitchenware factory in Cracow and benefiting from Jewish slave labor, Oskar at first is no hero. During a deft, seamless section of the film that depicts the setting up of this business operation, Oskar is seen happily occupying an apartment from which a wealthy Jewish couple has just been evicted. Meanwhile, the film\'s Jews are relegated to the Cracow ghetto. After the ghetto is evacuated and shut down, they are sent to Plaszow, which is overseen by a coolly brutal SS commandant named Amon Goeth.\r\n\r\nGoeth, played fascinatingly by the English stage actor Ralph Fiennes, is the film\'s most sobering creation. The third of its spectacularly fine performances comes from Ben Kingsley as the reserved, wary Jewish accountant who becomes Oskar\'s trusted business manager, and who at one point has been rounded up by Nazi officers before Oskar saves him. \"What if I got here five minutes later?\" Oskar asks angrily, with the self-interest that keeps this story so startling. \"Then where would I be?\"\r\n\r\nAs the glossy, voluptuous look of Oskar\'s sequences gives way to a stark documentary-style account of the Jews\' experience, \"Schindler\'s List\" witnesses a pivotal transformation. Oskar and a girlfriend, on horseback, watch from a hilltop as the ghetto is evacuated, and the image of a little girl in red seems to crystallize Oskar\'s horror.\r\n\r\nBut there is a more telling sequence later on, when Oskar is briefly arrested for having kissed a young Jewish woman during a party at his factory. Kissing women is, for Oskar, the most natural act in the world. And he is stunned to find it forbidden on racial grounds. All at once, he understands how murderous and irrational the world has become, and why no prisoners can be safe without the intervention of an Oskar Schindler.\r\n\r\nThe real Schindler saved more than a thousand Jewish workers by sheltering them in his factory, and even accomplished the unimaginable feat of rescuing some of them from Auschwitz. This film\'s moving coda, a full-color sequence, offers an unforgettable testimonial to Schindler\'s achievement.\r\nThe tension in \"Schindler\'s List\" comes, of course, from the omnipresent threat of violence. But here again, Mr. Spielberg departs from the familiar. The film\'s violent acts are relatively few, considering its subject matter, and are staged without the blatant sadism that might be expected. Goeth\'s hobby of playing sniper, casually targeting his prisoners with a high-powered rifle, is presented so matter-of-factly that it becomes much more terrible than it would be if given more lingering attention.\r\n\r\nMr. Spielberg knows well how to make such events truly shocking, and how to catch his audience off guard. Most of these shootings are seen from a great distance, and occur unexpectedly. When it appears that the film is leading up to the point-blank execution of a rabbi, the director has something else in store.\r\n\r\nGoeth\'s lordly balcony, which overlooks the film\'s vast labor-camp set, presents an extraordinary set of visual possibilities, and Mr. Spielberg marshals them most compellingly. But the presence of huge crowds and an immense setting also plays to this director\'s weakness for staging effects en masse. \"Schindler\'s List\" falters only when the crowd of prisoners is reduced to a uniform entity, so that events no longer have the tumultuous variety of real life.\r\n\r\nThis effect is most noticeable in Schindler\'s last scene, the film\'s only major misstep, as a throng listens silently to Oskar\'s overwrought farewell. In a film that moves swiftly and urgently through its three-hour running time, this stagey ending -- plus a few touches of fundamentally false uplift, most notably in a sequence at Auschwitz -- amounts to a very small failing.\r\n\r\nAmong the many outstanding elements that contribute to \"Schindler\'s List,\" Michael Kahn\'s nimble editing deserves special mention. So does the production design by Allan Starski, which finds just the right balance between realism and drama. John Williams\'s music has a somber, understated loveliness. The soundtrack becomes piercingly beautiful as Itzhak Perlman\'s violin solos occasionally augment the score.\r\n\r\nIt should be noted, if only in passing, that Mr. Spielberg has this year delivered the most astounding one-two punch in the history of American cinema. \"Jurassic Park,\" now closing in on billion-dollar grosses, is the biggest movie moneymaker of all time. \"Schindler\'s List,\" destined to have a permanent place in memory, will earn something better.', '2021-08-20'),
(3, '12 Angry Men analysis', 5, 2, 'In summary, this film is about twelve men in charge of deciding whether or not an 18-year-old Hispanic boy is guilty of first-degree murder…of his father. The film starts in the courtroom with the judge stating that it’s the juror\'s duty to “sit down and separate the facts from the fancy.” The jury retires to discuss the seemingly unanimous verdict of guilty. After the first ballot, all vote guilty — all but one: Juror #8, our main character one might say. Juror #8 votes not guilty strictly because he isn’t sure…and that’s all it takes. After he expresses his desire for discussion, Juror #8 slowly convinces more and more of the jury to hear his side of the arguments, swaying them to believe the boy is not guilty as the film progresses — due in large part to reasonable doubt.\r\nAlthough this film possesses many underlying themes that deal with a variety of complex issues, one of the greatest takeaways is that anything is possible.\r\nTowards the beginning of the film when considering the possibility of the accused being not guilty, Juror #8 says, “It’s possible isn’t it?” All it takes is reasonable doubt of one man, one man who stood alone against a room of men convinced that this boy is guilty.\r\nIt seemed impossible for one man standing alone against 11 jurors who are more than convinced that the defendant is guilty, to convince them all to hear his side and eventually get them to vote not guilty as well. You may think to yourself, “There’s no way this guy will win. There’s no way they all vote not guilty.” But just like Juror #8 says: It’s possible, isn’t it?\r\nNear the end of the film, the most powerful scene — objectively, is when Juror #10 rants about the incredibility of the accused based on his own personal prejudice. As Juror #10 rants to the rest of the jury, they all turn away. They don’t speak, they don’t argue. Their silence speaks volumes.\r\nJust after another vote is taken, this time split: 6 for guilty & 6 for not guilty, they take a short break. After it starts raining, Juror #1 and Juror #8 go to lower the windows, where Juror #1 shares an anecdote. He’s the assistant head coach of a high school football team where he once played a game where his team was behind 7–6, but they’re “starting to move along real nice.” The opposing team’s line is coming apart, but Juror #1’s team starts to come down cats and dogs, like the rain before their eyes at that very moment.\r\nThis anecdote serves as a metaphor for their current situation. The team that’s ahead in the football game is the not-guilty party in the metaphor, they’re winning, and they start slowing down. Juror 1#’s team, the guilty party, is trying to come back, and it all falls apart right before their very eyes. This also foreshadows what is to come next in the movie. Will the guilty party collapse?\r\nIrony & Allusion\r\nCoincidentally after the prementioned metaphor, we cut to Juror #7, a current advocate for the guilty party. He points to the fan behind him and asks “Hey what is it with this fan here?” He turns around to try and turn it on, succeeding, and celebrating his success by saying, “Well things are looking up here, huh?” Ironically, things are looking up for those who oppose him.\r\nAfter he sits down, he crumbles a piece of paper and throws it into the fan saying, “two points.” This alludes to the two jurors who joined the not-guilty party just before this.\r\nThe not-guilty party just received two points or two voters, and things are indeed looking up — just not for the guilty party.', '2021-08-11'),
(4, 'Pulp Fiction: Quentin Tarantino\'s Wild Ride On Life\'s Dangerous Road\r\n\r\n', 10, 2, 'The least interesting thing about Pulp Fiction is what is in that bloody briefcase. Whether it is unlimited moolah, the soul of Crime Lord Marsellus Wallace (Ving Rhames) or the gold lame suit worn by Val Kilmer\'s Elvis in True Romance (1993) really misses the point of Tarantino\'s molotov cocktail of a picture. Making a mockery of the difficult-second-film cliche, Tarantino weaves a patchwork of crime film history into something shiny and new. Peppered with great moments eaten up by actors working at the top of their game (Travolta, Willis and Thurman have never been better, and the film created the aura of greatness that currently surrounds Jackson) Pulp\'s witty writing, pop culture-surfing, gleeful amorality, cult tuneology and hyperkinetic energy has redefined the crime genre for the foreseeable future.\r\n\r\nDrawing on the compendium format of Black Mask magazine and Mario Bava\'s gothic flick Black Sabbath (1963) as well as the twisty-turny crime literature of Frederick Brown and Charles Willeford, Tarantino wrote Pulp on the European press push for Reservoir Dogs (1991) — hence Vincent Vega (Travolta )\'s detailed knowledge of Amsterdam minutiae. As such, the film also boasts a European feel; both in specific incident — the day-in-the-life-of-a-hit-man strand acknowledges the influence of Jean-Pierre Melville\'s Le Samourai (1967) and the Vincent-Mia\'s twist has the same spirit as the impromptu dance in Jean-Luc Godard\'s crime flick Bande A Part (1964) — and in its rather intelligent sense of deconstructing Hollywood history.\r\nIndeed, Pulp Fiction operates in the hinterland between reality and movie reality. Into a cadre of movie archetypes — the assassin, the mob boss, the gangster\'s moll, the boxer who throws a fight — Tarantino injects a reality check that is as funny as it is refreshing. Whereas most crime flicks would breeze over the rendezvous between Vincent and Mia, here we actually get to go on the date— polite chit-chat, awkward silences, bad dancing — before it spirals off into a drugged-up disaster. Just as Dogs is a heist film where you don\'t see the heist, Pulp is a boxer-takes-a-dive flick where you never see the bout, opting instead for conversations about muffins and Deliverance-style rape. Moreover, after Vincent and Jules take back Marsellus\' briefcase, rather than cutting to a cop on their trail, we stay with them and revel in their banal banter as they dispose of a corpse (the genius of Keitel\'s Wolf in this effort is a moot point — how much intelligence does it take | to clean a car, then throw a rug over the back seat?)\r\nWhat startled about Pulp on release was its audacious story dynamics. It was originally planned as a straight anthology flick — Tarantino\'s decision to cross-reference the yarns mines even more dramatic gold (i.e. the hero can get killed halfway through). While none of the stories amount to much on their own — if you told Pulp in a linearity, it would start with Vincent and Jules arriving at Brett\'s apartment and end with Butch and Fabienne Dooming off on Zed\'s chopper—in crisscrossing the exposition, Tarantino forges hooks of expectation and curiosity that pay off one by one in satisfying ways.\r\n\r\nThrough its tricksy plot structure, very few films capture such a rich sense of an interconnected crime community. Of course, this extends even beyond the parameters of the film itself to Tarantino\'s other movies — that Vincent Vega has a brother better known as Mr. Blonde hints at a whole nexus of underworld activity — and to the whole crime genre itself. As Butch kills Maynard, Marsellus Wallace warns Zed he\'s going to get some henchman, \"To go to work with a pair of pliers and a blowtorch.\" In Charley Varrick (1973), a character named Maynard warns a bank manager about the very same method of torture.\r\n\r\nWhile all the plaudits may have gone to Tarantino\'s killer dialogue — it\'s appeared everywhere from parody Plump Fiction to the Fun Lovin\' Criminals\' hit Scooby Snacks — Pulp is an equally stimulating visual experience. From the eyeful of Jackrabbit Slims to the magical square Mia draws to underline Vincent\'s geekiness to Andrzej Sekula\'s glossy, wide angled image-crafting, the look of Pulp is equally as imaginative without ever calling attention to itself.\r\nMore protean than Dogs, more fun than Jackie Brown, Pulp is so perfectly wrought it makes you forgive the crimes against cinema that Tarantino has perpetrated with his acting. Three great movies for the pries of one, the anaemic rip-offs that have followed have only served to sharpen its greatness. Besides, how could you not love a movie where a character called Antwan Rockamora is constantly referred to as Tony Rocky Horror?', '2021-08-18'),
(5, 'The Godfather review – a big screen must ', 2, 1, 'Francis Ford Coppola’s 1972 masterpiece is a top-down view of the mafia, with Marlon Brando almost papal in his sense of authority\r\n\r\nFrancis Ford Coppola\'s first Godfather from 1972, now rereleased, looks more than ever like a measured, deathly ­serious epic – without the comic or ironic relief that might make it ­\"Shakespearean\".\r\n\r\nThis is the top-down theory of the mafia: a capo\'s-eye view different from the chaotic, venal lives of other ranks in GoodFellas or The ­Sopranos. It permanently ­introduced into the genre the scene of the ­mafia don inscrutably receiving advice ­whispered into his ear; Marlon Brando made this gesture his own, receiving the murmured attention of consiglieri with a raised, almost papal forefinger.\r\n\r\nHe is the ageing Don who in 1946 loses his grip on the business by fastidiously refusing to handle the lucrative new narcotics trade; Al Pacino is the adored youngest son and straight-arrow army veteran who coldly accepts his destiny when an attempt is made on the life of his ­beloved papa. A big-screen must.', '2021-08-21'),
(6, 'The Dark Knight: Showdown in Gotham Town', 4, 3, 'A sound like a batgloved fist smacking into a cupped palm is what this film delivers: only deafeningly amplified and clarified with crisp, digital precision. It is the sound of all other recent super-hero movies getting their asses well and truly kicked. The Dark Knight is strange, dark, grandiose and mad; it is overlong and overhyped but hugely entertaining. In a simple, physical sense it really is huge, with cityscape sequences filmed on Imax technology, that demand to be seen on the vast Imax screen. Watching the first dizzying, vertiginous overhead shot of the glittering skyscrapers and minuscule streets, I literally forgot to breathe for a second or two, and found myself teetering forward on my seat - timidly, I had chosen one high up at the very back of the auditorium - as if about to topple into the illusory void.\r\n\r\nThe Dark Knight is the continuation of British director Christopher Nolan\'s reinvention of the Batman story and it takes the story up to his primal confrontation with the Joker, the villain who among the wrongdoer-gallery ranged against Batman is first among equals: here leading an unspeakable cabal of wiseguys. The caped crusader himself (although this camp designation is now not used) is again played by Christian Bale, clanking around in a kind of titanium-lite exoskeleton and making use of a heavy-duty Batmobile so macho and military-looking it makes a Humvee look like the kind of Prius driven by Gok Wan. Otherwise, he bops around town on a brutal motorbike with wheels the size of rubber boulders, cape fluttering in the slipstream.\r\n\r\nThe Joker is played, tremendously, by the late Heath Ledger. His great grin, though enhanced by rouge, has evidently been caused by two horrid slash-scars to the corners of his mouth, and his whiteface makeup is always cracking and peeling off, perhaps due to the dried remnants of tears, making him look like some self-hating Pagliaccio of crime, sweating backstage after the latest awful spectacular. Ledger has a weird collection of tics and twitches, kinks and quirks; his tongue darts, lizard-like, around his mouth, a little like Frankie Howerd, or perhaps Graham Kerr, the galloping gourmet of 1970s television.\r\n\r\nBatman is still a reasonably novel figure in Gotham city as the action begins. They still refer to this dubious vigilante with a retro-sounding definite article: he is \"the Batman\". And there is a new, conventional crime fighter in town: the handsome, dashing district attorney Harvey Dent, played by Aaron Eckhart, a man who believes that the rule of law has to be upheld by a democratically accountable person, not some shadowy figure of the night. To the chagrin of Batman and his far-from-mild-mannered alter ego, billionaire Bruce Wayne, Harvey is dating the love of Batman\'s life: legal eagle Rachel Dawes, played by Maggie Gyllenhaal. Gary Oldman plays Lt Gordon, before his historic promotion to \"Commissioner\" status. Michael Caine and Morgan Freeman provide droll performances as Wayne\'s ancillary staff, his butler Alfred and his Q-like costume designer, Lucius Fox.\r\n\r\nThere are some really exhilarating set-pieces, especially the one that kickstarts the proceedings: Nolan starts off with a high-tension, high-anxiety bank raid, carried out by a dodgy crew all in Joker masks, all whispering among themselves about the crazy guy in clown makeup who hired them to do the job. Why isn\'t he there personally? Wait - is he there personally?\r\n\r\nWith some big masculine face-offs, and a high-speed convoy scene, Nolan appears to have imbibed the influence of Michael Mann, and a sequence in Hong Kong has a touch of the Infernal Affairs movies. Various debates about Jack Bauer/24-type torture methods appear to show modern Hollywood discovering, if not a conscience exactly, then a certain self-consciousness. But the film is better at pure action - particularly one awe-inspiring chase scene Nolan later contrives between Batman on his bike and the Joker at the wheel of a enormous truck. The conclusion to this sequence had the audience in a semi-standing crouch of disbelief.\r\n\r\nPerhaps the most bizarre moment comes when the Joker has evidently abducted some unfortunate from the local psychiatric hospital to \"impersonate\" Batman\'s lost love: this man does appear to resemble Maggie Gyllenhaal: a joke of considerable malice, sophistication and lack of taste.\r\n\r\nNolan has made an enormously profitable smash with the Batman franchise, but at the risk of sounding priggish, I can\'t help thinking it may be a bit of a career blind-alley for the talented director who gave us brilliant and disquieting movies like Following (1998) and Memento (2000), whose inventions still linger in the mind. The Dark Knight\'s massive box-office success has surely given Nolan the means to write his own cheque, and in addition something sweeter still - clout. I hope that he will use it to cultivate movies that are smaller and more manoeuvrable than that great armoured Batmobile.', '2021-08-19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'peraperic', 'a', 'a', 'user'),
(2, 'milosmilosevic', 'b', 'b', 'user'),
(3, 'milanamikic', 'c', 'c', 'user'),
(4, 'admin', 'a', 'a', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
