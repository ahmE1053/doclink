import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/domain/entities/doctor.dart';

List<Map<String, dynamic>> doctors = [
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/12.out.png?alt=media&token=fc34ea17-00e0-4bb2-a229-c1f9c656f9b8',
    id: '1234',
    name: 'John Smith',
    speciality: 'Cardiology',
    aboutDoctor:
        'Dr. John Smith is a highly experienced cardiologist with over 15 years of experience in the field. He specializes in the diagnosis and treatment of heart disease, and is dedicated to providing the highest level of care to his patients.',
    joinedOn: DateTime.parse('2010-05-01'),
    reviews: [
      const Review(
        rating: 4.5,
        review:
            'Dr. Smith is an excellent cardiologist. He took the time to answer all of my questions and made me feel at ease during my visit.',
      ),
    ],
    rating: 4.5,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/1.out.png?alt=media&token=917fd0dd-b277-4c73-a83e-1abcbf6e7edf',
    id: '123',
    name: 'Sarah Johnson',
    speciality: 'Dermatology',
    aboutDoctor:
        'Dr. Sarah Johnson is a board-certified dermatologist with a passion for helping her patients achieve healthy and beautiful skin. She is skilled in the diagnosis and treatment of a wide range of skin conditions, and takes a personalized approach to each patient\'s care.',
    joinedOn: DateTime.parse('2015-07-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Johnson is the best dermatologist I\'ve ever seen. She is knowledgeable, compassionate, and really took the time to listen to my concerns.',
      ),
    ],
    rating: 4.8,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=d9bb1486-4b8b-4d0c-aa08-6a806ec9c931',
    id: '12',
    name: 'Michael Lee',
    speciality: 'Pediatrics',
    aboutDoctor:
        'Dr. Michael Lee is a caring and compassionate pediatrician who has been practicing for over 20 years. He is committed to providing the highest quality care to his young patients and their families, and takes the time to answer all of their questions and concerns.',
    joinedOn: DateTime.parse('2018-04-01'),
    reviews: [
      const Review(
        rating: 4.2,
        review:
            'Dr. Lee is great with kids. He really knows how to put them at ease and make them feel comfortable during their visit.',
      ),
    ],
    rating: 4.2,
    availableOn: DoctorAvailability(
      online: false,
      offline: true,
      offlineAvailability: generateOffline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/3.out.png?alt=media&token=3b1c09d9-ce1b-48ea-a83b-a425b48908d7',
    id: '1',
    name: 'Emily Davis',
    speciality: 'Oncology',
    aboutDoctor:
        'Dr. Emily Davis is a highly skilled oncologist with a passion for helping her patients fight cancer. She specializes in the diagnosis and treatment of a wide range of cancer types, and is dedicated to providing compassionate care to her patients throughout their treatment journey.',
    joinedOn: DateTime.parse('2018-08-01'),
    reviews: [
      const Review(
        rating: 4.2,
        review:
            'Dr. Davis is a wonderful oncologist. She was very kind and patient with me during a difficult time in my life.',
      ),
    ],
    rating: 4.2,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/4.out.png?alt=media&token=2c49b258-5e6d-4dad-9ade-7c69abfae19b',
    id: '1235',
    name: 'Robert Johnson',
    speciality: 'Orthopedics',
    aboutDoctor:
        'Dr. Robert Johnson is an experienced orthopedic surgeon who specializes in joint replacement and sports medicine. He is committed to helping his patients regain their mobility and get back to their active lifestyles.',
    joinedOn: DateTime.parse('2012-05-01'),
    reviews: [
      const Review(
        rating: 4.3,
        review:
            'Dr. Johnson did an amazing job with my knee replacement surgery. I\'m so grateful for his expertise and care.',
      ),
    ],
    rating: 4.3,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/6.out.png?alt=media&token=d02c2426-191a-418c-bbf9-82831a949d7e',
    id: '12345',
    name: 'Jennifer Kim',
    speciality: 'Psychiatry',
    aboutDoctor:
        'Dr. Jennifer Kim is a compassionate psychiatrist who specializes in the diagnosis and treatment of mood and anxiety disorders. She is dedicated to helping her patients achieve optimal mental health and well-being.',
    joinedOn: DateTime.parse('2020-07-01'),
    reviews: [
      const Review(
        rating: 5,
        review:
            'Dr. Kim is an amazing psychiatrist. She really listens and understands, and has helped me make significant progress with my mental health.',
      ),
    ],
    rating: 5,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/5.out.png?alt=media&token=4139830f-6e5f-475a-beff-763760df8103',
    id: '123456',
    name: 'Alex Lee',
    speciality: 'Cardiology',
    aboutDoctor:
        'Dr. Alex Lee is a highly skilled cardiologist with years of experience in the diagnosis and treatment of heart conditions. He is dedicated to providing personalized care to his patients, and helping them manage their cardiovascular health.',
    joinedOn: DateTime.parse('2010-05-01'),
    reviews: [
      const Review(
        rating: 4.7,
        review:
            'Dr. Lee is an amazing cardiologist. He took the time to explain my condition and answer all my questions. I highly recommend him.',
      ),
    ],
    rating: 4.7,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/8.out.png?alt=media&token=5995ea60-65fd-4196-9f8d-0a318a3359f0',
    id: '1234567',
    name: 'Sarah Patel',
    speciality: 'Dermatology',
    aboutDoctor:
        'Dr. Sarah Patel is a board-certified dermatologist with expertise in the diagnosis and treatment of skin conditions. She is committed to providing high-quality care to her patients, and helping them achieve healthy, beautiful skin.',
    joinedOn: DateTime.parse('2015-07-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Patel is a fantastic dermatologist. She really knows her stuff, and her treatments have made a big difference in my skin\'s health.',
      ),
    ],
    rating: 4.8,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/7.out.png?alt=media&token=4ea0a320-ccbf-49ea-a34c-e5e343eb6bfc',
    id: '1342',
    name: 'Jessica Kim',
    speciality: 'Oncology',
    aboutDoctor:
        'Dr. Jessica Kim is a compassionate oncologist with extensive experience in the treatment of cancer. She is committed to providing personalized care to her patients, and helping them navigate the challenges of cancer treatment with dignity and hope.',
    joinedOn: DateTime.parse('2012-05-01'),
    reviews: [
      const Review(
        rating: 5,
        review:
            'Dr. Kim is an excellent oncologist. She has been a source of comfort and guidance for me throughout my cancer treatment, and I am so grateful to have her on my team.',
      ),
    ],
    rating: 5,
    availableOn: DoctorAvailability(
      online: false,
      offline: true,
      offlineAvailability: generateOffline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl: 'https://www.pngall.com/wp-content/uploads/2018/05/Doctor.png',
    id: '24638',
    name: 'William Chen',
    speciality: 'Rheumatology',
    aboutDoctor:
        'Dr. William Chen is a skilled neurologist with expertise in the diagnosis and treatment of conditions affecting the brain and nervous system. He is dedicated to providing comprehensive care to his patients, and helping them achieve optimal brain health and function.',
    joinedOn: DateTime.parse('2015-07-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Chen is a great Rheumatologist. He really took the time to understand my symptoms and concerns, and his treatment plan has made a big difference in my quality of life.',
      ),
    ],
    rating: 4.8,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/9.out.png?alt=media&token=04063569-5011-416a-96fe-f8fe33e45d8d',
    id: '45345',
    name: 'Rachel Singh',
    speciality: 'Gastroenterology',
    aboutDoctor:
        'Dr. Rachel Singh is a highly skilled gastroenterologist with a passion for helping her patients achieve optimal digestive health. She is dedicated to providing personalized care to her patients, and helping them manage their gastrointestinal conditions with the latest treatment options.',
    joinedOn: DateTime.parse('2023-05-01'),
    reviews: [
      const Review(
        rating: 4.5,
        review:
            'Dr. Singh is an amazing gastroenterologist. She is very knowledgeable and caring, and her treatments have made a huge difference in my digestive health',
      ),
    ],
    rating: 4.5,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/9.out.png?alt=media&token=04063569-5011-416a-96fe-f8fe33e45d8d',
    id: '9876',
    name: 'Esraa Saber',
    speciality: 'Love',
    aboutDoctor:
        'دكتورة خبيرة في فن الحب والسعادة, بخبرة اكتر من... ثانية بس اكتر من ايه دي طول عمرها من ساعة م اتولدت وهي دايما مصدر سعادة وفرحة لكل اللي حواليها وزيادة على كده خبرة اكتر من تلت سنين في جعل شريكها اسعد بني ادم في الدنيا كلها. دكتورة مخلصة جدا ومش هتسيبك غير وانت فرحان ومبسوط مهما كنت مهموم او مضايق',
    joinedOn: DateTime.parse('2015-07-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'دكتورة اسراء دي اجمل واحلى وارق دكتورة ف الكون كله بجد انا بروح عندها بقالي اكتر من تلت سنين وعمري م مشيت من عندها غير وانا مبسوط وفرحان عندها كمية حنية وفرحة وقلب ابيض يخلي اي حد يعدي من جمبها بس مبسوط وفرحان كده من غير م يعرف ليه. ربنا يخليها ليا بجد واشتغل معاها في العيادة عشان ابقى اسعد بني ادم ف الدنيا كلها',
      ),
    ],
    rating: 4.8,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/11.out.png?alt=media&token=10bddd21-8dd9-4bf2-b04a-3a27f8069400',
    id: '78543',
    name: 'Steven Strange ',
    speciality: 'Dermatology',
    aboutDoctor:
        'Dr. Steven Strange is a highly skilled and accomplished neurosurgeon, known for his remarkable surgical abilities and unparalleled knowledge of the human brain. He has dedicated his life to helping patients with neurological disorders, and has become one of the most respected and sought-after specialists in his field. In addition to his work as a surgeon, Dr. Strange is also known for his expertise in the field of mystical arts, having been trained in the ways of the mystic arts by the Ancient One. With his keen mind and powerful abilities, he is a formidable ally in the fight against evil forces that threaten the world. Despite his extraordinary abilities, Dr. Strange remains humble and dedicated to his patients, and always puts their needs first. He is truly a remarkable physician and a hero to many.',
    joinedOn: DateTime.parse('2010-05-01'),
    reviews: [
      const Review(
        rating: 5,
        review:
            'Dr. Steven is amazing! She was able to diagnose and treat my skin condition quickly and effectively.',
      ),
      const Review(
        rating: 4,
        review:
            'I appreciate how Dr. Strange takes the time to listen to my concerns and provides me with personalized recommendations.',
      ),
    ],
    rating: 4.5,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/12.out.png?alt=media&token=fc34ea17-00e0-4bb2-a229-c1f9c656f9b8',
    id: '876912',
    name: 'David Chen',
    speciality: 'Pediatrics',
    aboutDoctor:
        'Dr. David Chen is a compassionate pediatrician who is dedicated to providing the best possible care for children of all ages. He has a special interest in preventive care and works closely with parents to ensure their child\'s health and well-being.',
    joinedOn: DateTime.parse('2015-07-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Chen is fantastic with kids! He made my child feel at ease during their appointment.',
      ),
    ],
    rating: 4.8,
    availableOn: DoctorAvailability(
      online: true,
      offline: false,
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/13.out.png?alt=media&token=3bd0c138-ec2f-455c-bb36-c826c5d3b7d3',
    id: '976453',
    name: 'Will Smith',
    speciality: 'Pediatrics',
    aboutDoctor:
        'Will Smith is a highly accomplished actor, producer, and musician. With a career spanning several decades, he has become one of the most recognizable and beloved figures in the entertainment industry. Known for his charisma, talent, and infectious energy, Will is dedicated to bringing joy and inspiration to his fans through his work. Whether he\'s starring in blockbuster films, producing hit TV shows, or releasing chart-topping albums, he always strives to deliver his best and make a positive impact on the world. With a reputation for being one of the nicest and most down-to-earth celebrities in Hollywood, Will is a true icon and an inspiration to millions of people around the globe.',
    joinedOn: DateTime.parse('2010-05-01'),
    reviews: [
      const Review(
        rating: 4.5,
        review:
            'Dr. Smith is an excellent Actor. He took the time to answer all of my questions and made me feel at ease during my visit.',
      ),
    ],
    rating: 4.5,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
];

List<OnlineAvailability> generateOnline() {
  final List<OnlineAvailability> onlineDays = [];
  for (int i = 0; i <= 10; i++) {
    onlineDays.add(
      OnlineAvailability(
        day: DateTime.now().add(
          Duration(days: i),
        ),
        timesAvailable: const [
          TimeInDayOnline(
            available: true,
            timeOfDay: '15:00',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '15:15',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '15:30',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '15:45',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '16:00',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '16:15',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '16:30',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '16:45',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '17:00',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '17:15',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '17:30',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '17:45',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '18:00',
          ),
          TimeInDayOnline(
            available: true,
            timeOfDay: '18:15',
          ),
          TimeInDayOnline(
            available: false,
            timeOfDay: '18:30',
          ),
        ],
      ),
    );
  }
  return onlineDays;
}

List<OfflineAvailability> generateOffline() {
  final offline = <OfflineAvailability>[];
  for (int i = 0; i <= 10; i++) {
    offline.add(
      OfflineAvailability(
        day: DateTime.now().add(
          Duration(days: i),
        ),
        timeFrom: '17:00',
        timeTo: '22:00',
      ),
    );
  }
  return offline;
}

Future<void> send() async {
  print('f');
  final ref = FirebaseFirestore.instance.collection('doctors');
  for (var doctor in doctors) {
    await ref.doc(doctor['id']).set(doctor);
  }
}
