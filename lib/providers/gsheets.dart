import 'package:flutter_app/models/CategoryModel.dart';
import 'package:gsheets/gsheets.dart';

class _FHomeFinanceSheet {
  static const _credential = r'''{
  "type": "service_account",
  "project_id": "fhome-finance",
  "private_key_id": "e8d1cddc8a1a0ee6b20bb665a4c237c55e1accd5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDSXG3LQb5mkrAo\n5ReC5RhN6XIR1gGDKbYmDDjYU6W5zn27GKSanOBmn0U4wGWcDDrbr80PRhG5qJbL\nB24jVnFHEYGeihUv4qS7NUpbCtz02V2t71trUCMq5jbnqjt078M+G5G6cIeEP5UA\nWH7OnNzklBjAPstz5ly3sVpoK0Yuzfg+l50cECgnrYqdYqzB6l5N6BqkhxJGTdLY\np1Lq8tU/9txFca5KqZuKwAi2G2HrrQ0NzrEmR+1JDx84fLe5uHy8kEswJVxVmZy6\n/toiaVoB0pFwR5/BcK+1OTzI/7Qm8aa1ZCUtH+EoMy/5ta0Q/jORkhysiH7EUIna\ndhEJkCLNAgMBAAECggEAV2mjEiAqn3L7ErNH1tOeCtoj1XeJP1i44QyZHoN7zT8a\nDgIKfFkOAnbSi+efEX4fgySFYIBsYyrEJm/a+4IzJiYHJ7sXXMOgUk6trDFSachd\nXialZW1yf6QUUqXxeQEcr5VDNCcImRLWtsMPRon2XGGR+2jcoDesdYSUHc9FpbKe\nQOK0OS7tpnbmdgrCp25+xml+Bs7jxCjotKT2FFClH5/j7jRd6b8Q730J2No+ftxL\n1G3h7JK694Gvg6VZTGLADz0Ld/2ELa4lSyFAjF0xX2k5ni2S4Ppidwcan5TZL9lc\n7AsfXTEh2D+D9I5HQOdjKWFWn6h9wcgB6BPhauEGfQKBgQDrQrmYbHW8z0oU/3Xb\n2O332Jqwl2//bf5gzaAkobhd+TyZBv3SlElqGrZV0QTN0Sm+votwNrsF4XfoXLuO\nBbdP7DbhOMmhrOwnuj5dZBH/e+QhSL36wNmdPqvNnXSsX6rawIEm7sb1wlTAdH39\ncd4sTsrnSDShQaae2Qs7xO6tFwKBgQDk58dyb6uAV4v09tASlq8z2PjOkPzEGQG0\nrVGploVOthC40qCtlXJNG2qE9NLTrV4G6DWSo67wA14IHeDCDqlEom1y59kNmxdL\nws7MMu+yxKBNUoOqViZUVkHDv4J81aT/9weQ7H5l/myHkNpcbTs7fc7Gm9OErKhJ\nBvJc4UPFuwKBgHMeinzojdBfSqvtuXljtEZ0SnWhFN/Trgcmd3eVXwc0/48OGcQi\nZa4y9ggWKJiiAiBhUxAM6AVfp/Ie9nPvnhzQxKX+yMOBP2nNO9ktL5VpxV74HmaG\nWbYVRbJumvoCMjOqwUgQzXDSr/Ag0MnlH0dlIup7ra0+186g/Fs56WTvAoGAXmGq\n/OZKYnq2fGSf2mpDBy+5NwLVFc3xxBuKhlBH2vJ65poCIlBydpSNURDZNOpQ0KxC\nGppe8RuSU+pt19XPuTr3wd8SwedmrZg/SDbgWmd0aS1SmJM47qE6MInwNaSpidjD\nR+AbJdbHzQXO4zkuqRLwhTeO+S9vm9y/ZciD9y0CgYALFtNyglat53r62ZjUB1V8\ndhDRjskl1es6c83dzbZOgoAQwSNwlKoaB37Tq5aF+u12+3wiFScFQFU1k3+WbOba\nhSzlTM+wrvezfiLns0JTU9N60iiEWSYmp7PPXEMGj73+2WHbiyTQ5YUtFNsewD4s\n9AWOK/pPKpjZ7nvQEqrzuA==\n-----END PRIVATE KEY-----\n",
  "client_email": "fhome-finance-bot@fhome-finance.iam.gserviceaccount.com",
  "client_id": "114824299587427084035",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fhome-finance-bot%40fhome-finance.iam.gserviceaccount.com"
}''';

  static const _sheetId = '1v5lAuqefqVIKL_1JHEV88L0Vncc6oJ4tmuJ8Wsqsv5s';

  final GSheets _gsheet = GSheets(_credential);

  Spreadsheet _spreadsheet;
  Worksheet _currentMonthSheet;

  Future<void> init() async {
    _spreadsheet ??= await _gsheet.spreadsheet(_sheetId);
    _currentMonthSheet ??= _spreadsheet.worksheetByTitle('Май');
  }

  Future<List<CategoryModel>> getCategories() async {
    await init();

    final categories = await _currentMonthSheet.values.column(2, fromRow: 9, length: 23);

    return categories.map((e) => CategoryModel(name: e)).toList();
  }
}

final _FHomeFinanceSheet fhomeFinanceSheet = _FHomeFinanceSheet();
