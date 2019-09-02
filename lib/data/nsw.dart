import '../models/state.dart';
import '../models/states.dart';
import '../models/language.dart';
import '../models/legislation.dart';

class NSW extends State {
  NSW() : super(States.NSW, 'New South Wales State Legislation') {
    generateLegislation(Language.English);
  }

  generateLegislation(Language language) {
    List<Legislation> temp = List<Legislation>();
    temp.add(
      Legislation(
        language: language,
        title: 'The Companion Animals Act 1998',
        link:
            'http://www.austlii.edu.au/au/legis/nsw/consol_act/caa1998174/index.html',
        section: '\n\nSection/s Applicable:\n\n 14, Dogs Prohibited in Some Public Places\n\n 59, Person with a Disability entitled to be Accompanied by Assistance Animal\n\n 60, Assistance Animal Not to be Denied Entry\n 61, Unlawful to Impose Charge for Entry of Assistance Animal\n\n',
        body: [
          'Person with a disability entitled to be accompanied by assistance animal\n',
          '59 Person with a disability entitled to be accompanied by assistance animal\n',
          '(1) A person with a disability is entitled to be accompanied by an assistance animal being used bona fide by the person to assist the person, into or onto any building or place open to or used by the public or on any public transport.\n',
          '(2) The person is not guilty of an offence merely because the person takes the animal into or onto or permits the animal to enter or be in or on any such building or place or any public transport while the person is using the animal bona fide to assist the person.\n',
          '(3) This section applies despite the provisions of any other Act or instrument made under an Act.'
          '',
          'Maximum Fine for Breach of Act:',
          '8 penalty units',
          'Value of One Penalty Unit as of 2012:',
          '\$110.00',
          '',
          'Fine Issued By:',
          'NSW Police',
          'Local Council',
          '',
          'Exceptions to Access Under Act',
          '	It is not unlawful to impose a charge to a person with a dog guide if expense is reasonably occurred by the third person because of the presence of the dog guide.',
          '',
          'Other Relevant Legislation',
          'Anti-Discrimination Act 1977 (New South Wales)',
          'Passenger Transport Act 1990 (New South Wales)',
          'Rail Safety Act 1993 (New South Wales)',
        ],
      ),
    );

    this.legislation = temp;
  }
}
