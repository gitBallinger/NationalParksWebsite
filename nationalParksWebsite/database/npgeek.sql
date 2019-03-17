DROP TABLE IF EXISTS survey_result;
DROP SEQUENCE IF EXISTS seq_surveyId;
DROP TABLE IF EXISTS weather;
DROP TABLE IF EXISTS park;

CREATE TABLE park
(
	parkCode VARCHAR(10) PRIMARY KEY,
	parkName VARCHAR(200) NOT NULL,
	state VARCHAR(30) NOT NULL,
	acreage INTEGER NOT NULL,
	elevationInFeet INTEGER NOT NULL,
	milesOfTrail REAL NOT NULL,
	numberOfCampsites INTEGER NOT NULL,
	climate VARCHAR(100) NOT NULL,
	yearFounded INTEGER NOT NULL,
	annualVisitorCount INTEGER NOT NULL,
	inspirationalQuote TEXT NOT NULL,
	inspirationalQuoteSource VARCHAR(200) NOT NULL,
	parkDescription TEXT NOT NULL,
	entryFee INTEGER NOT NULL,
	numberOfAnimalSpecies INTEGER NOT NULL
);

CREATE TABLE weather
(
	parkCode VARCHAR(10) NOT NULL,
	fiveDayForecastValue INTEGER NOT NULL,
	low INTEGER NOT NULL,
	high INTEGER NOT NULL,
	forecast VARCHAR(100) NOT NULL,

	CONSTRAINT pk_weather PRIMARY KEY (parkCode, fiveDayForecastValue),
	CONSTRAINT fk_weather_park FOREIGN KEY (parkCode) REFERENCES park (parkCode)

);

CREATE SEQUENCE seq_surveyId;

CREATE TABLE survey_result
(
	surveyId INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_surveyId'),
	parkCode VARCHAR(10) NOT NULL,
	emailAddress VARCHAR(100) NOT NULL,
	state VARCHAR(30) NOT NULL,
	activityLevel VARCHAR(100) NOT NULL
);

INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('CVNP', 'Cuyahoga Valley National Park', 'Ohio', 32832, 696, 125, 0, 'Woodland', 2000, 2189849, 'Of all the paths you take in life, make sure a few of them are dirt.', 'John Muir', 'Though a short distance from the urban areas of Cleveland and Akron, Cuyahoga Valley National Park seems worlds away. The park is a refuge for native plants and wildlife, and provides routes of discovery for visitors. The winding Cuyahoga River gives way to deep forests, rolling hills, and open farmlands. Walk or ride the Towpath Trail to follow the historic route of the Ohio & Erie Canal', 0, 390);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('ENP', 'Everglades National Park', 'Florida', 1508538, 0, 35, 0, 'Tropical', 1934, 1110901, 'There are no other Everglades in the world. They are, they have always been, one of the unique regions of the earth; remote, never wholly known. Nothing anywhere else is like them.', 'Marjory Stoneman Douglas', 'The Florida Everglades, located in southern Florida, is one of the largest wetlands in the world. Several hundred years ago, this wetlands was a major part of a 5,184,000 acre watershed that covered almost a third of the entire state of Florida. The Everglades consist of a shallow sheet of fresh water that rolls slowly over the lowlands and through billions of blades of sawgrass. As water moves through the Everglades, it causes the sawgrass to ripple like green waves; this is why the Everglades received the nickname "River of Grass."', 8, 760);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('GCNP', 'Grand Canyon National Park', 'Arizona', 1217262, 8000, 115, 120, 'Desert', 1919, 4756771, 'It is the one great wonders. . . every American should see.', 'Theodore Roosevelt', 'If there is any place on Earth that puts into perspective the grandiosity of Mother Nature, it is the Grand Canyon. The natural wonder, located in northern Arizona, is a window into the regio''s geological and Native American past. As one of the country''s first national parks, the Grand Canyon has long been considered a U.S. treasure, and continues to inspire scientific study and puzzlement.', 8, 450);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('GNP', 'Glacier National Park', 'Montana', 1013322, 6646, 745.6, 923, 'Temperate', 1910, 2338528, 'Far away in northwestern Montana, hidden from view by clustering mountain peaks, lies an unmapped corner—the Crown of the Continent.', 'George Bird Grinnell', 'Glacier might very well be the most beautiful of America''s national parks. John Muir called it "the best care-killing scenery on the continent." The mountains are steep, snowcapped, and punctuated by stunning mountain lakes and creeks. Much of the land remains wild and pristine, a result of its remote location and the lack of visitation in the 19th century.  ', 12, 300);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('GSMNP', 'Great Smoky Mountains National Park', 'Tennessee', 522419, 6500, 850, 939, 'Temperate', 1934, 10099276, 'May your trails be crooked, winding, lonesome, dangerous, leading to the most amazing view. May your mountains rise into and above the clouds.', 'Edward Abbey', 'The Great Smoky Mountains are a mountain range rising along the Tennessee–North Carolina border in the southeastern United States. They are a subrange of the Appalachian Mountains, and form part of the Blue Ridge Physiographic Province. The range is sometimes called the Smoky Mountains and the name is commonly shortened to the Smokies. The Great Smokies are best known as the home of the Great Smoky Mountains National Park, which protects most of the range. The park was established in 1934, and, with over 9 million visits per year, it is the most-visited national park in the United States', 0, 400);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('GTNP', 'Grand Teton National Park', 'Wyoming', 310000, 6800, 200, 1206, 'Temperate', 1929, 2791392, 'We can not have freedom without wilderness.', 'Edward Abbey', 'The peaks of the Teton Range, regal and imposing as they stand nearly 7,000 feet above the valley floor, make one of the boldest geologic statements in the Rockies. Unencumbered by foothills, they rise through steep coniferous forest into alpine meadows strewn with wildflowers, past blue and white glaciers to naked granite pinnacles. The Grand, Middle, and South Tetons form the heart of the range. But their neighbors, especially Mount Owen, Teewinot Mountain, and Mount Moran, are no less spectacular.', 15, 380);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('MRNP', 'Mount Rainier National Park', 'Washingto', 236381, 5500, 260, 573, 'Rainforest', 1899, 1038229, 'Of all the fire mountains which like beacons, once blazed along the Pacific Coast, Mount Rainier is the noblest.', 'Unknow', 'Mt. Rainier National Park is one of three national parks in the state of Washington and is one of America''s oldest parks, being one of only five founded in the 19th century. The park was created to preserve one of America''s most spectacular scenic wonders, the snow-capped volcano known as Tahcoma to Indians in ages past and as Mt. Rainier now. While the mountain is unquestionably the centerpiece of the park, its 235,612 acres (378 square miles) also contain mountain ranges, elaborate glaciers, rivers, deep forests, lush meadows covered with wildflowers during the summer, and over 300 miles of trails. 96% of the park is classified as wilderness.', 20, 280);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('RMNP', 'Rocky Mountain National Park', 'Colorado', 265761, 7800, 300, 660, 'Woodland', 1915, 3176941, 'It''s not the mountain we conquer, but ourselves.', 'Sir Edmund Hillary', 'Rocky Mountain National Park is one of the highest national parks in the nation, with elevations from 7,860 feet to 14,259 feet. Sixty mountain peaks over 12,000 feet high result in world-renowned scenery. The Continental Divide runs north - south through the park, and marks a climatic division. Ancient glaciers carved the topography into an amazing range of ecological zones. What you see within short distances at Rocky is similar to the wider landscape changes seen on a drive from Denver to northern Alaska.', 20, 360);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('YNP', 'Yellowstone National Park', 'Wyoming', 2219791, 8000, 900, 1900, 'Temperate', 1872, 3394326, 'Yellowstone Park is no more representative of America than is Disneyland.', 'John Steinbeck', 'Yellowstone National Park is a protected area showcasing significant geological phenomena and processes. It is also a unique manifestation of geothermal forces, natural beauty, and wild ecosystems where rare and endangered species thrive. As the site of one of the few remaining intact large ecosystems in the northern temperate zone of earth, Yellowstone’s ecological communities provide unparalleled opportunities for conservation, study, and enjoyment of large-scale wildland ecosystem processes.', 15, 390);
INSERT INTO park(parkCode, parkName, state, acreage, elevationInFeet, milesOfTrail, numberOfCampsites, climate, yearFounded, annualVisitorCount, inspirationalQuote, inspirationalQuoteSource, parkDescription, entryFee, numberOfAnimalSpecies) VALUES ('YNP2', 'Yosemite National Park', 'California', 747956, 5000, 800, 1720, 'Forest', 1890, 3882642, 'Yosemite Valley, to me, is always a sunrise, a glitter of green and golden wonder in a vast edifice of stone and space.', 'Ansel Adams', 'Yosemite National Park vividly illustrates the effects of glacial erosion of granitic bedrock, creating geologic features that are unique in the world. Repeated glaciations over millions of years have resulted in a concentration of distinctive landscape features, including soaring cliffs, domes, and free-falling waterfalls. There is exceptional glaciated topography, including the spectacular Yosemite Valley, a 914-meter (1/2 mile) deep, glacier-carved cleft with massive sheer granite walls. These geologic features provide a scenic backdrop for mountain meadows and giant sequoia groves, resulting in a diverse landscape of exceptional natural and scenic beauty.', 15, 420);

INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GNP',1,27,40,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GNP',2,31,43,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GNP',3,28,40,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GNP',4,24,34,'cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GNP',5,25,32,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GCNP',1,35,66,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GCNP',2,34,69,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GCNP',3,32,57,'rain');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GCNP',4,34,62,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GCNP',5,31,62,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GTNP',1,27,46,'cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GTNP',2,30,49,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GTNP',3,31,46,'rain');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GTNP',4,28,41,'rain');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GTNP',5,22,38,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('MRNP',1,23,30,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('MRNP',2,24,32,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('MRNP',3,21,27,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('MRNP',4,23,27,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('MRNP',5,21,25,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GSMNP',1,58,70,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GSMNP',2,56,70,'thunderstorms');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GSMNP',3,56,74,'cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GSMNP',4,53,68,'thunderstorms');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('GSMNP',5,52,66,'thunderstorms');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('ENP',1,70,82,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('ENP',2,70,81,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('ENP',3,70,81,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('ENP',4,71,82,'thunderstorms');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('ENP',5,70,85,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP',1,23,43,'cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP',2,26,47,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP',3,25,44,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP',4,21,37,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP',5,16,36,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP2',1,34,51,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP2',2,25,39,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP2',3,29,40,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP2',4,32,38,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('YNP2',5,23,34,'snow');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('CVNP',1,38,62,'rain');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('CVNP',2,38,56,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('CVNP',3,51,66,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('CVNP',4,55,65,'rain');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('CVNP',5,53,69,'thunderstorms');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('RMNP',1,30,47,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('RMNP',2,35,55,'sunny');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('RMNP',3,34,50,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('RMNP',4,33,47,'partly cloudy');
INSERT INTO weather(parkCode, fiveDayForecastValue, low, high, forecast) VALUES ('RMNP',5,30,43,'rain');