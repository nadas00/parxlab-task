import 'package:flutter/material.dart';
import 'package:parxlab_application/models/User.dart';

class RecordsTable extends StatelessWidget {
  const RecordsTable({
    Key key,
    @required this.recordsList,
  }) : super(key: key);

  final List<User> recordsList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 0,
      headingRowHeight: 60,
      columns: [
        DataColumn(
            label: Text(
          'Plaka',
          style: TextStyle(color: Colors.grey),
        )),
        DataColumn(
          label: Text(
            'Görevli',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        DataColumn(
            label: Text(
          'Lokasyon',
          style: TextStyle(color: Colors.grey),
        )),
      ],
      rows: List.generate(recordsList.length ?? 0, (index) {
        return DataRow(cells: [
          DataCell(Text(
            recordsList[index].licensePlate,
            maxLines: 1,
          )),
          DataCell(Text(
            recordsList[index].userName,
            maxLines: 1,
          )),
          DataCell(Text(
              "${recordsList[index].latitude},${recordsList[index].longitude}")),
        ]);
      }),
    );
  }
}
