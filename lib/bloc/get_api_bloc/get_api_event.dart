import 'package:equatable/equatable.dart';


abstract class GetApiEvent extends Equatable {

  const GetApiEvent();
  @override
  List<Object?> get props => [];

}


class GetApiList extends GetApiEvent{}

class SearchList extends GetApiEvent{
  final String stText;
  const SearchList(this.stText);
}