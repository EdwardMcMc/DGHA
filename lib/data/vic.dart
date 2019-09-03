import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class VIC extends State {
  VIC() : super(States.VIC, 'Victorian State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Domestic Animals ACT 1994',
        link:
            'http://www.austlii.edu.au/au/legis/vic/consol_act/daa1994163/',
        section: '\n\nSection/s Applicable:\n\nSection 7, Exemptions for Guide Dogs\n',
        body: [
          '\n(1) A visually impaired person or hearing impaired person who keeps and uses a dog as a guide dog is not'+
          'liable for an offence under this Act in respect of that dog, where, in acting in the manner which would'+
          'constitute the offence, the dog was performing its functions as a guide dog.\n',
          '(4) Despite anything in any other Act or subordinate instrument a visually impaired person, hearing'+
          'impaired person or person fftraining a guide dog may, at all times and in all places, be accompanied by a'+
          'dog kept and used, or trained by him or her as a guide dog.',
          '',
          '\nMaximum Fine for Breach of Act:',
          'Value of One Penalty Unit as of 2012: \$125.19',
          '',
        ],
      ),
    );

    this.legislation = temp;
  }
}
