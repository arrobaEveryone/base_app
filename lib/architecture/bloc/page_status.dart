class PageStatus{}
class LoadingStatus extends PageStatus{}
class ErrorStatus extends PageStatus{
  Exception error;
  ErrorStatus(this.error);
}
class IdleStatus extends PageStatus{}
class SuccessState extends PageStatus{}