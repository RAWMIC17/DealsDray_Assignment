# Dealsdray Flutter App

Welcome to the Dealsdray Flutter App repository! This app is developed using Flutter and leverages multiple APIs to deliver a seamless and engaging user experience. Dealsdray’s app enables users to explore products and make informed decisions, featuring intuitive navigation and customized widgets to enhance functionality and accessibility.
Features

    API Integration: The app communicates with various backend APIs to fetch real-time data for dynamic rendering. Current API endpoint for the home page: Dealsdray Home API.
    Custom Widgets: Modular and reusable widgets make UI maintenance and feature scaling easy.
    User Authentication: Secure and streamlined authentication process for a safe and personalized experience.
    Navigation: Smooth navigation flow with BottomNavigationBar and custom animations for a user-friendly interface.
    Product Listings: Displays extensive product lists with details, images, and prices, all fetched dynamically via API.
    Theme Customization: Custom themes for app-wide styling and a visually consistent user interface.

Tech Stack

    Flutter: Framework for UI development and app logic.
    Dart: Core programming language used in Flutter for fast and expressive app building.
    API Integration: Communicates with backend services to dynamically update and render UI components based on server data.

Setup & Installation

    Clone the repository:

git clone https://github.com/yourusername/dealsdray-flutter-app.git
cd dealsdray-flutter-app

Install dependencies:

flutter pub get

Run the app:

    flutter run

Ensure you have an active internet connection as the app fetches data through API calls.
Folder Structure

    lib: Main source code of the app
        screens: Contains screens for various pages such as Home, Product Details, and Profile.
        widgets: Reusable UI components like product cards, navigation bars, etc.
        models: Data models for API responses.
        services: Handles API calls and data fetching.
        utils: Utility files for theme management, constants, etc.
