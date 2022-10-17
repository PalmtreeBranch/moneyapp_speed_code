// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../lists.dart';

class PastTransactionsPage extends StatefulWidget {
  const PastTransactionsPage({Key? key}) : super(key: key);

  @override
  State<PastTransactionsPage> createState() => _PastTransactionsPageState();
}

class _PastTransactionsPageState extends State<PastTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Past Transactions",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: (Container(child: UpcomingTransactionsList())),
    );
  }
}

class UpcomingTransactionsList extends StatefulWidget {
  const UpcomingTransactionsList();

  @override
  State<UpcomingTransactionsList> createState() =>
      _UpcomingTransactionsListState();
}

class _UpcomingTransactionsListState extends State<UpcomingTransactionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        scrollDirection: Axis.vertical,
        itemCount: pastTransactions.length,
        itemBuilder: (context, int index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.greenAccent, width: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              leading: pastTransactions[index][0],
              title: Text(
                pastTransactions[index][1],
                style: TextStyle(color: Colors.greenAccent),
              ),
              subtitle: Text(pastTransactions[index][3]),
              trailing: Text(DateFormat.MMMMEEEEd()
                  .format(pastTransactions[index][2])
                  .toString()),
            ),
          );
        });
  }
}
