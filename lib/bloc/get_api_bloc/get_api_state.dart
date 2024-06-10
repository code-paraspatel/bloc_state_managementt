import 'package:equatable/equatable.dart';
import '../../modal/get_api_modal.dart';

enum GetApiStatus{loading,success,error}

class GetApiState extends  Equatable{

  final List<GetApiModal> getApiModalList;
  final GetApiStatus getApiStatus;
  final List<GetApiModal> tempApiList;
  final String massage;
  final String stMessage;

  const GetApiState({
    this.getApiModalList = const <GetApiModal>[],
    this.getApiStatus = GetApiStatus.loading,
    this.tempApiList = const <GetApiModal>[],
    this.massage = '',
    this.stMessage = ''
});

  GetApiState copyWith ({
    List<GetApiModal>? getApiModalList,
    GetApiStatus? getApiStatus,
    List<GetApiModal>? tempApiList,
    String? massage,
    String? stMessage
  }){
    return GetApiState(
      getApiModalList: getApiModalList ?? this.getApiModalList,
      getApiStatus:  getApiStatus ?? this.getApiStatus,
        tempApiList: tempApiList ?? this.tempApiList,
        massage: massage ?? this.massage,
        stMessage:  stMessage ?? this.stMessage
    );
}
  @override
  List<Object?> get props => [getApiModalList,getApiStatus,tempApiList,massage,stMessage];

}