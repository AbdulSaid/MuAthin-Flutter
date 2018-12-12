import 'auth.dart';
import 'crud.dart';
import 'messaging.dart';
import 'storage.dart';

class Services {
  var auth = Auth();
  var crud = CRUD();
  var messaging = Messaging();
  var storage = Storage();
}