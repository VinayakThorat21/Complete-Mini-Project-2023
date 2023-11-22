import 'package:careplus/data/patient_medical_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiabeticCount extends StatelessWidget {
  const DiabeticCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic dataPackage = Provider.of<PatientInfo>(context, listen: false);

    return Consumer<PatientInfo>(
      builder: (context, patientInfo, Widget? child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RelationCount(
                  person: 'Parents',
                  leftPressed: () {
                    dataPackage.relationDecrement('parent');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('parent');
                  },
                  count: patientInfo.parents,
                ),
                RelationCount(
                  person: 'Grandparents',
                  leftPressed: () {
                    dataPackage.relationDecrement('grandparent');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('grandparent');
                  },
                  count: patientInfo.grandParents,
                ),
                RelationCount(
                  person: 'Aunt/uncle',
                  leftPressed: () {
                    dataPackage.relationDecrement('auntuncle');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('auntuncle');
                  },
                  count: patientInfo.auntUncle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RelationCount(
                  person: 'Siblings',
                  leftPressed: () {
                    dataPackage.relationDecrement('sibling');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('sibling');
                  },
                  count: patientInfo.siblings,
                ),
                RelationCount(
                  person: 'First cousins',
                  leftPressed: () {
                    dataPackage.relationDecrement('firstcousin');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('firstcousin');
                  },
                  count: patientInfo.firstCousins,
                ),
                RelationCount(
                  person: 'Relations',
                  leftPressed: () {
                    dataPackage.relationDecrement('relatives');
                  },
                  rightPressed: () {
                    dataPackage.relationIncrement('relatives');
                  },
                  count: patientInfo.relativesCount,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class RelationCount extends StatelessWidget {
  const RelationCount(
      {super.key,
      required this.person,
      this.leftPressed,
      this.rightPressed,
      required this.count});
  final String person;
  final void Function()? leftPressed, rightPressed;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          person,
          textAlign: TextAlign.left,
        ),
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: leftPressed,
              ),
              Text(count.toString()),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: rightPressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
