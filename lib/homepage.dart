import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController namecontroller = TextEditingController();
  List namelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Note App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return AlertDialog(
                                  content: TextField(
                                    autofocus: true,
                                    showCursor: true,
                                    // enabled: true,
                                    // maxLines: 1,
                                    textInputAction: TextInputAction.next,
                                    controller: namecontroller,
                                    decoration: InputDecoration(hintText: "Enter name"),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              if(namecontroller.text.isNotEmpty){
                                                setState(() {
                                                  namelist.add(namecontroller.text);
                                                  namecontroller.clear();
                                                  Navigator.pop(context);
                                                });

                                              }else{
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                          content: Text(" Fill in the blank")
                                                      );
                                                    });
                                              }
                                            },
                                            child: Text("Save")),
                                        ElevatedButton(
                                            onPressed: () {
                                              namecontroller.clear();
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel")),

                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: namelist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                child: ListTile(

                  leading: Text("${index + 1}"),
                  title: Text(
                    namelist[index],
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              namecontroller.text = namelist[index];

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: TextField(
                                        autofocus: true,
                                        showCursor: true,
                                        textInputAction: TextInputAction.next,
                                        controller: namecontroller,
                                        decoration:
                                            InputDecoration(hintText: "Edit "),
                                      ),
                                      actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  namelist[index] =
                                                      namecontroller.text;
                                                  namecontroller.clear();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Text("Update")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel")),


                                        ],
                                      )
                                      ],
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.edit,
                            )),
                        SizedBox(
                          width: 50,
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                namelist.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
