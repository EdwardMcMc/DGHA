import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class TAS extends State {
  TAS() : super(States.TAS, 'Tasmanian State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Guide Dogs and Hearing Dogs Act 1967',
        link:
            'http://lexisweb.lexisnexis.com.au/Read-Legislation.aspx?s=tas&f=TAS_ACT_1967-42&t=guide-dogs-and-hearing-dogs-act-1967',
        section: '\n\nSection/s Applicable:\n\nSection 3, Rights of Guide Dog Users and Trainers in Respect of Public Places and Transport\n\n',
        body: [
          'Excerpt from Section 3:',
          '(1) A person who is blind or vision impaired, deaf or hearing impaired or a trainer?',
          '(a) is entitled to be accompanied by a guide dog into any public place or onto any public passenger vehicle; and',
          '(b) does not commit an offence by taking a guide dog into or onto, or permitting a guide dog to remain in or on, a public place or public passenger vehicle.',
          '(2) A person who is in charge of a public place or public passenger vehicle, or the servant or agent of a person in charge of a public place or public passenger vehicle, must not?',
          '(a) refuse to allow a person accompanied by a guide dog into that place or onto that vehicle; or',
          '(b) direct a person accompanied by a guide dog to leave that place or vehicle; or',
          '(c) deny accommodation or service to a person accompanied by a guide dog.',
          '',
          'Maximum Fine for Breach of Act:',
          '20 penalty units',
          'Value of One Penalty Unit as of 2012:',
          '\$130.00',
          '',
          'Exceptions to Access Under Act:',
          'It is not unlawful for a person with an assistance animal to be asked to produce evidence that their dog is',
          'an assistance animal.'
          '',
          'Exceptions to Access Under Act:',
          'It is not unlawful for a person with an assistance animal to be asked to produce evidence that their dog is', 
          'an assistance animal.',
          '',
          'Other legislation:',
          'Dog Control Act 2000'
        ],
      ),
    );

    this.legislation = temp;
  }
}
