import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class ACT extends State {
  ACT() : super(States.ACT, 'Australian Capital Territory State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'Domestic Animals Act 2000',
        link:
            'http://www.legislation.act.gov.au/a/2000-86/current/pdf/2000-86.pdf',
        section: '\n\nSection/s Applicable:\n\n Section 104, Rights of Persons Accompanied by Assistance Animals\n\nSection 105, Exclusion of Assistance Animal from Public Place\n\nSection 106, Imposition of Excess Charges for Assistance Animal\n\n',
        body: [
          'Excerpt from Section 104:',
          '(1) Despite any other territory law (other than the Discrimination Act 1991 ), a person with a disability',
          'accompanied by an assistance animal has the same right of access to, and the same right to the use of, a',
          'public place as a person who is not accompanied by an assistance animal.',
          '(2) Without limiting subsection (1), a person with a disability does not commit an offence merely by taking an assistance animal', 
          'onto or into, or allowing the animal to enter, a public place.',
          '',
          'Maximum Fine for Breach of Act:',
          '10 penalty units',
          'Value of One Penalty Unit as of 2012:',
          '\$110.00',
          '',
          'Exceptions to Access under Act:',
          'It is not unlawful to impose a charge to a person with a dog guide if expense is reasonably occurred by the',
          'third person because of the presence of the dog guide.',
          '',
          'Other Relevant Legislation:',
          'Discrimination Act (NT)',
        ],
      ),
    );

    this.legislation = temp;
  }
}
