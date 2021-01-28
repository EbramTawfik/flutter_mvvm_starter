# Simple Flutter MVVM

Flutter simple MVVM Architecture using only [provider](https://pub.dev/packages/provider).

The Architecture is easy to understand if you are familiar with Angular, WPF MVVM, Xamarin MVVM or any MVVM architecture.

- Views/ViewModels:

  For each View there is a ViewModel and the binding between the View and ViewModel is done using [provider](https://pub.dev/packages/provider) (similar to html/ts files in Angular or Xaml/ ViewModel CSharp).

- Services injection:

  The [providers file](https://github.com/EbramTawfik/flutter_mvvm_starter/blob/main/lib/core/providers.dart) is the holder of all the services that can be injected in the ViewModels. The dependency injection is using [provider](https://pub.dev/packages/provider) (Similar to services concept in Angular)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
