abstract class OnBoardingEvent {}

class UpdateIndexEvent extends OnBoardingEvent {
  int index;
  UpdateIndexEvent(this.index);
}

class NextButtonClickedEvent extends OnBoardingEvent {
  int index;
  NextButtonClickedEvent(this.index);
}

class PreviousButtonClickedEvent extends OnBoardingEvent {
  int index;
  PreviousButtonClickedEvent(this.index);
}

class FetchStartUpApiEvent extends OnBoardingEvent {
  bool isConnected;
  FetchStartUpApiEvent(this.isConnected);
}
