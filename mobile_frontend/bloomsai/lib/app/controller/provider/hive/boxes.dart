import 'package:bloomsai/app/common/utils/constant.dart';
import 'package:bloomsai/app/controller/provider/hive/chat_history.dart';
import 'package:bloomsai/app/controller/provider/hive/settings.dart';
import 'package:bloomsai/app/controller/provider/hive/user_model.dart';
import 'package:hive/hive.dart';

class Boxes {
//get chat history box
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(AppStrings.chatHistoryBox);

//get user box
  static Box<UserModel> getUser() => Hive.box<UserModel>(AppStrings.userBox);

//get settings box
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(AppStrings.settingsBox);
}
