
# Proyecto Paso Pacífico

Aplicación móvil para la recolección de basura en colaboración con la ONG Paso Pacífico y Cur-Carazo.

## About Paso Pacifico

Paso Pacifico is a non-profit organization dedicated to environmental conservation in Central America. Its projects focus on biodiversity protection through the creation of wildlife corridors. To achieve this, it collaborates with local communities, landowners, and partner organizations to restore and protect habitats.

## Repositorio del Proyecto

Puedes acceder al código fuente de este proyecto en GitHub:

- [Repositorio paso_pacifico](https://github.com/Jefrey13/paso_pacifico.git)

# Screenshots of the Application

This document showcases various screens of our application to provide a visual overview of its functionality and user interface.

# Screenshots of the Application

This document showcases various screens of our application to provide a visual overview of its functionality and user interface.

## Screenshots

<table>
  <tr>
    <td>
      <img src="https://i.ibb.co/7JXWPPz/welcome.jpg" alt="Welcome Screen" height="400">
      <p>Welcome Screen</p>
    </td>
    <td>
      <img src="https://i.ibb.co/3yymN1y/login.jpg" alt="Login Screen" height="400">
      <p>Login Screen</p>
    </td>
    <td>
      <img src="https://i.ibb.co/CQbyp6Y/create.jpg" alt="Create Account Screen" height="400">
      <p>Create Account Screen</p>
    </td>
    <td>
      <img src="https://i.ibb.co/TTQzw6R/home.jpg" alt="Home Screen" height="400">
      <p>Home Screen</p>
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://i.ibb.co/ZN6Zdr4/setting.jpg" alt="Settings Screen" height="400">
      <p>Settings Screen</p>
    </td>
    <td>
      <img src="https://i.ibb.co/By7cXRw/account.jpg" alt="Profile Screen" height="400">
      <p>Profile Screen</p>
    </td>
        <td>
      <img src="https://i.ibb.co/8zV8sDq/changepassword.jpg" alt="Change Password Screen" height="400">
      <p>Change Password Screen</p>
    </td>
    <td>
      <!-- Empty cell for symmetry -->
    </td>
  </tr>
</table>

---


---

## Estructura del Proyecto

```
lib/
├── authentication/
│   └── widgets/
├── home/
│   └── widgets/
├── profile/
│   └── widgets/
├── reports/
│   └── widgets/
├── shared/
│   └── widgets/
├── waste/
│   └── widgets/
├── welcome/
│   └── widgets/
└── main.dart
```

## Tecnologías Utilizadas

- **Flutter 3.24.4**: Framework de desarrollo para crear interfaces nativas en iOS y Android.
- **Dart 3.5.4**: Lenguaje de programación utilizado en Flutter.
- **Firebase Authentication**: Implementado para la gestión de autenticación de usuarios en la aplicación.


## Colaboradores

Este proyecto ha sido posible gracias a la colaboración de:

- **Marvin Ortiz** - [@MarvinOrtiz18](https://github.com/MarvinOrtiz18) - Desarrollo de la interfaz de usuario y funcionalidad general de la aplicación.
- **Jefrey A. Zuniga** - [@Jefrey13](https://github.com/Jefrey13) 
- **Roland** - [@Roland-FARKER](https://github.com/Roland-FARKER)
- **Paso Pacífico y Cur-Carazo** - ONG colaboradora en la definición de requisitos y Centro Universitario Regional, Carazo - UNAN-Managua, CUR-Carazo.

## Comandos de Flutter

### Comandos básicos

- **Inicializar un nuevo proyecto Flutter**:
  ```bash
  flutter create nombre_proyecto
  ```

- **Ejecutar la aplicación en modo debug**:
  ```bash
  flutter run
  ```

### Comandos para desarrollo

- **Actualizar dependencias**:
  ```bash
  flutter pub get
  ```

- **Limpiar caché del proyecto**:
  ```bash
  flutter clean
  ```

- **Inspeccionar código y obtener sugerencias**:
  ```bash
  flutter analyze
  ```

### Comandos

- **Ver dispositivos conectados**:
  ```bash
  flutter devices
  ```

- **Instalar paquetes adicionales**:
  ```bash
  flutter pub add nombre_paquete
  ```

- **Ejecutar la aplicación en un dispositivo o emulador específico**:
  ```bash
  flutter run -d nombre_dispositivo
  ```

## Licencia

Este proyecto está bajo la licencia Apache-2.0
