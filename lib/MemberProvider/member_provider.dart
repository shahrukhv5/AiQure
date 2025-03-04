import 'package:flutter/material.dart';
import '../models/Member/member.dart';

class MemberProvider with ChangeNotifier {
  List<Member> _members = [];

  List<Member> get members => _members;

  void addMember(Member member) {
    _members.add(member);
    notifyListeners(); // Notify listeners to update the UI
  }

  void bulkAddMembers(List<Member> members) {
    _members.addAll(members);
    notifyListeners(); // Notify listeners to update the UI
  }
}