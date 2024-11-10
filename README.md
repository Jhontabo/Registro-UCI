# Registro de Pacientes UCI - Hospital Departamental Universitario de Nariño

Esta aplicación de Flutter ha sido desarrollada para la unidad de cuidados intensivos (U.C.I.) del Hospital Departamental Universitario de Nariño. Su objetivo principal es digitalizar la sábana de enfermería, permitiendo un registro más preciso y accesible de la información de los pacientes en U.C.I. Con esta herramienta, se facilita el monitoreo en tiempo real y la actualización de los datos de los pacientes, optimizando la atención en la unidad.

## Requisitos previos

- Flutter SDK: [Version 3.22.2](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.22.2-stable.zip)
- Una cuenta de Firebase [Link de registro](https://console.firebase.google.com/u/0/)
- Node.js v18 o superior [Guía de Instalación](https://firebase.google.com/docs/cli#install-cli-windows)

## Clonar el Repositorio

Para comenzar, clona este repositorio en tu entorno local:

```bash
git clone https://github.com/cbotina/Registro-UCI.git
```

## Configuración de Firebase

Esta aplicación utiliza Firebase para gestionar la autenticación y la base de datos en tiempo real. Sigue los siguientes pasos para configurar Firebase en el proyecto:

### Paso 1: Instalar Firebase CLI

Si no tienes Firebase CLI instalado, instálalo ejecutando:

```bash
npm install -g firebase-tools
```

### Paso 2: Iniciar sesión en Firebase

Inicia sesión en tu cuenta de Firebase:

```bash
firebase login
```

### Paso 3: Instalar flutterfire cli

```bash
dart pub global activate flutterfire_cli
```

### Paso 4: Configurar Firebase

```bash
flutterfire configure
```

En este paso se debe seleccionar la opción "create a new project" y asignarle un nombre al proyecto. Luego seleccionar como plataformas: web y android, y seguir las instrucciones en consola.

### Paso 5: Instalar dependencias

Ejecuta `flutter pub get` para instalar las dependencias.

## Ejecutar el Proyecto

Una vez configurado Firebase, puedes ejecutar el proyecto localmente siguiendo estos pasos:

### Android

1. Conecta un dispositivo Android o inicia un emulador Android.
2. Ejecuta el siguiente comando:

   ```bash
   flutter run
   ```

## Contribuciones

Las contribuciones al proyecto son bienvenidas. Si deseas contribuir, por favor abre un _pull request_ o crea una _issue_ para discutir cualquier cambio importante antes de enviar el código.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.

---

¡Gracias por contribuir a la digitalización y modernización de la atención médica en la unidad de cuidados intensivos del Hospital Departamental Universitario de Nariño!
