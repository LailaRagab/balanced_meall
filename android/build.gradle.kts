allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

//buildscript {
//    dependencies {
//        classpath("com.android.tools.build:gradle:8.2.1")
//        classpath("com.google.gms:google-services:4.4.1")
//    }
//}
//
//plugins {
//    id("com.android.application")
//    id("com.google.gms.google-services")
//    id("org.jetbrains.kotlin.android")
//}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

