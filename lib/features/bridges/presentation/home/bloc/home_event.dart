abstract class HomeEvent {
  final int groupSize;
  const HomeEvent({this.groupSize = 20});
}

class GetBridgeHomeEvent extends HomeEvent {
  const GetBridgeHomeEvent();
}

class ChangeBridgeGroupSizeEvent extends HomeEvent {
  const ChangeBridgeGroupSizeEvent(int groupSize) : super(groupSize: groupSize);
}