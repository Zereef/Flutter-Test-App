// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class Common {
  static String nus;
  static String password;
  static String nome;
  static double height;
  static double width;
  // static FirebaseMessaging firebaseMessaging = FirebaseMessaging();
}

class RecuperarPass {
  static String nus;
  static String mail;
}

class GlobalVariablesFromMenu {
  //use in menu
  static bool menurun;
  static double menuPadding;
  static double menuTextSize;
  static double menuTextSizeSmall;
  static double tamanhoIcon;
  static EdgeInsets padding;
  static double settingsHeight;

  //use in estados
  static double estadosFontSize;
}

//---------------------------------
class EstadosSliderValue {
  //"NULL" default after first use save state
  static double humorLastValue;
  static double ansiedadeLastValue;
  static double sonoLastValue;
  static double apetiteLastValue;
  static double libidoLastValue;
}

class Qualidade {
  //sono
  static bool sonoDificuldadeAdormecer;
  static bool sonoAcordeiCedoNaoAdormeci;
  static bool sonoAcordeiMeioNoite;
  static bool sonoPesadelos;
  static bool sonoDificuldadeAcordar;
  static bool sonoDormiBem;

  //Libido

  //Apetite
  static bool apetiteGula;
  static bool apetiteDoces;
  static bool apetiteSalgados;
  static bool apetiteCheio;
}

class EstadosImagesNav {
  static const String humor_full = 'assets/images/icon_humor_full.png';
  static const String ansiedade_full = 'assets/images/icon_ansiedade_full.png';
  static const String sono_full = 'assets/images/icon_sono_full.png';
  static const String apetite_full = 'assets/images/icon_apetite_full.png';
  static const String libido_full = 'assets/images/icon_libido_full.png';

  static const String humor_mono = 'assets/images/icon_humor_mono.png';
  static const String ansiedade_mono = 'assets/images/icon_ansiedade_mono.png';
  static const String sono_mono = 'assets/images/icon_sono_mono.png';
  static const String apetite_mono = 'assets/images/icon_apetite_mono.png';
  static const String libido_Mono = 'assets/images/icon_libido_mono.png';
}

//---------------------------------
class MeditacaoVariables {
  // static AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  static const String play = 'assets/images/play.png';
  static const String pause = 'assets/images/pause.png';

  static int idMedico;
  static String medico;
  static String imagem;

  static int playingID;
  static bool playing;
}

class MensagensVariables {
  static int idMedico;
  static String medico;
  static String imagem;
}

class MarcacaoVariables {
  static int dia;
  static int mes;
  static int ano;

  static String tipo;
  static String consultaLocal;
  static String consultaEspecialidade;

  static List<dynamic> arraymarcacao = [];
}

class TeleConsultaVariables {
  static bool timerOff;
  static bool timerDoisOff;
}
