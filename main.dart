import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

class ActivityModel {
  String nama;
  String jenis;
  ActivityModel({required this.nama, required this.jenis}); //constructor
}

class ActivityCubit extends Cubit<ActivityModel> {
  String url = "http://178.128.17.76:8000/daftar_umkm";
  ActivityCubit() : super(ActivityModel(nama: "", jenis: ""));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    var data = json['data'];
    for (var val in data) {
      var nama = val["nama"]; //thn dijadikan int
      var jenis = val["jenis"]; //populasi sudah int
      //tambahkan ke array
    }
    // emit(ActivityModel.fromJson(nama: nama, jenis: jenis));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (_) => ActivityCubit(),
//         child: const HalamanUtama(),
//       ),
//     );
//   }
// }

// class HalamanUtama extends StatefulWidget {
//   const HalamanUtama({Key? key}) : super(key: key);

//   @override
//   State<HalamanUtama> createState() => _HalamanUtamaState();
// }

// class _HalamanUtamaState extends State<HalamanUtama> {
//   final textController = TextEditingController();
//   List<String> data = []; //data untuk listview
//   String _nama = "";
//   @override
//   Widget build(Object context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               '\n2107377, Alif Faturahman Firdaus, 2108724, Ravindra Maulana Sahman; Saya berjanji tidak akan berbuat curang data\natau membantu orang lain berbuat curang',
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _nama = textController.text;
//               });
//             },
//             child: const Text('Reload Daftar UMKM'),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 500,
//             child: ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 // return Container(
//                 //   decoration: BoxDecoration(border: Border.all()),
//                 //   padding: const EdgeInsets.all(14),
//                 //   child: Text(data[index]),
//                 // );
//                 return ListTile(
//                   leading:
//                       Image.network("https://unsplash.com/photos/AsnLBqPTy1s"),
//                   title: Text(data[index]),
//                   subtitle: Text('bawah'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),

//       // body: Center(
//       //   child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       //     BlocBuilder<ActivityCubit, ActivityModel>(
//       //       buildWhen: (previousState, state) {
//       //         developer.log("${previousState.nama} -> ${state.nama}",
//       //             name: 'logyudi');
//       //         return true;
//       //       },
//       //       builder: (context, nama) {
//       //         return Center(
//       //             child: Column(
//       //                 mainAxisAlignment: MainAxisAlignment.center,
//       //                 children: [
//       //               Padding(
//       //                 padding: const EdgeInsets.only(bottom: 20),
//       //                 child: ElevatedButton(
//       //                   onPressed: () {
//       //                     context.read<ActivityCubit>().fetchData();
//       //                   },
//       //                   child: const Text("Saya bosan ..."),
//       //                 ),
//       //               ),
//       //               Text(nama.nama),
//       //               Text("Jenis: ${nama.jenis}")
//       //             ]));
//       //       },
//       //     ),
//       //   ]),
//       // ),
//     ));
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final textController = TextEditingController();
  List<String> data = []; //data untuk listview
  String _nama = "";

  @override
  void initState() {
    super.initState();
    // isi data listview
    for (int i = 0; i < 5; i++) {
      data.add("Data ke $i ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '\n2107377, Alif Faturahman Firdaus, 2108724, Ravindra Maulana Sahman; Saya berjanji tidak akan berbuat curang data\natau membantu orang lain berbuat curang',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nama = textController.text;
                });
              },
              child: const Text('Reload Daftar UMKM'),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // return Container(
                  //   decoration: BoxDecoration(border: Border.all()),
                  //   padding: const EdgeInsets.all(14),
                  //   child: Text(data[index]),
                  // );
                  return ListTile(
                    leading: Image.network(
                        "data:image/jpeg;base64,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"),
                    title: Text(data[index]),
                    subtitle: Text('bawah'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
