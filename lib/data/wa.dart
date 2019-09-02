import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class WA extends State {
  WA() : super(States.WA, 'Western Australia State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Dog Act 1976',
        link:
            'http://www.austlii.edu.au/au/legis/wa/consol_act/da197644/',
        section: '\n\nSection/s Applicable:\n\n Section 8, Special Provisions for Guide Dogs\n\n',
        body: [
          'Excerpt from Section 8:',
          '(1) Notwithstanding anything contained elsewhere in this Act or in any other Act, regulation, local law',
          'or by-law a person who is blind or partially blind?',
          '(a) is entitled to be accompanied by a dog bona fide used by him as a guide dog, in any building or place',
          'open to or used by the public, for any purpose, or in any public transport; and',
          '(b) is not guilty of an offence by reason only that he takes that dog into or permits that dog to enter any',
          'building or place open to or used by the public or on any public transport.',
        ],
      ),
    );

    this.legislation = temp;
  }
}
