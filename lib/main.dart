import 'providers/login-providers.dart';
import 'telas/tela-login.dart';
import 'telas/tela-editar-musicas.dart';
import 'package:flutter/material.dart';
import 'telas/tela-form-artistas.dart';
import 'providers/artistas-providers.dart';
import 'providers/musicas-providers.dart';
import 'telas/tela-artistas.dart';
import 'telas/tela-musicas.dart';
import 'telas/tela-form-musicas.dart';
import 'utils/rotas.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ArtistaProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MusicaProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Login(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        routes: {
          Rotas.AUTH: (ctx) => TelaLogin(),
          Rotas.HOME: (ctx) => TelaArtistas(),
          Rotas.FORM_ARTISTA: (ctx) => TelaFormArtista(),
          Rotas.TELA_MUSICAS: (ctx) => TelaMusicas(),
          Rotas.FORM_MUSICAS: (ctx) => TelaFormMusicas(),
          Rotas.EDIT_MUSICAS: (ctx) => TelaEditMusicas(),
        },
        onGenerateRoute: (settings) {
          print(settings.name);
          return null;
        },
        onUnknownRoute: (settings) {
          print("Rota não encontrada");
          return null;
        },
      ),
    );
  }
}
