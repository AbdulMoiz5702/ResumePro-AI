
import '../models/certificated.dart';
import '../models/eduaction_model.dart';
import '../models/exprience_model.dart';
import '../models/language_model.dart';
import '../models/skills_model.dart';
import '../models/user_model.dart';

UserModel userModel = UserModel(
    fullName: 'Abdul Mohiz Khan',
    phoneNumber: '+92 222 333444',
    currentPosition: 'Flutter Developer',
    email: 'email@gmail.com',
    address: 'United Kingdom',
    bio:
        'I am Flutter developer with expertise in firebase ,Push notification ,Rest Apis and State managment');

List<ExperienceData> experienceList = [
  ExperienceData(
      experienceTitle: 'Flutter Developer',
      experiencePlace: 'Falconbyte Solution',
      experiencePeriod: '2023 - 2024',
      experienceDescription:
          'Applied clean architecture and MVVM pattern, improving app scalability, maintainability, and efficiency by 30%.'),
  ExperienceData(
      experienceTitle: 'Flutter Developer',
      experiencePlace: 'Ranking Grow Solution',
      experiencePeriod: '2023 - 2024',
      experienceDescription:
          'Deployed and managed mobile applications on Google Play Store and Apple App Store, ensuring seamless updates and user support'),
];

List<Education> education = [
        Education('BS-SE', 'University Of Haripur', '2023 - 2024'),
        Education('Pre Engeerining', 'Sir Syed Model School', '2023 - 2024'),
];

List<Language> language = [
        Language('English'),
        Language('Urdu'),
];

List<SkillsModel> skills = [
        SkillsModel('Dart'),
        SkillsModel('Flutter'),
        SkillsModel('Firebase'),
        SkillsModel('Rest Api'),
        SkillsModel('CI/CD'),
        SkillsModel('Push Notification'),
];

List<Certificated> certificated = [
        Certificated('Flutter Developer'),
        Certificated('Google IT Support'),
];
