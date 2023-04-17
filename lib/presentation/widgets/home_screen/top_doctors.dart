import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/domain/entities/doctor.dart';

List<Map<String, dynamic>> doctors = [
  Doctor(
    location: ClinicLocation(
      location: 'Dokki',
      coordinates: [30.050238, 31.212539],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '112393423',
    name: 'Dr. Ahmed Samir',
    speciality: 'Anesthesiology',
    aboutDoctor:
        'Dr. Samir is an experienced anesthesiologist who has worked in many hospitals and medical centers. He is known for his calm and reassuring manner, and for his expertise in managing pain and discomfort during surgical procedures.',
    joinedOn: DateTime.parse('2015-10-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Samir is a fantastic anesthesiologist. He made me feel comfortable and at ease during my surgery, and I had no pain or discomfort afterwards.',
      ),
      const Review(
        rating: 4.5,
        review:
            'Dr. Samir was very professional and attentive. He explained everything to me and answered all of my questions, which helped me feel more relaxed about the surgery.',
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
    location: ClinicLocation(
      location: 'Dokki',
      coordinates: [30.045153, 31.209755],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '3456123453821',
    name: 'Dr. Amir Hassan',
    speciality: 'Emergency Medicine',
    aboutDoctor:
        'Dr. Hassan is a highly skilled emergency medicine specialist with extensive experience in managing patients with acute medical conditions. He is dedicated to providing the highest quality of care in a timely and efficient manner.',
    joinedOn: DateTime.parse('2015-08-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Hassan is an outstanding emergency medicine physician. He was able to diagnose my condition quickly and provide effective treatment.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I was very impressed with Dr. Hassan\'s professionalism and expertise. He made me feel comfortable and reassured throughout my visit.',
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
    location: ClinicLocation(
      location: 'Zamalek',
      coordinates: [30.064480, 31.221731],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/1.out.png?alt=media&token=8caf1f56-6df5-420d-9b0d-47a867c76faa',
    id: '89997741',
    name: 'Dr. Yara Nasser',
    speciality: 'Hematology',
    aboutDoctor:
        'Dr. Nasser is a skilled hematologist with years of experience in the diagnosis and treatment of blood disorders. She is dedicated to providing personalized care to her patients and keeping up-to-date with the latest treatments and research.',
    joinedOn: DateTime.parse('2015-08-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Nasser is an amazing doctor. She is very knowledgeable and caring, and takes the time to explain everything in detail. I highly recommend her.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I\'ve been seeing Dr. Nasser for years and she has always been very helpful and attentive to my needs. She has a great bedside manner and is very professional.',
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
    location: ClinicLocation(
      location: 'Nasr City',
      coordinates: [30.066468, 31.342921],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '657281499',
    name: 'Dr. Ahmed Salah',
    speciality: 'Infectious Disease',
    aboutDoctor:
        'Dr. Salah is a highly skilled infectious disease specialist with years of experience in the diagnosis and treatment of infectious diseases. He is dedicated to providing personalized care to his patients and helping them manage their conditions.',
    joinedOn: DateTime.parse('2015-03-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Salah is an amazing doctor. He is very knowledgeable and took the time to answer all of my questions. I highly recommend him.',
      ),
      const Review(
        rating: 4.5,
        review:
            'Dr. Salah is a great doctor. He is very patient and explains things in a way that is easy to understand.',
      ),
    ],
    rating: 4.65,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    location: const ClinicLocation(
      location: 'Mohandessin',
      coordinates: [30.052717, 31.205928],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '7773417',
    name: 'Dr. Hossam Ali',
    speciality: 'Otolaryngology',
    aboutDoctor:
        'Dr. Ali is a skilled otolaryngologist with years of experience in the diagnosis and treatment of conditions related to the ear, nose, and throat. He is committed to providing his patients with the highest level of care.',
    joinedOn: DateTime.parse('2015-06-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Ali is an amazing doctor! He was very attentive and answered all of my questions thoroughly. I highly recommend him to anyone in need of an ENT specialist.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I had a great experience with Dr. Ali. He was very professional and helped me find a solution to my chronic ear pain. I would definitely recommend him to others.',
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
    location: ClinicLocation(
      location: 'Maadi',
      coordinates: [29.958800, 31.252556],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/1.out.png?alt=media&token=8caf1f56-6df5-420d-9b0d-47a867c76faa',
    id: '1174331',
    name: 'Dr. Nadia Mahmoud',
    speciality: 'Psychiatry',
    aboutDoctor:
        'Dr. Mahmoud is a compassionate psychiatrist with a focus on patient-centered care. She has years of experience in treating a wide range of mental health conditions, including anxiety disorders, depression, and bipolar disorder.',
    joinedOn: DateTime.parse('2012-06-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Mahmoud is a wonderful psychiatrist who really cares about her patients. She takes the time to listen and understand their concerns, and works with them to develop a treatment plan that meets their individual needs.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I have been seeing Dr. Mahmoud for several months now and she has helped me so much. She is kind, patient, and understanding, and always makes me feel comfortable and supported.',
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
    location: ClinicLocation(
      location: 'Heliopolis',
      coordinates: [30.086928, 31.343032],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '9375839284',
    name: 'Dr. Ahmed Samir',
    speciality: 'Pulmonology',
    aboutDoctor:
        'Dr. Samir is a pulmonologist with extensive experience in the diagnosis and treatment of respiratory conditions. He is committed to providing compassionate care to his patients and helping them manage their pulmonary health.',
    joinedOn: DateTime.parse('2015-08-10'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Samir is a great doctor. He took the time to explain my condition and answer all of my questions.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I highly recommend Dr. Samir. He is knowledgeable and caring, and made me feel at ease during my visit.',
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
    location: ClinicLocation(
      location: 'Zamalek',
      coordinates: [30.063056, 31.224389],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '12945217',
    name: 'Dr. Ahmed Farouk',
    speciality: 'Radiology',
    aboutDoctor:
        'Dr. Ahmed Farouk is a highly skilled radiologist with years of experience in the diagnosis and treatment of various imaging modalities, including X-ray, CT scan, and MRI. He is dedicated to providing personalized care to his patients and using state-of-the-art technology to achieve accurate diagnoses.',
    joinedOn: DateTime.parse('2015-02-15'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Farouk is an excellent radiologist. He was able to identify a problem that other doctors missed and provided me with a clear plan of action.',
      ),
      const Review(
        rating: 4.5,
        review:
            'Dr. Farouk was very professional and knowledgeable. He explained everything to me in a way that I could understand.',
      ),
    ],
    rating: 4.7,
    availableOn: DoctorAvailability(
      online: false,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: [],
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    location: ClinicLocation(
      location: 'Zamalek',
      coordinates: [30.064225, 31.224778],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/1.out.png?alt=media&token=8caf1f56-6df5-420d-9b0d-47a867c76faa',
    id: '111545127699',
    name: 'Dr. Amira Mohamed',
    speciality: 'Rheumatology',
    aboutDoctor:
        'Dr. Mohamed is a highly experienced rheumatologist who specializes in the diagnosis and treatment of rheumatic diseases, such as arthritis and lupus. She is committed to providing the highest quality care to her patients.',
    joinedOn: DateTime.parse('2015-09-01'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Mohamed is an excellent doctor. She took the time to listen to my concerns and provided me with a thorough evaluation and treatment plan. Highly recommended!',
      ),
      const Review(
        rating: 4.5,
        review:
            'I have been a patient of Dr. Mohamed for several years now and I can say with confidence that she is one of the best rheumatologists in the city. She is knowledgeable, caring, and always takes the time to answer my questions.',
      ),
    ],
    rating: 4.6,
    availableOn: DoctorAvailability(
      online: true,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: generateOnline(),
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    location: ClinicLocation(
      location: 'Heliopolis',
      coordinates: [30.091728, 31.322606],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '999744',
    name: 'Dr. Ahmed Abdelrahman',
    speciality: 'Surgery',
    aboutDoctor:
        'Dr. Ahmed Abdelrahman is a skilled general surgeon with extensive experience in performing various surgical procedures, including hernia repair, appendectomy, and gallbladder removal. He is dedicated to providing compassionate care to his patients and helping them achieve optimal health outcomes.',
    joinedOn: DateTime.parse('2015-10-15'),
    reviews: [
      const Review(
        rating: 4.8,
        review:
            'Dr. Abdelrahman is an excellent surgeon. He performed my hernia surgery with great skill and care. His staff was also very friendly and helpful throughout the process.',
      ),
      const Review(
        rating: 4.5,
        review:
            'I had my gallbladder removed by Dr. Abdelrahman and I couldn\'t be happier with the outcome. He is a highly skilled surgeon and a very caring doctor. I would recommend him to anyone in need of surgery.',
      ),
    ],
    rating: 4.7,
    availableOn: DoctorAvailability(
      online: false,
      offline: true,
      offlineAvailability: generateOffline(),
      onlineAvailability: null,
    ),
    doctorState: DoctorState.available,
  ).toJson(),
  Doctor(
    location: ClinicLocation(
      location: 'Maadi',
      coordinates: [29.966981, 31.250397],
    ),
    imageUrl:
        'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=2c843e0e-9c06-4e26-971f-60dd6b40a506',
    id: '39944',
    name: 'Dr. Omar El-Sayed',
    speciality: 'Surgery',
    aboutDoctor:
        'Dr. Omar El-Sayed is an experienced orthopedic surgeon who specializes in treating injuries and conditions affecting the musculoskeletal system, including fractures, sprains, and arthritis. He is dedicated to providing his patients with the highest quality care and helping them achieve optimal recovery.',
    joinedOn: DateTime.parse('2012-08-01'),
    reviews: [
      const Review(
        rating: 4.5,
        review:
            'Dr. El-Sayed is a highly skilled orthopedic surgeon. He performed my knee replacement surgery and the results were amazing. He also took the time to explain everything to me and answer all of my questions.',
      ),
      const Review(
        rating: 4.2,
        review:
            'I had a wrist fracture and Dr. El-Sayed did an excellent job in repairing it. He is a very caring and attentive doctor who truly cares about his patients.',
      ),
    ],
    rating: 4.4,
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
  final ref = FirebaseFirestore.instance.collection('doctors');
  for (var doctor in doctors) {
    await ref.doc(doctor['id']).set(doctor);
  }
}

List<ClinicLocation> mockLocations = const [
  ClinicLocation(location: 'Cairo', coordinates: [30.049334, 31.233162]),
  ClinicLocation(location: 'Giza', coordinates: [30.013056, 31.208853]),
  ClinicLocation(location: 'Cairo', coordinates: [30.079102, 31.316054]),
  ClinicLocation(location: 'Giza', coordinates: [30.052568, 31.212046]),
  ClinicLocation(location: 'Cairo', coordinates: [30.056297, 31.262758]),
  ClinicLocation(location: 'Giza', coordinates: [30.030991, 31.208726]),
  ClinicLocation(location: 'Cairo', coordinates: [30.063136, 31.244160]),
  ClinicLocation(location: 'Giza', coordinates: [30.024626, 31.200904]),
  ClinicLocation(location: 'Cairo', coordinates: [30.048315, 31.273883]),
  ClinicLocation(location: 'Giza', coordinates: [30.027977, 31.212465]),
  ClinicLocation(location: 'Cairo', coordinates: [30.027620, 31.221661]),
  ClinicLocation(location: 'Giza', coordinates: [30.056802, 31.191923]),
  ClinicLocation(location: 'Cairo', coordinates: [30.033857, 31.234091]),
  ClinicLocation(location: 'Giza', coordinates: [30.018011, 31.200490]),
  ClinicLocation(location: 'Cairo', coordinates: [30.045422, 31.221682]),
  ClinicLocation(location: 'Giza', coordinates: [30.055050, 31.205689]),
  ClinicLocation(location: 'Cairo', coordinates: [30.057862, 31.242690]),
  ClinicLocation(location: 'Giza', coordinates: [30.017110, 31.208787]),
  ClinicLocation(location: 'Cairo', coordinates: [30.070365, 31.230707]),
  ClinicLocation(location: 'Giza', coordinates: [30.031680, 31.212331]),
  ClinicLocation(
    location: 'Dokki',
    coordinates: [30.047463, 31.214321],
  ),
  ClinicLocation(
    location: 'Heliopolis',
    coordinates: [30.089845, 31.328601],
  ),
  ClinicLocation(
    location: 'Mohandeseen',
    coordinates: [30.058313, 31.204157],
  ),
  ClinicLocation(
    location: 'Giza',
    coordinates: [30.008052, 31.208850],
  ),
  ClinicLocation(
    location: 'Nasr City',
    coordinates: [30.070227, 31.336276],
  ),
  ClinicLocation(
    location: 'Maadi',
    coordinates: [29.967010, 31.248352],
  ),
  ClinicLocation(
    location: 'Zamalek',
    coordinates: [30.065314, 31.221316],
  ),
  ClinicLocation(
    location: 'October',
    coordinates: [29.969139, 30.957170],
  ),
  ClinicLocation(
    location: 'Fifth Settlement',
    coordinates: [30.012003, 31.463014],
  ),
  ClinicLocation(
    location: '6th of October City',
    coordinates: [29.972918, 30.944710],
  ),
  ClinicLocation(
    location: 'Rehab City',
    coordinates: [30.048985, 31.435289],
  ),
  ClinicLocation(
    location: 'Shubra',
    coordinates: [30.061056, 31.245135],
  ),
  ClinicLocation(
    location: 'Abbaseya',
    coordinates: [30.066801, 31.256248],
  ),
  ClinicLocation(
    location: 'New Cairo',
    coordinates: [30.015254, 31.488090],
  ),
  ClinicLocation(
    location: 'El Marg',
    coordinates: [30.166563, 31.378139],
  ),
  ClinicLocation(
    location: 'El Basateen',
    coordinates: [30.050808, 31.259861],
  ),
  ClinicLocation(
    location: 'Downtown Cairo',
    coordinates: [30.047616, 31.239962],
  ),
  ClinicLocation(
    location: 'Shoubra El-Kheima',
    coordinates: [30.150474, 31.265301],
  ),
  ClinicLocation(
    location: 'Helwan',
    coordinates: [29.846350, 31.329047],
  ),
  ClinicLocation(
    location: 'El-Maasara',
    coordinates: [29.903366, 31.285507],
  ),
  ClinicLocation(
    location: 'Mohandessin, Giza',
    coordinates: [30.0476, 31.2099],
  ),
  ClinicLocation(
    location: 'El Haram, Giza',
    coordinates: [29.9906, 31.1392],
  ),
  ClinicLocation(
    location: 'Nasr City, Cairo',
    coordinates: [30.0682, 31.3456],
  ),
  ClinicLocation(
    location: '6th of October City, Giza',
    coordinates: [29.9728, 30.943],
  ),
];

List<String> images = [
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/3.out.png?alt=media&token=3b1c09d9-ce1b-48ea-a83b-a425b48908d7',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/2.out.png?alt=media&token=d9bb1486-4b8b-4d0c-aa08-6a806ec9c931',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/1.out.png?alt=media&token=917fd0dd-b277-4c73-a83e-1abcbf6e7edf',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/12.out.png?alt=media&token=fc34ea17-00e0-4bb2-a229-c1f9c656f9b8',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/6.out.png?alt=media&token=d02c2426-191a-418c-bbf9-82831a949d7e',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/5.out.png?alt=media&token=4139830f-6e5f-475a-beff-763760df8103',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/8.out.png?alt=media&token=5995ea60-65fd-4196-9f8d-0a318a3359f0',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/4.out.png?alt=media&token=2c49b258-5e6d-4dad-9ade-7c69abfae19b',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/7.out.png?alt=media&token=4ea0a320-ccbf-49ea-a34c-e5e343eb6bfc',
  'https://www.pngall.com/wp-content/uploads/2018/05/Doctor.png',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/9.out.png?alt=media&token=04063569-5011-416a-96fe-f8fe33e45d8d',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/11.out.png?alt=media&token=10bddd21-8dd9-4bf2-b04a-3a27f8069400',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/12.out.png?alt=media&token=fc34ea17-00e0-4bb2-a229-c1f9c656f9b8',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/13.out.png?alt=media&token=3bd0c138-ec2f-455c-bb36-c826c5d3b7d3',
  'https://firebasestorage.googleapis.com/v0/b/doclink-d30a3.appspot.com/o/10.out.png?alt=media&token=d9c87b2b-6275-49bf-b514-4a9f0946ad7c',
];
