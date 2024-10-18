# flutter_pokemon_riverpod

 Proyecto de Flutter de aplicación de Pokémon utilizando Riverpod para la gestión del estado y clean architecture para una mejor organización del código.

## Instrucciones de Configuración y Ejecución

Flutter: 3.22.2
Dart: 3.4.3

Sigue las instrucciones de [Flutter](https://flutter.dev/) para una correcta instalación.

### Instalación

1. Clona este repositorio en tu maquina local con comando o directamente desde github.

   ```bash
   git clone https://github.com/tu-usuario/flutter_pokemon_riverpod.git
   cd flutter_pokemon_riverpod
   ```

2. Instala las dependencias.
   
   ```bash
   flutter pub get
   ```

### Ejecución

1. Conecta un celular o inicia un emulador con Android Studio.

2. Ejecuta la aplicacion

   ```bash
   flutter run
   ```

### Estructura del Proyecto

El proyecto sigue clean architecture, dividiendo el código en capas bien definidas:

- **Presentación**: Contiene widgets de Flutter y lógica de UI.
- **Dominio**: Define las entidades y casos de uso.
- **Datos**: Implementa repositorios y fuentes de datos (locales y remotas).