import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/colors.dart';
import 'package:flutter_application_1/common/text_styles.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _noteController = TextEditingController();

  String place = '';
  String date = '';
  String time = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Consultation Booking',
            style: semiBold,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hal yang ingin kamu bagikan?',
                  style: bold.copyWith(
                    fontSize: 18,
                  ),
                ),
                TextField(
                  controller: _noteController,
                  style: regular,
                  decoration: const InputDecoration(
                    hintText: 'Singkat saja, tetap tenang ya',
                  ),
                ),
                const Gap(
                  16,
                ),
                Text(
                  'Tempat Konsultasi:',
                  style: bold.copyWith(
                    fontSize: 18,
                  ),
                ),
                DropdownMenu(
                  textStyle: regular,
                  expandedInsets: EdgeInsets.zero,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  hintText: 'Pilih tempat konsultasi',
                  onSelected: (String? value) {
                    setState(() {
                      place = value!;
                      print(value);
                    });
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 'online',
                      label: 'Chat',
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(regular),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: 'offline',
                      label: 'Kampus',
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(regular),
                      ),
                    ),
                  ],
                ),
                // TextField(
                //   controller: _placeController,
                //   style: regular,
                //   decoration: const InputDecoration(
                //     hintText: 'Silakan masukkan tempat konsultasi',
                //   ),
                // ),
                const SizedBox(height: 16),
                Text(
                  'Tanggal:',
                  style: bold.copyWith(
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date == '' ? 'Pilih Tanggal' : date,
                      style: regular,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: white,
                      ),
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );

                        if (selectedDate != null) {
                          final formattedDate =
                              DateFormat('EEEE, dd-MM-yyyy', 'id_ID')
                                  .format(selectedDate);
                          setState(() {
                            date = formattedDate;
                          });
                        }
                      },
                      child: Text(
                        'Pilih Tanggal',
                        style: bold,
                      ),
                    ),
                  ],
                ),
                const Gap(
                  16,
                ),
                Text(
                  'Waktu',
                  style: bold.copyWith(
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time == '' ? 'Pilih Waktu' : time,
                      style: regular,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: white,
                      ),
                      onPressed: () async {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (selectedTime != null) {
                          final formattedTime = DateFormat.Hm().format(DateTime(
                            2020, 1,
                            1, // You can set any date since we are only interested in time
                            selectedTime.hour, selectedTime.minute,
                          ));

                          setState(() {
                            time = formattedTime;
                          });
                        }
                      },
                      child: const Text(
                        'Pilih Waktu',
                      ),
                    ),
                  ],
                ),
                const Gap(
                  16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _placeOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: white,
                      padding: const EdgeInsets.all(10.0),
                    ),
                    child: Text(
                      'Pesan',
                      style: bold.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _placeOrder() {
    if (_noteController.text.isNotEmpty &&
        place == 'online' &&
        date != '' &&
        time != '') {
      Navigator.pushNamed(context, '/doctor-list');
    } else if (_noteController.text.isNotEmpty &&
        place == 'offline' &&
        date != '' &&
        time != '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Pemesanan Berhasil'),
          content: Text('Kami disini ada untukmu'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Peringatan'),
          content: Text('Cek kembali data isian Anda'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    // final note = _noteController.text;
    // final place = _placeController.text;

    // if (note.isNotEmpty && place.isNotEmpty) {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Pemesanan Berhasil'),
    //       content: Text('Kami disini ada untukmu'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // } else {
    //   showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //       title: Text('Gagal Memesan'),
    //       content: Text('tarik nafas dalam-dalam dan coba lagi'),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('OK'),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }
}
