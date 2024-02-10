



class  QuizQuestion{
  const QuizQuestion(this.question,this.answers);
  final question;
  final List<String>answers;


 List<String> shafeledAnswers(){
    var  shafeldList = List.of(answers);
    shafeldList.shuffle();
    return shafeldList;
  }
}