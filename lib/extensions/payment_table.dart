
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/views/widgets/hover/button.dart';
import 'package:web_school/views/widgets/hover/text.dart';

class PaymentDataList extends DataTableSource {

  PaymentDataList({
    required this.context,
    required this.dataList,
  });

  final List<PaymentDescription> dataList;
  final BuildContext context;


  @override
  DataRow? getRow(int index) {

    final ThemeData theme = Theme.of(context);
    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);


    final amount = dataList[index].amount;
    final refNumber = dataList[index].refNumber;
    final status = dataList[index].status;
    final dateCreated = dataList[index].dateTime;

    final dateFormatted = DateFormat("MMMM-dd-yyyy").format(dateCreated.toDate());

    final isAccepted = status.toLowerCase() == "accept";
    final isRejected = status.toLowerCase() == "reject";
    final isPending = status.toLowerCase() == "pending";


    return DataRow(
        cells: [
          DataCell(Text("$refNumber",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              softWrap: true,
            ),
          ),
          DataCell(Text("$amount",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              softWrap: true,
            ),
          ),
          DataCell(Text("$dateFormatted",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // DataCell(
          //   Row(
          //     children: [
          //       OnHoverButton(
          //         onTap: () {},
          //         builder: (isHovered) => Text("Accept",
          //           style: theme.textTheme.bodyMedium!.copyWith(
          //             color: isHovered ? Colors.white : Colors.black87
          //           ),
          //         ),
          //       ),
          //       OnHoverButton(
          //         backgroundColor: isRejected || !isPending
          //             ? ColorTheme.primaryRed
          //             : null,
          //         onTap: () {
          //
          //         },
          //         builder: (isHovered) => Text(status.toLowerCase() == "reject"
          //             ? "Rejected"
          //             : "Reject",
          //           style: theme.textTheme.bodyMedium!.copyWith(
          //               color: isHovered ? Colors.white : Colors.black87
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ]
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
