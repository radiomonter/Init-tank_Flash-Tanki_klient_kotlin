import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.9.20"
    application
    id("com.github.johnrengelman.shadow") version "8.1.1"
}

group = "com.tanki.client"
version = "1.0.0"

repositories {
    mavenCentral()
    maven { url = uri("https://oss.sonatype.org/content/repositories/snapshots/") }
    maven { url = uri("https://oss.sonatype.org/content/repositories/releases/") }
}

val gdxVersion = "1.9.10"

dependencies {
    // Kotlin
    implementation("org.jetbrains.kotlin:kotlin-stdlib")

    // Logging
    implementation("ch.qos.logback:logback-classic:1.4.11")

    // Koin DI
    implementation("io.insert-koin:koin-core:3.5.0")

    // LibGDX
    implementation("com.badlogicgames.gdx:gdx:$gdxVersion")
    implementation("com.badlogicgames.gdx:gdx-backend-lwjgl:$gdxVersion")
    implementation("com.badlogicgames.gdx:gdx-platform:$gdxVersion:natives-desktop")
    implementation("com.badlogicgames.gdx:gdx-freetype:$gdxVersion")
    implementation("com.badlogicgames.gdx:gdx-freetype-platform:$gdxVersion:natives-desktop")

    // Testing
    testImplementation("org.jetbrains.kotlin:kotlin-test")
}

application {
    mainClass.set("com.tanki.client.TankiClientKt")
    applicationDefaultJvmArgs = listOf(
        "-Dfile.encoding=UTF-8",
        "-Xmx512m"
    )
}

tasks.named<JavaExec>("run") {
    isIgnoreExitValue = true
}

tasks.shadowJar {
    archiveBaseName.set("tanki-client")
    archiveVersion.set("")
    archiveClassifier.set("")
    manifest {
        attributes["Main-Class"] = "com.tanki.client.TankiClientKt"
    }
    mergeServiceFiles()
}

tasks.register<Exec>("packageExe") {
    dependsOn("shadowJar")
    doFirst {
        delete("build/dist")
    }
    val jpackage = "C:\\Program Files\\Java\\jdk-21\\bin\\jpackage.exe"
    commandLine(
        jpackage,
        "--input", "build/libs",
        "--main-jar", "tanki-client.jar",
        "--main-class", "com.tanki.client.TankiClientKt",
        "--name", "TankiClient",
        "--app-version", "1.0.0",
        "--type", "exe",
        "--dest", "build/dist",
        "--java-options", "-Dfile.encoding=UTF-8",
        "--java-options", "-Xmx512m",
        "--win-dir-chooser",
        "--win-shortcut"
    )
}

tasks.register<Exec>("packagePortable") {
    dependsOn("shadowJar")
    doFirst {
        delete("build/portable")
    }
    val jpackage = "C:\\Program Files\\Java\\jdk-21\\bin\\jpackage.exe"
    commandLine(
        jpackage,
        "--input", "build/libs",
        "--main-jar", "tanki-client.jar",
        "--main-class", "com.tanki.client.TankiClientKt",
        "--name", "TankiClient",
        "--app-version", "1.0.0",
        "--type", "app-image",
        "--dest", "build/portable",
        "--java-options", "-Dfile.encoding=UTF-8",
        "--java-options", "-Xmx512m"
    )
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "17"
}

kotlin {
    jvmToolchain(17)
}
