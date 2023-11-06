import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_items_api/controller/datacontroller.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 210, 87),
      appBar: AppBar(
        title: const Text("Api integration"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Obx(() {
          return controller.isloading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.DataList.length,
                  itemBuilder: (context, index) {
                    final data = controller.DataList[index];
                    return Card(
                        color: Colors.amber,
                        margin: const EdgeInsets.all(18.0),
                        child: ListTile(
                            leading: Image.network(data.image ?? ""),
                            title: Text(data.title ?? ""),
                            subtitle: Column(
                              children: <Widget>[
                                Text("ID:${data.id ?? ""}"),
                                Text("Category: ${data.category ?? ""}"),
                                Text("Price: \$${data.price ?? ""}"),
                                Text("Rating: ${data.rating!.rate}"),
                                Text("Count: ${data.rating!.count} available"),
                                Text(
                                    "Description: \$${data.description ?? ""}"),
                              ],
                            )));
                  });
        }),
      ),
    );
  }
}
