plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // O plugin do Flutter deve vir depois de Android e Kotlin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.blackbelthub"

    // Usa as versões do wrapper Flutter
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.blackbelthub"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Java 17 para AGP 8.9.x + Kotlin 2.0.x
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }

    buildTypes {
        release {
            // Assinando com debug só para facilitar o run --release no mock
            signingConfig = signingConfigs.getByName("debug")
            // Se quiser minificar depois:
            // isMinifyEnabled = true
            // proguardFiles(
            //     getDefaultProguardFile("proguard-android-optimize.txt"),
            //     "proguard-rules.pro"
            // )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Mantém o BOM do Kotlin alinhado ao plugin (opcional, mas ajuda)
    implementation(platform("org.jetbrains.kotlin:kotlin-bom:2.0.21"))
}
