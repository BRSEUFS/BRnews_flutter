import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ovix/models/noticeModel.dart';
import 'package:ovix/service/BaseService.dart';
import 'package:ovix/util/constants/constants.dart';

class NoticeService extends BaseService {
  Future<List<NoticeModel>> getNotices(BuildContext context, int page) async {
    String urlAt =
        '${Constants.ServerAdress}top-headlines?country=br&page=${page}&apiKey=${Constants.KeyAcess}';

    NoticeResponse data = await getAsync<NoticeResponse>(context, urlAt);

    return data.articles;
  }

  Future<List<NoticeModel>> getSeach(
      BuildContext context, int page, String seachPhase) async {
    String seachURL =
        '${Constants.ServerAdress}everything?q=${seachPhase}&apiKey=${Constants.KeyAcess}';

    NoticeResponse data = await getAsync<NoticeResponse>(context, seachURL);

    return data.articles;
  }
}
