import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'hi'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'tnbtg79b': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड में स्विच करें',
    },
    't8qzm07k': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड में स्विच करें',
    },
    'kx0ph5i4': {
      'en': 'Welcome To Your Supply Chain BlockChain',
      'hi': 'आपकी आपूर्ति श्रृंखला ब्लॉकचेन में आपका स्वागत है',
    },
    'bh6d3xn6': {
      'en': 'Manufacturer',
      'hi': 'उत्पादक',
    },
    'aj0y0udm': {
      'en': 'Other',
      'hi': 'अन्य',
    },
    'nnqtkk2f': {
      'en': 'Select App Language:',
      'hi': 'ऐप भाषा चुनें:',
    },
    'fm1zywu6': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
    },
    'tglejnp0': {
      'en': 'Hindi',
      'hi': 'हिन्दी',
    },
    'hrgt6ijn': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Login
  {
    'u8txjrzt': {
      'en': 'Sign in with Google',
      'hi': 'Google के साथ साइन इन करें',
    },
    'ejz0py8u': {
      'en': 'Sign in with Apple',
      'hi': 'ऐप्पल के साथ साइन इन करें',
    },
    'k06w6ydw': {
      'en': 'Select App Language:',
      'hi': 'ऐप भाषा चुनें:',
    },
    'rm487tzs': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
    },
    'ygpwhzwx': {
      'en': 'Hindi',
      'hi': 'हिन्दी',
    },
    'd6pu7p4l': {
      'en': 'Authenticate Yourself',
      'hi': 'अपने आप को प्रमाणित करें',
    },
    'ga3973k1': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ProductListing
  {
    'h0r9y8gw': {
      'en': 'Product Listing',
      'hi': 'उत्पाद लिस्टिंग',
    },
    'cnxdvw0k': {
      'en': 'Enter Product Name',
      'hi': 'उत्पाद का नाम दर्ज करें',
    },
    '1rj3ahm7': {
      'en': 'Create New Product Blockchain',
      'hi': 'नया उत्पाद ब्लॉकचेन बनाएं',
    },
    '5ihd66he': {
      'en': 'Field is required',
      'hi': 'क्षेत्र की आवश्यकता है',
    },
    'iictybkk': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // AddBlockPage
  {
    'kouusmt8': {
      'en': 'Submit',
      'hi': 'प्रस्तुत',
    },
    'u9spf1rj': {
      'en': 'Product ID: ',
      'hi': 'उत्पाद आयडी:',
    },
    'a3rxb6ri': {
      'en': 'Key',
      'hi': 'चाबी',
    },
    'pyg22l6b': {
      'en': 'Value',
      'hi': 'मूल्य',
    },
    'bwt942ea': {
      'en': 'Field is required',
      'hi': 'क्षेत्र की आवश्यकता है',
    },
    'xpksg4dx': {
      'en': 'Field is required',
      'hi': 'क्षेत्र की आवश्यकता है',
    },
    '9phgp5ra': {
      'en': 'Add New Data Field',
      'hi': 'नया डेटा फ़ील्ड जोड़ें',
    },
    'mwxwlpy2': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
    },
    'ffrk6xpd': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ManageProduct
  {
    'f1rwtybp': {
      'en': 'Enter UID',
      'hi': 'यूआईडी दर्ज करें',
    },
    'o4j1wxok': {
      'en': 'Add Entity',
      'hi': 'इकाई जोड़ें',
    },
    '660qdqi8': {
      'en': 'Add Block',
      'hi': 'ब्लॉक जोड़ें',
    },
    'f7kz2rl5': {
      'en': 'Validate SupplyChain',
      'hi': 'आपूर्ति श्रृंखला को मान्य करें',
    },
    '61147oxk': {
      'en': 'View SupplyChain Data',
      'hi': 'आपूर्ति श्रृंखला डेटा देखें',
    },
    'bfeghgpb': {
      'en': 'Delete Product',
      'hi': 'उत्पाद हटाएं',
    },
    'mx28tw24': {
      'en': 'Manage Product',
      'hi': 'उत्पाद प्रबंधित करें',
    },
    'k92jafrc': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // BlockValidityCheck
  {
    '18h2bdl4': {
      'en': 'Validity Check',
      'hi': 'वैधता जांच',
    },
    'jcawery9': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // BlockDataViewer
  {
    '5anx59r5': {
      'en': 'Data Viewer',
      'hi': 'डेटा व्यूअर',
    },
    'vpion3ai': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Miscellaneous
  {
    '0za7qcky': {
      'en': '',
      'hi': '',
    },
    '9jxv7g6g': {
      'en': '',
      'hi': '',
    },
    'qdko8tzo': {
      'en': '',
      'hi': '',
    },
    'ceqocy55': {
      'en': '',
      'hi': '',
    },
    'd760wemt': {
      'en': '',
      'hi': '',
    },
    '3feyya03': {
      'en': '',
      'hi': '',
    },
    '09vt8wx8': {
      'en': '',
      'hi': '',
    },
    '3nyq9oi0': {
      'en': '',
      'hi': '',
    },
    'wxdqpl8o': {
      'en': '',
      'hi': '',
    },
    'm81wg5zf': {
      'en': '',
      'hi': '',
    },
    'hsh1z067': {
      'en': '',
      'hi': '',
    },
    'sxbqx7cb': {
      'en': '',
      'hi': '',
    },
    '7pakm2fm': {
      'en': '',
      'hi': '',
    },
    '0e76pufq': {
      'en': '',
      'hi': '',
    },
    'dsaloqvw': {
      'en': '',
      'hi': '',
    },
    '3c5xrbfs': {
      'en': '',
      'hi': '',
    },
    '6admm0pv': {
      'en': '',
      'hi': '',
    },
    '8donbtqa': {
      'en': '',
      'hi': '',
    },
    'yjrfmgh2': {
      'en': '',
      'hi': '',
    },
    'jlsaudtw': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
