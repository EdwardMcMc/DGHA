import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class NT extends State {
  NT() : super(States.NT, 'Northern Territory State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Anti Discrimination Act 1992',
        link:
            'http://www.adc.nt.gov.au/',
        section: '\n\nSection/s Applicable:\n\n Section 21, Discrimination by Refusal to Allow Guide Dog.\n\n',
        body: [
          'Excerpt from Section 21:',
          '(1) For the purposes of this Act, a person discriminates on the ground of impairment against a person',
          'with a visual, hearing or mobility impairment if the person treats the person with the impairment less favourably because the person has a guide dog.',
          '',
          'Maximum Fine for Breach of Act:',
          'Fixed penalty of \$500',          
        ],
      ),
    );

    this.legislation = temp;
  }
}
