import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidelinesPdf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guidelines'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guidelines for ISA-VESIT',
                style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                '1. Objective\n'
                'The purpose of these guidelines is to provide a clear understanding of the rules and procedures for the ISA-VESIT inventory system.\n\n'
                '2. Issuance of Components\n'
                '● Eligibility: Only students who are currently enrolled for ISA Memberships are eligible to borrow components.\n'
                '● Issuance Procedure:\n'
                '  ○ Components will be issued based on availability and necessity.\n'
                '  ○ A record of issued components will be maintained by the ISA Council.\n\n'
                '3. Student Responsibilities\n'
                '● Care: Students are responsible for the proper care and handling of the components.\n'
                '● Usage: Components must be used only for their intended educational or project purposes.\n'
                '● Return: Components must be returned by the due date specified at the time of issuance.\n'
                '● Modification: Modification of the components is not allowed.\n'
                '● Damage: No damage is allowed. Students will have to pay the entire amount if the component is damaged.\n'
                '● Loss: If a component is lost, the student is responsible for it and has to pay the entire amount of the component as listed below.\n'
                '● Issuance/Reissuance: Components must be issued or reissued in the presence of and with the approval of a council member only.\n'
                '● Reissue: The component should be reissued within 1 month of time after issuing the component.\n'
                '● Timing: For issuance/reissuance of the component the timings are 1) 1:00 pm - 1:30 pm 2) 3:30 pm - 4:00 pm\n\n'
                '4. Return Policy\n'
                '● Due Date: Components must be returned by the due date specified during issuance.\n'
                '● Condition: Components must be returned in the same condition as they were issued.\n'
                '● All the components should be returned to the council before the end semester exam.\n'
                '● Refer Fine Structure for more terms and conditions regarding the fine payment.\n\n'
                '5. Fine Structure and Payment\n'
                '● Late Returns:\n'
                '  ○ A fine will be imposed for each day the component is returned late.\n'
                '  ○ The maximum late fine will not exceed 2500 Rs.\n'
                '● Component Damage:\n'
                '  ○ No damage to the components would be accepted.\n'
                '  ○ In case of damage: Replacement Cost of the new component.\n'
                '● Loss of Component:\n'
                '  ○ Full replacement cost of the component will be charged.\n'
                '● Payment:\n'
                '  ○ Fines must be paid within 5 days of notification.\n'
                '  ○ Payment should be made online.\n\n'
                '6. Consequences of Non-Payment\n'
                '● Failure to pay fines may result in:\n'
                '  ○ Suspension of borrowing privileges.\n'
                '  ○ Membership Suspension.\n'
                '  ○ Clearance for collecting Leaving Certificate would not be provided by the Central Library of College.\n\n'
                '7. Dispute Resolution\n'
                '● Students who wish to dispute a fine may do so by submitting a written appeal to the ISA committee within 3 days of fine notification.\n'
                '● The decision of the ISA committee will be final.\n\n'
                '8. Policy Review\n'
                '● This policy will be reviewed annually and is subject to change. Updates will be communicated to all students via email and WhatsApp.\n\n'
                '9. Component Price List:\n'
                'https://bit.ly/ComponentPrice\n'
                'Note: Subject to Change of Price\n\n'
                '10. Contact Information\n'
                'For any questions or concerns regarding this policy, please contact:\n'
                'Sr. Treasurer: Atishkar Singh\n'
                'Phone No: 9049120954',
                style: GoogleFonts.lato(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
