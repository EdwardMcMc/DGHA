import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class QLD extends State {
  QLD() : super(States.QLD, 'Queensland State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Guide, Hearing and Assistance Dogs Act 2009',
        link:
            'http://www.communities.qld.gov.au/disability/key-projects/guide-hearing-and-assistance-dogs',
        section: '\r\rSection/s Applicable:\r\rSection 8, People with a Disability May be Accompanied by Their Guide, Hearing and Assistance Dogs\r\r',
        body: [
          'Excerpt from Section 8:',
          '(1) Despite any other Act, a person with a disability who relies on a guide, hearing or assistance dog to',
          'reduce the person’s need for support may be accompanied by the guide, hearing or assistance dog in a',
          'public place or public passenger vehicle.',
          '(2) Also, a person with a disability who relies on a guide, hearing or assistance dog to, reduce the person’s',
          'need for support does not commit an offence merely by taking the guide, hearing or assistance dog into a',
          'public place or public passenger vehicle.',
          '',
          'Maximum Fine for Breach of Act:',
          '2 Penalty Units',
          'Value of One Penalty Unit as of 2012:',
          '\$100.00',
          '',
          'Exceptions to Access Under Act:',
          'an in-patient ward',
          'a labour ward',
          'a procedure room',
          'a recovery area',
          'an area in which the standard of hygiene is maintained at a significantly high level for the',
          'purpose of preventing infection or the spread of disease',
          'an ambulance',
          'a part of a public place or public passenger vehicle where food is ordinarily prepared',
          'It is not unlawful for a person with an dog guide to be asked to produce evidence to certify that their dog is an assistance animal.',
          '',
          'Other Legislation:',
          'Anti-Discrimination Act 1991',
          'Building Units and Group Titles Act 1980.',
        ],
      ),
    );

    this.legislation = temp;
  }
}
