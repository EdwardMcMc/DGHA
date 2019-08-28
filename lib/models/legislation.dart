import './language.dart';
import './states.dart';

class Legislation {
  String title;
  List<String> body;
  String link;
  States state;
  Language language;
  String section;

  Legislation(
      {this.title,
      this.body,
      this.link,
      this.state,
      this.language,
      this.section});
}
