import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String title,
    required bool isDone,
  }) = _Task;
}

// class Task extends Equatable {
//   final String title;
//   final bool isDone;

//   Task({
//     required this.title,
//     this.isDone,
//   }) {
//     isDone = isDone ?? false;
//   }

//   Task copyWith({
//     String? title,
//     bool? isDone,
//   }) {
//     return Task(
//       title: title ?? this.title,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         title,
//         isDone,
//       ];
// }
