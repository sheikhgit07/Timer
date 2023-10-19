import 'dart:ui';

class CustomModel{
  String? img;
  String? icon;
  String? title;
  String? subTitle;
  Color? color;
  CustomModel({
    this.img,
    this.icon,
    this.title,
    this.subTitle,
    this.color
  });
}

List<CustomModel> expressionList = [
  CustomModel(icon: "assets/icons/08_disgusted.png",title: "Disgusted"),
  CustomModel(icon: "assets/icons/01_happy.png",title: "Happy"),
  CustomModel(icon: "assets/icons/05_sad.png",title: "Sad"),
  CustomModel(icon: "assets/icons/04_bad.png",title: "Bad"),
  CustomModel(icon: "assets/icons/06_fear.png",title: "Fear"),
  CustomModel(icon: "assets/icons/07_anger.png",title: "Anger"),
  CustomModel(icon: "assets/icons/03_surprised.png",title: "Surprised"),
];

//Natural Mood
List<CustomModel> naturalMoodList = [
  CustomModel(title: "Exhausted"),
  CustomModel(title: "Out of Control"),
  CustomModel(title: "Hopeless"),
  CustomModel(title: "Lonely"),
  CustomModel(title: "Upset"),
  CustomModel(title: "Tired"),
  CustomModel(title: "Disappointed"),
  CustomModel(title: "Unfocused")
];

//Happy Mood
List<CustomModel> happyMoodList = [
  CustomModel(title: "Grateful"),
  CustomModel(title: "Proud"),
  CustomModel(title: "Confident"),
  CustomModel(title: "Hopeful"),
  CustomModel(title: "Excited"),
  CustomModel(title: "Powerful"),
  CustomModel(title: "Relaxed"),
  CustomModel(title: "Contentful"),
  CustomModel(title: "Optimistic"),
  CustomModel(title: "Courageous"),
  CustomModel(title: "Valued"),
  CustomModel(title: "Respected"),
];
//Sad Mood
List<CustomModel> sadMoodList = [
  CustomModel(title: "Guilty"),
  CustomModel(title: "Grief"),
  CustomModel(title: "Helpless"),
  CustomModel(title: "Hopeless"),
  CustomModel(title: "Lonely"),
  CustomModel(title: "Inferior"),
  CustomModel(title: "Vulnerable"),
  CustomModel(title: "Powerless"),
  CustomModel(title: "Embarrassed"),
  CustomModel(title: "Depressed"),
  CustomModel(title: "Hurt"),
  CustomModel(title: "Isolated"),
];

//Bad Mood
List<CustomModel> badMoodList = [
  CustomModel(title: "Guilty"),
  CustomModel(title: "Grief"),
  CustomModel(title: "Helpless"),
  CustomModel(title: "Hopeless"),
  CustomModel(title: "Lonely"),
  CustomModel(title: "Inferior"),
  CustomModel(title: "Vulnerable"),
  CustomModel(title: "Powerless"),
  CustomModel(title: "Embarrassed"),
  CustomModel(title: "Depressed"),
  CustomModel(title: "Hurt"),
  CustomModel(title: "Isolated"),
];

//Fear Mood
List<CustomModel> fearMoodList = [
  CustomModel(title: "Unfocused"),
  CustomModel(title: "Out of Control"),
  CustomModel(title: "Overwhelmed"),
  CustomModel(title: "Confused"),
  CustomModel(title: "Stressed"),
  CustomModel(title: "Worried"),
  CustomModel(title: "Nervous"),
  CustomModel(title: "Upset"),
  CustomModel(title: "Anxious")
];

//Anger Mood
List<CustomModel> angerMoodList = [
  CustomModel(title: "Frustrated"),
  CustomModel(title: "Jealous"),
  CustomModel(title: "Disappointed"),
  CustomModel(title: "Annoyed"),
  CustomModel(title: "Ashamed"),
  CustomModel(title: "Disrespected"),
  CustomModel(title: "Embarrassed"),
  CustomModel(title: "Aggressive"),
  CustomModel(title: "Out of Control"),
  CustomModel(title: "Humiliated")
];

//Surprised Mood
List<CustomModel> surprisedMoodList = [
  CustomModel(title: "Startled"),
  CustomModel(title: "Confused"),
  CustomModel(title: "Amazed"),
  CustomModel(title: "Excited"),
  CustomModel(title: "Shocked"),
  CustomModel(title: "Preplexed"),
  CustomModel(title: "Eager"),
  CustomModel(title: "Energetic"),
  CustomModel(title: "Awe")
];
//Meditation
List<CustomModel> meditationList = [
  CustomModel(img: "assets/icons/image_01.png",icon: "assets/icons/video.png"),
  CustomModel(img: "assets/icons/image_02.png",icon: "assets/icons/audio.png"),
  CustomModel(img: "assets/icons/image_03.png",icon: "assets/icons/note.png"),
  CustomModel(img: "assets/icons/image_04.png",icon: "assets/icons/note.png"),
];
//Meditation
List<CustomModel> meditationViewList = [
  CustomModel(img: "assets/icons/image_01_zoom.png",icon: "assets/icons/video_big.png"),
  CustomModel(img: "assets/icons/image_02_zoom.png",icon: ""),
  CustomModel(img: "assets/icons/image_03_zoom.png",icon: ""),
  CustomModel(img: "assets/icons/image_04_zoom.png",icon: ""),
];
//Meditation
List<CustomModel> journalList = [
  CustomModel(img: "assets/icons/image_01_zoom.png",
      title: "My Five Minute Journal",
    subTitle: "There are many variations of that a reader",
    color: Color(0xFFe2f2ff)
  ),
  CustomModel(img: "assets/icons/image_02_zoom.png",
      title: "My Daily Journal",
      subTitle: "Daily journaling is an easy and enjoyable way",
      color: Color(0xFFdaedd9)
  ),
  CustomModel(img: "assets/icons/image_03_zoom.png",
      title: "My Gratitude Journal",
      subTitle: "Gratitude journaling is a fantastic way to bring",
      color: Color(0xFFffffd8)
  ),
  CustomModel(img: "assets/icons/image_04_zoom.png",
      title: "My Travel Journal",
      subTitle: "Travel journaling is a fun and creative way to",
      color: Color(0xFFfedcdc)
  ),
];