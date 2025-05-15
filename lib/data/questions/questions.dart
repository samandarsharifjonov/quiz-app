import '../models/quiz_model.dart';

final List<Question> quizQuestions = [
  Question(
    text: "Flutter nima?",
    options: [
      "Mobil ilovalarni yaratish uchun ishlatiladigan framework",
      "Server dasturlarini yaratish uchun vosita",
      "Foydalanuvchi interfeysi dizayn vositasi",
      "Ma'lumotlar bazasi tizimi",
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    text: "Flutter ilovalari qaysi dasturlash tilida yoziladi?",
    options: [
      "Java",
      "Kotlin",
      "Dart",
      "Swift",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Flutter’da widget nima?",
    options: [
      "Ma'lumotlar bazasi",
      "Ilova sarlavhasi",
      "Interfeysdagi har qanday komponent (element)",
      "Fayl nomi",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "StatefulWidget va StatelessWidget o‘rtasidagi farq nima?",
    options: [
      "StatefulWidget o‘zgaruvchan holatga ega, StatelessWidget esa yo‘q",
      "StatelessWidget tarmoq funksiyalarini chaqira oladi",
      "StatefulWidget faqat iOS uchun ishlatiladi",
      "Ularning orasida hech qanday farq yo‘q",
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    text: "Flutter’da `setState()` metodi nima uchun ishlatiladi?",
    options: [
      "Ilovani ishga tushirish uchun",
      "Interfeysni yangilash uchun",
      "Fayl yaratish uchun",
      "Ilovani yopish uchun",
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    text: "Flutter’da `build()` funksiyasi nima qiladi?",
    options: [
      "Ma'lumotlar bazasini chaqiradi",
      "Tugmalarni aniqlaydi",
      "Interfeysni yaratadi",
      "Ilovani ishga tushiradi",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "`pubspec.yaml` faylida nima saqlanadi?",
    options: [
      "Ma'lumotlar bazasi",
      "Kod yoziladi",
      "Paketlar, resurslar va versiyalar",
      "UI dizayni",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Flutter’da navigatsiya uchun qaysi metod ishlatiladi?",
    options: [
      "push() va pop()",
      "open() va close()",
      "load() va unload()",
      "start() va stop()",
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    text: "Flutter ilovasida `hot reload` nima vazifani bajaradi?",
    options: [
      "Ilovani yangilaydi",
      "Ilovani to'xtatadi",
      "Koddagi o‘zgarishlarni tezda aks ettiradi",
      "Xatoliklarni tuzatadi",
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    text: "Flutter’da `Column` va `Row` nima uchun ishlatiladi?",
    options: [
      "Ma'lumotlar bazasini tartiblash uchun",
      "Elementlarni vertikal yoki gorizontal joylashtirish uchun",
      "Ilovani ishga tushirish uchun",
      "Xatoliklarni aniqlash uchun",
    ],
    correctAnswerIndex: 1,
  ),
];
