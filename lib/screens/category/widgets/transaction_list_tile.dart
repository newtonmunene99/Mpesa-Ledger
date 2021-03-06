import 'package:flutter/material.dart';

class TransactionListTile extends StatefulWidget {
  final Map<String, dynamic> transaction;

  TransactionListTile(this.transaction);

  @override
  _TransactionListTileState createState() => _TransactionListTileState();
}

class _TransactionListTileState extends State<TransactionListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/transaction",
            arguments: widget.transaction);
      },
      highlightColor: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                color: Colors.black45,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      widget.transaction["title"],
                      style: Theme.of(context).textTheme.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.transaction["isDeposit"]
                        ? "+KES " + widget.transaction["amount"].toString()
                        : "-KES " + widget.transaction["amount"].toString(),
                    style: Theme.of(context).textTheme.title.merge(
                          TextStyle(
                            fontSize: 16.5,
                            color: widget.transaction["isDeposit"]
                                ? Color(0XFF4CAF50)
                                : Color(0XFFF44336),
                          ),
                        ),
                  )
                ],
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
          subtitle: widget.transaction["transactionId"] != null
              ? Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.transaction["transactionId"],
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.transaction["jiffy"].yMMMEdjm,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
