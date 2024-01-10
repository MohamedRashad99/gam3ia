import 'dart:convert';

import 'package:equatable/equatable.dart';

class JamayaModel extends Equatable {
  final int? id;
  final String name;
  final String price;
  final List<ReceiveMoneyDateModel> receiveMoneyDates;
  final String number;
  final List<Dates> dates;

  const JamayaModel({
    this.id,
    required this.name,
    required this.price,
    required this.number,
    required this.receiveMoneyDates,
    required this.dates,
  });

  JamayaModel copyWith({
    int? id,
    String? name,
    String? price,
    String? number,
    List<Dates>? dates,
    List<ReceiveMoneyDateModel>? receiveMoneyDates,
  }) {
    return JamayaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      number: number ?? this.number,
      dates: dates ?? this.dates,
      receiveMoneyDates: receiveMoneyDates ?? this.receiveMoneyDates,
    );
  }

  static const databaseName = 'jamaya';

  factory JamayaModel.fromSql(Map<String, dynamic> sql) {
    return JamayaModel(
      id: sql['id'],
      name: sql['name'],
      price: sql['price'],
      number: sql['number'],
      dates: (jsonDecode(sql['dates']) as List)
          .map((e) => Dates.fromSql(e))
          .toList(),
      receiveMoneyDates: (jsonDecode(sql['receiveMoneyDates']) as List)
          .map((e) => ReceiveMoneyDateModel.fromSql(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'number': number,
      'dates': jsonEncode(dates.map((e) => e.toMap()).toList()),
      'receiveMoneyDates':
          jsonEncode(receiveMoneyDates.map((e) => e.toMap()).toList()),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        number,
        // dates,
      ];

  static const createStatement = """  CREATE TABLE "jamaya" (
                      "id"	INTEGER,
                      "name"	VARCHAR,
                      "price"	VARCHAR,
                      "number"	VARCHAR,
                      "receiveMoneyDates"	VARCHAR,
                      "dates"	VARCHAR,
                      "startDate"	VARCHAR,
                      PRIMARY KEY("id" AUTOINCREMENT)
                      );""";
}

class Dates extends Equatable {
  final int id;
  final bool payed;
  final DateTime startDate;

  const Dates({
    required this.id,
    this.payed = false,
    required this.startDate,
  });

  Dates copyWith({
    int? id,
    bool? payed,
    DateTime? startDate,
  }) {
    return Dates(
      id: id ?? this.id,
      payed: payed ?? this.payed,
      startDate: startDate ?? this.startDate,
    );
  }

  static const databaseName = 'dates';

  factory Dates.fromSql(Map<String, dynamic> sql) {
    return Dates(
      id: sql['id'],
      payed: (sql['payed'] as int) == 1,
      startDate: DateTime.parse(sql['startDate'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'payed': payed ? 1 : 0,
      'startDate': startDate.toString(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        payed,
        startDate,
      ];

// static const createStatement = """  CREATE TABLE "jamaya" (
//                     "id"	INTEGER,
//                     "payed"	tinyint(1) NOT NULL,
//                     "startDate"	VARCHAR,
//                     PRIMARY KEY("id" AUTOINCREMENT)
//                     );""";
}

class ReceiveMoneyDateModel extends Equatable {
  final bool full;
  final int id;
  final int date;

  const ReceiveMoneyDateModel({
    this.full = true,
    required this.date,
    required this.id,
  });

  ReceiveMoneyDateModel copyWith({
    int? id,
    bool? full,
    int? date,
  }) {
    return ReceiveMoneyDateModel(
      id: id ?? this.id,
      full: full ?? this.full,
      date: date ?? this.date,
    );
  }

  factory ReceiveMoneyDateModel.fromSql(Map<String, dynamic> sql) {
    return ReceiveMoneyDateModel(
      full: (sql['full'] as int) == 1,
      id: sql['id'],
      date: sql['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full': full ? 1 : 0,
      'date': date,
    };
  }

  @override
  List<Object?> get props => [
        id,
      ];

// static const createStatement = """  CREATE TABLE "jamaya" (
//                     "id"	INTEGER,
//                     "payed"	tinyint(1) NOT NULL,
//                     "startDate"	VARCHAR,
//                     PRIMARY KEY("id" AUTOINCREMENT)
//                     );""";
}
