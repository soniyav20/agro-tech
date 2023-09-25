import 'package:agri/services/service_imp.dart';
import 'package:agri/services/services.dart';
import 'package:agri/views/drawer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/orders.dart';
import '../view_models/changes.dart';

bool loading = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> method() async {
    await context.read<MyModel>().gethistory();
    setState(() {});
  }

  Future<void> _refresh() async {
    await context.read<MyModel>().gethistory();
    setState(() {});
    return null;
  }

  @override
  void initState() {
    super.initState();
    method();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Services obj = ServiceImp();
    BuiltList<Orders>? list = context.read<MyModel>().state.orders;
    return RefreshIndicator(
        color: Colors.white,
        onRefresh: () {
          _refresh();
          return Future(() => null);
        },
        child: Scaffold(
          drawer: DrawerHome(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            backgroundColor: Color(0xff5a5a5a),
            title: Text("Available Orders"),
          ),
          body: Container(
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: (list == null || list.isEmpty)
                  ? Center(
                      child: Text(
                      "Nothing Yet",
                      style: TextStyle(color: Colors.white),
                    ))
                  : Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff3d3c3c),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Order Id: ${list[index].id}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Status : ${list[index].status}"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Paid : ${list[index].paid == true ? "YES" : "NO"}"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Product ID: ${list[index].product!.id}"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Product Name: ${list[index].product!.name}"),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Consumer : ${list[index].consumer!.consumer_name} "),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Phone : ${list[index].consumer!.phone_number} "),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  "Address : ${list[index].consumer!.address} "),
                                            ),
                                          ],
                                        ),
                                        loading == false
                                            ? Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        await obj.approve(
                                                            code: list[index]!
                                                                    .id ??
                                                                0);
                                                        await context
                                                            .read<MyModel>()
                                                            .gethistory();
                                                        setState(() {
                                                          loading = false;
                                                        });
                                                        const snackBar =
                                                            SnackBar(
                                                          content:
                                                              Text('Accepted'),
                                                        );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                Colors.green),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : CircularProgressIndicator(
                                                color: Colors.white)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
        ));
  }
}
