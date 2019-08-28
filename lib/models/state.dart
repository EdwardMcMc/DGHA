import './legislation.dart';
import './states.dart';

class State {
  List<Legislation> legislation;
  States state;
  String title;

  State(this.state, this.title);
}
