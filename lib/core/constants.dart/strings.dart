import '../errors/failures.dart';

const serverFailureMessage = "Sorry An Excepted Error in Server";
const emptyCacheFailureMessage = "There is No Data right Now";
const offlineFailureMessage = "Please Try to reconnect To the Internet";
const successAddPostMessage = "Post Was Added Scussefully !";
const successDeletePostMessage = "Post Was Deleted Scussefully !";
const successUpatePostMessage = "Post Was Updated Scussefully !";

String getMessageError(Failure failure) {
  switch (failure) {
    case ServerFailure():
      return serverFailureMessage;

    case EmptyCacheFailure():
      return emptyCacheFailureMessage;

    case OfflineFailure():
      return offlineFailureMessage;

    default:
      return "";
  }
}
