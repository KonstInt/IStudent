part of 'timetable_page_bloc.dart';

@immutable
abstract class TimetablePageEvent {}

class TimetablePageLoadEvent extends TimetablePageEvent{

}

class TimetablePageUserInfoLoaded extends TimetablePageState {}
class TimetablePageUserInfoErr extends TimetablePageState {}