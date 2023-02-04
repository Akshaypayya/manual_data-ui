import 'package:flutter/material.dart';

class UiScreen extends StatefulWidget {
  // int? id;
  // int? year;
  // int? date;
  // String? month;
  // String? name;
  // String? number;
  // UiScreen({Key? key,this.id,this.number,this.name,this.month,this.year,this.date}) : super(key: key);

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {


  List todoData = [
    {
      'id': 100,
      'year': 2023,
      'day': 02,
      'month': 'FEB',
      'name': 'Ahmed k',
      'number': '9652385468'
    },
    {
      'id': 101,
      'year': 2022,
      'day': 05,
      'month': 'DEC',
      'name': 'AbhiramKLW',
      'number': '+919633652154'
    },
    {
      'id': 102,
      'year': 2023,
      'day': 28,
      'month': 'JAN',
      'name': 'location ios user',
      'number': '1112223335'
    },
    {
      'id': 103,
      'year': 2023,
      'day': 24,
      'month': 'JAN',
      'name': 'iOS test client',
      'number': '9895104752'
    },
    {
      'id': 104,
      'year': 2023,
      'day': 26,
      'month': 'JAN',
      'name': 'Abhiram Das Kottayam',
      'number': '9633652154'
    },
    {
      'id': 105,
      'year': 2023,
      'day': 26,
      'month': 'JAN',
      'name': 'ios user2',
      'number': '9744235696'
    },
    {
      'id': 106,
      'year': 2022,
      'day': 03,
      'month': 'SEP',
      'name': 'Sneha',
      'number': '8943540470'
    },
    {
      'id': 107,
      'year': 2022,
      'day': 26,
      'month': 'OCT',
      'name': 'rhbtg',
      'number': '75754'
    },
  ];
  bool dataValue = false;
  bool itembox = false;
  bool isLoaded = false;
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Manual data"), actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.filter_alt_sharp, color: Colors.white, size: 30,)
            ),
          ),
          //SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(
                left: 0.0, top: 0, right: 15.0, bottom: 0),
            child: InkWell(
                onTap: () {},
                child: Icon(Icons.save, color: Colors.white, size: 30,)
            ),
          ),
        ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Type Target ...",
                              hintStyle: TextStyle(
                                  fontSize: 18
                              )
                          ),
                          //textAlign: TextAlign. center,
                        ),
                      ),

                      Transform.scale(
                        scale: 1.5,
                        child: Checkbox(value: itembox,
                            onChanged: (newValue){
                              setState(() {
                                itembox=newValue!;
                              });
                            }),
                      ),
                    ]
                ),
              ),

              //myData(context),

              isLoaded ? Center(
                child: CircularProgressIndicator(),
              ) : ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: todoData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(todoData[index]['year'].toString(),
                          style: TextStyle(color: Colors.yellow.shade700,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),),
                        Text(todoData[index]['day'].toString(),
                          style: TextStyle(fontSize: 20, color: Colors.blue
                              .shade700, fontWeight: FontWeight.bold),),
                        Text(todoData[index]['month'],
                            style: TextStyle(fontSize: 10, color: Colors.red
                                .shade900, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoData[index]['name'],
                            style: TextStyle(fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(todoData[index]['number'],
                            style: TextStyle(fontSize: 10, color: Colors.red
                                .shade300, fontWeight: FontWeight.bold))
                      ],
                    ),

                   // trailing: Transform.scale(
                   //    scale: 1.5,
                   //    child:
                    trailing:   Expanded(
                      child: CheckboxListTile(
                          title: Text("Check Box$index"),
                          value: selectedItem.contains(index) ? true : false,
                          onChanged: (newValue) {
                            if (selectedItem.contains(index)) {
                              selectedItem.remove(index);
                            } else {
                              selectedItem.add(index);
                            }
                            setState(() {});
                          },
                          controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                    ),
                  // ),
                      // child: Checkbox(value: dataValue,
                      //     onChanged: (newValue){
                      //       setState(() {
                      //         dataValue=newValue!;
                      //       });
                      //     }),

                  );},
                separatorBuilder: (context, index) {
                  return Divider(
                      thickness: 1, height: 15, indent: 5, endIndent: 5);
                },
              ),

            ],
          ),
        )
    );
  }
}

//
// myData(BuildContext context) {
//   List todoData = [
//     {
//       'id' : 100,
//       'year' : 2023,
//       'date' : 02,
//       'month' : 'FEB',
//       'name' : 'Ahmed k',
//       'number' : '9652385468'
//     },
//     {
//       'id' : 101,
//       'year' : 2022,
//       'date' : 05,
//       'month' : 'DEC',
//       'name' : 'AbhiramKLW',
//       'number' : '+919633652154'
//     },
//     {
//       'id' : 102,
//       'year' : 2023,
//       'date' : 28,
//       'month' : 'JAN',
//       'name' : 'location ios user',
//       'number' : '1112223335'
//     },
//     {
//       'id' : 103,
//       'year' : 2023,
//       'date' : 24,
//       'month' : 'JAN',
//       'name' : 'iOS test client',
//       'number' : '9895104752'
//     },
//     {
//       'id' : 104,
//       'year' : 2023,
//       'date' : 26,
//       'month' : 'JAN',
//       'name' : 'Abhiram Das Kottayam',
//       'number' : '9633652154'
//     },
//     {
//       'id' : 105,
//       'year' : 2023,
//       'date' : 26,
//       'month' : 'JAN',
//       'name' : 'ios user2',
//       'number' : '9744235696'
//     },
//     {
//       'id' : 106,
//       'year' : 2022,
//       'date' : 03,
//       'month' : 'SEP',
//       'name' : 'Sneha',
//       'number' : '8943540470'
//     },
//     {
//       'id' : 107,
//       'year' : 2022,
//       'date' : 26,
//       'month' : 'OCT',
//       'name' : 'rhbtg',
//       'number' : '75754'
//     },
//   ];
//   return Column(
//     children: List.generate(todoData.length, (index) {
//       bool isLoaded = false;
//       bool dataValue = false;
//       return SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//         Text(todoData[index]['date'].toString()),
//         Text(todoData[index]['day'].toString()),
//         Text(todoData[index]['year'].toString()),
//         Text(todoData[index]['month'].toString()),
//         Text(todoData[index]['name'].toString()),
//         Text(todoData[index]['number'].toString()),
//           ],
//         ),
//       );
//     }),
//   );
// }

