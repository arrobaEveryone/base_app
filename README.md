# <img src="https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_flutter_icon_130599.png" width="35"/> Base App: Reusable Components and Centralized Architecture

Here you'll find an organized collection of reusable components, a common architecture, and examples to speed up the development.

---

## Repository Structure

- **🏛️ architecture**: This folder contains the common architecture we follow in our Flutter projects, organized into three clean subfolders:

  - **🌐 NetworkManager**: Controls API calls.
 
  - **🧱 domain**: Contains the base model that all other models must extend for better app performance, along with the base use case ready to receive parameters and return the `Result` object.
    
  - **🖥️ presentation**: Includes two folders:
    - **🔲 bloc**: Contains the base event, base state, and the base bloc ready to execute use cases and attach to a base page defined in the `page` folder.
    - **📄 page**: Holds two files:
      - **📑 Base Scaffold Page**: A stateful widget ready to use a specific bloc, with methods to override like top bar, bottom bar, content, etc., all of which change whenever the state of the bloc changes. Use these methods to build a page with scaffold.
      - **📄 Content Page**: Similar to the Base Scaffold Page but with only a content.

- **🔧 components**: Here lies a variety of reusable components we've developed for various purposes in our applications. From custom buttons to complex widgets, you'll find everything you need to build beautiful and functional user interfaces.

- **🚀 examples**: This folder contains code examples illustrating how to use our components and follow our architecture in your own projects. These examples cover a wide range of use cases and will help you integrate our solutions into your code quickly.

---

## Functionality

Our goal with this repository is to provide a solid and consistent foundation for Flutter application development. By centralizing our reusable components and following a common architecture, we aim to accelerate the development process and improve the quality of our applications.

## How to Import

To import the components or architecture into the Flutter project from GitHub, follow these steps:

### 1. Update `pubspec.yaml`

Add the following lines to your `pubspec.yaml` file:

#### For Components:

```yaml
dependencies:
  flutter:
    sdk: flutter
  base_components:
    git:
      url: https://github.com/arrobaEveryone/base_app.git
      ref: 800c00dd33d590643613e07e24e47478a893a128
      path: packages/base_components
```

#### For Architecture:

```yaml
dependencies:
  flutter:
    sdk: flutter
  base_architecture:
    git:
      url: https://github.com/arrobaEveryone/base_app.git
      ref: 800c00dd33d590643613e07e24e47478a893a128
      path: packages/base_architecture
```
