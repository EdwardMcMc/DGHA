import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class SA extends State {
  SA() : super(States.SA, 'Southern Australia State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Dog and Cat Management Act 1995',
        link:
            'http://www.legislation.sa.gov.au/LZ/C/A/Dog%20and%20Cat%20Management%20Act%201995.aspx/',
        section: '\n\nSection/s Applicable:\n\n Section 21, Accreditation of Disability Dogs, Guide Dogs etc\n\nSection 81, Disability Dogs, Guide Dogs etc\n\n',
        body: [
          'Excerpt from Section 81:',
          '(1) Despite this Act or any other Act?',
          '(a) a person who is wholly or partially blind or deaf, or otherwise disabled, is entitled to be accompanied',
          'by an accredited disability dog, guide dog or hearing dog in a public place or public passenger vehicle; and',
          '(b) the occupier or person in charge of a public place or public passenger vehicle must not refuse access to',
          'the place or vehicle to a person who is wholly or partially blind or deaf, or otherwise disabled, on the',
          'ground that the person is accompanied by a disability dog, guide dog or hearing dog.',
          '',
          'Maximum Fine for Breach of Act:',
          '\$250',
          '',
          'Exceptions to Access Under Act:',
          'It is not unlawful for a person with an assistance animal to be asked to produce evidence that their dog is',
          'an assistance animal.'
        ],
      ),
    );

    this.legislation = temp;
  }
}
