class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Tempat wafatnya Nabi Muhammad SAW sekaligus pusat perintahan Islam dikota…",
    "options": ['Mekah', 'Madinah', 'Jedah', 'Palestina'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Surat Alkafirun terdiri dari berapa ayat?",
    "options": ['4', '5', '6', '7'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Bukit Tursina adalah tempat Nabi Musa AS menerima kitab dari ALLAH SWT untuk kaum:",
    "options": ['Nasrani', 'Mayusi', 'Yahudi', 'Qurais'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Suroh At Tin merupakan suroh:",
    "options": ['Madaniyah', 'Makkiyah', 'Suroh yang terakhir', 'Hasanah'],
    "answer_index": 3,
  },
  // {
  //   "id": 5,
  //   "question": "Perhitungan amal baik dan perbuatan jahat disebut juga:",
  //   "options": ['Yumul mizan', 'Yaumul hisab', 'Yaumul ba’as', 'Yaumul kiamat'],
  //   "answer_index": 1,
  // },
];
