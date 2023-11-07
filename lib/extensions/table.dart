import 'package:flutter/material.dart';

class MyData<T> extends DataTableSource {

  MyData({
    required this.dataList,
  });

  final List<T> dataList;


  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: dataList.map((T data) {
        return DataCell(Text(data.toString()));
      }).toList(),
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => dataList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
