# Registro UCI 🏥

### Sistema digital de registro clínico para la Unidad de Cuidados Intensivos
**Hospital Departamental Universitario de Nariño**

---

## 📋 Descripción

**Registro UCI** es una aplicación móvil multiplataforma desarrollada en **Flutter** que digitaliza la **sábana de enfermería** de la Unidad de Cuidados Intensivos, reemplazando el registro en papel por un sistema preciso, accesible y en tiempo real.

Su objetivo principal es facilitar el monitoreo y la actualización continua de los datos de los pacientes, optimizando la atención en la unidad.

### ✨ Funcionalidades principales

- 🔐 **Autenticación con roles** — admin, jefe de enfermería, auxiliar, médico, nutricionista e invitado
- 🛏️ **Gestión de ingresos** — crear, listar y editar ingresos de pacientes
- 📝 **Registros diarios** — evolución diaria por paciente
- ❤️ **Monitoría hemodinámica** — gráficas interactivas (TA sistólica/diastólica/media, FC, FR, SpO₂, etc.)
- 💧 **Balance de líquidos** — control de líquidos administrados y balances
- 💊 **Tratamiento antibiótico** — administración por días y dosis
- 🔌 **Dispositivos** — seguimiento de catéteres, marcapasos y sondas
- 😴 **Control clínico** — sedación, riesgos y cambios de posición
- 🍎 **Necesidades** — nutrición e higiene
- ✍️ **Firmas digitales** y procedimientos especiales

---

## 📸 Capturas de pantalla

| Listado de pacientes | Ingreso de paciente | Datos personales |
|:---:|:---:|:---:|
| ![Listado de pacientes](assets/listado%20de%20pacientes.png) | ![Ingreso de paciente](assets/ingreso%20paciente.png) | ![Datos personales](assets/Datos%20personales.png) |

---

## 🛠️ Tecnologías utilizadas

| Categoría | Tecnología |
|---|---|
| Framework | Flutter 3.22+ / Dart 3.4 |
| Gestión de estado | Riverpod (`hooks_riverpod`, `flutter_riverpod`) |
| Backend | Firebase (Auth + Cloud Firestore) |
| Modelos | `freezed` + `json_serializable` (modelos inmutables) |
| Gráficas | `fl_chart` |
| Internacionalización | `intl` + `flutter_localizations` (español) |
| Arquitectura | Clean Architecture por capas (data → domain → presentation) |

### Dependencias principales

```yaml
firebase_core, firebase_auth, cloud_firestore   # Backend en la nube
hooks_riverpod, flutter_riverpod                # Gestión de estado
freezed_annotation, json_annotation             # Modelos inmutables y serialización
fl_chart                                        # Gráficas de monitoría hemodinámica
intl                                            # Formato de fechas y números
```

---

## 🚀 Requisitos previos

- Flutter SDK: [Versión 3.22.2](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.22.2-stable.zip)
- Una cuenta de Firebase — [Link de registro](https://console.firebase.google.com/u/0/)
- Firebase CLI — [Guía de instalación](https://firebase.google.com/docs/cli#install-cli-windows)

## 📦 Clonar el repositorio

Para comenzar, clona este repositorio en tu entorno local:

```bash
git clone https://github.com/Jhontabo/Registro-UCI.git
```

## 🔥 Configuración de Firebase

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

### Paso 3: Instalar FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

### Paso 4: Configurar Firebase

```bash
flutterfire configure
```

En este paso se debe seleccionar la opción **"create a new project"**, asignarle un nombre al proyecto, seleccionar como plataformas **web** y **android**, y seguir las instrucciones en consola.

### Paso 5: Instalar dependencias

```bash
flutter pub get
```

---

## ▶️ Ejecutar el proyecto

Una vez configurado Firebase, puedes ejecutar el proyecto localmente:

### Android

1. Conecta un dispositivo Android o inicia un emulador.
2. Ejecuta:

   ```bash
   flutter run
   ```

---

## 🤝 Contribuciones

Las contribuciones al proyecto son bienvenidas. Si deseas contribuir, por favor abre un _pull request_ o crea una _issue_ para discutir cualquier cambio importante antes de enviar el código.

## 📄 Licencia

Este proyecto es de código abierto.

---

¡Gracias por contribuir a la digitalización y modernización de la atención médica en la unidad de cuidados intensivos del Hospital Departamental Universitario de Nariño! 💙
