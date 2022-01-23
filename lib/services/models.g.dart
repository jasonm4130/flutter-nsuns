// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      excercises: (json['excercises'] as List<dynamic>?)
              ?.map((e) => Excercise.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      programTemplate: json['programTemplate'] as String? ?? 'four-day',
      units: json['units'] as String? ?? 'kgs',
      smallestPlate: (json['smallestPlate'] as num?)?.toDouble() ?? 1.25,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'excercises': instance.excercises,
      'programTemplate': instance.programTemplate,
      'units': instance.units,
      'smallestPlate': instance.smallestPlate,
    };

Cycle _$CycleFromJson(Map<String, dynamic> json) => Cycle(
      programType: json['programType'] as String? ?? 'four-day',
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      complete: json['complete'] as bool? ?? false,
      startDate: DateTime.parse(json['startDate'] as String),
    );

Map<String, dynamic> _$CycleToJson(Cycle instance) => <String, dynamic>{
      'programType': instance.programType,
      'days': instance.days,
      'complete': instance.complete,
      'startDate': instance.startDate.toIso8601String(),
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      t1Movement:
          Excercise.fromJson(json['t1Movement'] as Map<String, dynamic>),
      t2Movement:
          Excercise.fromJson(json['t2Movement'] as Map<String, dynamic>),
      accessories: (json['accessories'] as List<dynamic>?)
              ?.map((e) => Accessory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      notes: json['notes'] as String? ?? '',
      complete: json['complete'] as bool? ?? false,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      't1Movement': instance.t1Movement,
      't2Movement': instance.t2Movement,
      'accessories': instance.accessories,
      'notes': instance.notes,
      'complete': instance.complete,
    };

Excercise _$ExcerciseFromJson(Map<String, dynamic> json) => Excercise(
      name: json['name'] as String,
      trainingMax: (json['trainingMax'] as num).toDouble(),
      estimated1RM: (json['estimated1RM'] as num?)?.toDouble() ?? 0,
      repsToProgess: json['repsToProgess'] as int? ?? 1,
      percentageOfMainLift: json['percentageOfMainLift'] as int? ?? 0,
      isMainLift: json['isMainLift'] as bool? ?? true,
      isAccessory: json['isAccessory'] as bool? ?? false,
      mainLift: json['mainLift'] == null
          ? null
          : Excercise.fromJson(json['mainLift'] as Map<String, dynamic>),
      progression: (json['progression'] as num?)?.toDouble() ?? 1.25,
      dataPoints: (json['dataPoints'] as List<dynamic>?)
              ?.map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      t1RepScheme: json['t1RepScheme'] == null
          ? null
          : RepScheme.fromJson(json['t1RepScheme'] as Map<String, dynamic>),
      t2RepScheme: json['t2RepScheme'] == null
          ? null
          : RepScheme.fromJson(json['t2RepScheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExcerciseToJson(Excercise instance) => <String, dynamic>{
      'name': instance.name,
      'trainingMax': instance.trainingMax,
      'estimated1RM': instance.estimated1RM,
      'repsToProgess': instance.repsToProgess,
      'percentageOfMainLift': instance.percentageOfMainLift,
      'isMainLift': instance.isMainLift,
      'isAccessory': instance.isAccessory,
      'mainLift': instance.mainLift,
      'progression': instance.progression,
      'dataPoints': instance.dataPoints,
      't1RepScheme': instance.t1RepScheme,
      't2RepScheme': instance.t2RepScheme,
    };

DataPoint _$DataPointFromJson(Map<String, dynamic> json) => DataPoint(
      date: DateTime.parse(json['date'] as String),
      excercise: Excercise.fromJson(json['excercise'] as Map<String, dynamic>),
      estimated1RM: (json['estimated1RM'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$DataPointToJson(DataPoint instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'excercise': instance.excercise,
      'estimated1RM': instance.estimated1RM,
    };

RepScheme _$RepSchemeFromJson(Map<String, dynamic> json) => RepScheme(
      sets: (json['sets'] as List<dynamic>)
          .map((e) => Set.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RepSchemeToJson(RepScheme instance) => <String, dynamic>{
      'sets': instance.sets,
    };

Accessory _$AccessoryFromJson(Map<String, dynamic> json) => Accessory(
      excercise: Excercise.fromJson(json['excercise'] as Map<String, dynamic>),
      repScheme: RepScheme.fromJson(json['repScheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessoryToJson(Accessory instance) => <String, dynamic>{
      'excercise': instance.excercise,
      'repScheme': instance.repScheme,
    };

Set _$SetFromJson(Map<String, dynamic> json) => Set(
      reps: json['reps'] as int,
      percentageOfTrainingMax: json['percentageOfTrainingMax'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      isAMRAP: json['isAMRAP'] as bool? ?? false,
      repsCompleted: json['repsCompleted'] as int? ?? 0,
    );

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'reps': instance.reps,
      'percentageOfTrainingMax': instance.percentageOfTrainingMax,
      'weight': instance.weight,
      'isAMRAP': instance.isAMRAP,
      'repsCompleted': instance.repsCompleted,
    };
