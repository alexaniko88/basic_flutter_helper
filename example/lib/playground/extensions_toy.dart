import 'dart:math';

import 'package:basic_flutter_helper/basic_flutter_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExtensionsToy extends StatefulWidget {
  const ExtensionsToy({super.key});

  @override
  State<ExtensionsToy> createState() => _ExtensionsToyState();
}

class _ExtensionsToyState extends State<ExtensionsToy> {
  late final TextEditingController _stringExtensionsEditingController;
  late final TextEditingController _durationExtensionsEditingController;
  late DateTime _pickedDate;
  final List<String?> _listOfString = ['A', null, 'B', null, 'C'];
  final List<String?> _listOfSafeString = ['A', null, 'B', null, 'C'];

  @override
  void initState() {
    _stringExtensionsEditingController = TextEditingController();
    _durationExtensionsEditingController = TextEditingController();
    _stringExtensionsEditingController.addListener(() => setState(() {}));
    _durationExtensionsEditingController.addListener(() {
      if (_durationExtensionsEditingController.text.isNotEmpty) {
        setState(() {});
      }
    });
    _pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extensions'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'String extensions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _stringExtensionsEditingController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              labelText: 'Provide a string where to apply extensions',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text('orEmpty: '),
                              Text(_stringExtensionsEditingController.text.orEmpty),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isNullOrEmpty: '),
                              Text(_stringExtensionsEditingController.text.isNullOrEmpty.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isNotNullAndNotEmpty: '),
                              Text(_stringExtensionsEditingController.text.isNotNullAndNotEmpty.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('asCapitalized: '),
                              Text(_stringExtensionsEditingController.text.asCapitalized),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('asCapitalizeByWord: '),
                              Text(_stringExtensionsEditingController.text.asCapitalizeByWord),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Date time extensions

                  const Text(
                    'Date time extensions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.calendar_month, size: 32),
                                onPressed: () async {
                                  final now = DateTime.now();
                                  final dateFromPicker = await showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: DateTime(2022, 1, 1),
                                    lastDate: DateTime(now.year + 5, now.month, now.day),
                                  );
                                  if (dateFromPicker != null) {
                                    setState(() => _pickedDate = dateFromPicker);
                                  }
                                },
                              ),
                              Text("Selected date: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(_pickedDate)}")
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text('isToday: '),
                              Text(_pickedDate.isToday.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isTomorrow: '),
                              Text(_pickedDate.isTomorrow.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isYesterday: '),
                              Text(_pickedDate.isYesterday.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isDaysAfter (today): '),
                              Text(_pickedDate.isDaysAfter(DateTime.now()).toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isDaysBefore (today): '),
                              Text(_pickedDate.isDaysBefore(DateTime.now()).toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isSameDay (today): '),
                              Text(_pickedDate.isSameDay(DateTime.now()).toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isSameDayOrDaysAfter (today): '),
                              Text(_pickedDate.isSameDayOrDaysAfter(DateTime.now()).toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isSameDayOrDaysBefore (today): '),
                              Text(_pickedDate.isSameDayOrDaysBefore(DateTime.now()).toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('toBeginningOfTheDay: '),
                              Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(_pickedDate.toBeginningOfTheDay)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('toBeginningOfTheMonth: '),
                              Text(DateFormat("yyyy-MM-dd HH:mm:ss").format(_pickedDate.toBeginningOfTheMonth)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('daysInMonth: '),
                              Text(_pickedDate.daysInMonth.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Duration extensions

                  const SizedBox(height: 16),
                  const Text(
                    'Duration extensions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _durationExtensionsEditingController,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Provide a duration IN SECONDS where to apply extensions',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text('asMinutesAndSeconds: '),
                              Text(_durationExtensionsEditingController.text.isNotEmpty
                                  ? Duration(seconds: int.parse(_durationExtensionsEditingController.text))
                                      .asMinutesAndSeconds
                                  : ''),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Platform extensions

                  const SizedBox(height: 16),
                  const Text(
                    'Platform extensions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Current platform is: '),
                          Text(PlatformExt.getPlatform(context).toString()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// List extensions

                  const SizedBox(height: 16),
                  const Text(
                    'List extensions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('List of strings: '),
                              Text(_listOfString.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('isNullOrEmpty: '),
                              Text(_listOfString.isNullOrEmpty.toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Text('safeList: '),
                              Text(_listOfSafeString.safeList().toString()),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    final char = getRandomChar();
                                    _listOfString.add(char);
                                    _listOfSafeString.addSafely(char);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                child: const Text('Add safely'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_listOfString.isNotEmpty) {
                                      _listOfString.removeAt(_listOfString.length - 1);
                                    }
                                    if (_listOfSafeString.isNotEmpty) {
                                      _listOfSafeString.removeAt(_listOfSafeString.length - 1);
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                                child: const Text('Remove last'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? getRandomChar() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    return random.nextBool() ? chars[random.nextInt(chars.length)] : null;
  }
}
